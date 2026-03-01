local M = {
	styles_cache = {},
}

--- Load highlight groups
---@param groups theme.Highlights Table of highlight groups and their options
function M.load_highlights(groups)
	for group, opts in pairs(groups) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

--- Apply configuration overrides to colors
---@param colors theme.Colors Base color palette
---@param config theme.Config User configuration
---@return theme.Colors
function M.apply_overrides(colors, config)
	if config.transparent then
		colors.base = colors.none
	end

	return colors
end

-- Get style options from config
--- @param opts theme.Config User configuration
--- @param style_type theme.StyleType
--- @return fun(opts: vim.api.keyset.highlight): vim.api.keyset.highlight
function M.get_style(opts, style_type)
	opts = opts or {}

	if not opts.styles or not opts.styles[style_type] then
		return function(hl)
			return hl
		end
	end

	local style = {}
	local user_style = opts.styles[style_type]

	if user_style.bold then
		style.bold = true
	end

	if user_style.italic then
		style.italic = true
	end

	if user_style.underline then
		style.underline = true
	end

	if user_style.undercurl then
		style.undercurl = true
	end

	if user_style.strikethrough then
		style.strikethrough = true
	end

	return function(hl)
		if hl.link then
			return hl
		end

		return vim.tbl_deep_extend("force", hl, style)
	end
end

--- @param opts theme.Config User configuration
--- @return theme.Styles
function M.get_styles(opts)
	local cache_key = vim.inspect(opts.styles or {})

	if M.styles_cache[cache_key] then
		return M.styles_cache[cache_key]
	end

	M.styles_cache[cache_key] = {
		comments = M.get_style(opts, "comments"),
		functions = M.get_style(opts, "functions"),
		keywords = M.get_style(opts, "keywords"),
		variables = M.get_style(opts, "variables"),
	}

	return M.styles_cache[cache_key]
end

return M
