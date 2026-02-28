local M = {}

--- Set highlight group
---@param group string Highlight group name
---@param opts table Highlight options (fg, bg, sp, bold, italic, underline, undercurl, strikethrough, etc.)
function M.highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

--- Load highlight groups
---@param groups table Table of highlight groups { group_name = opts }
function M.load_highlights(groups)
	for group, opts in pairs(groups) do
		M.highlight(group, opts)
	end
end

--- Apply configuration overrides to colors
---@param colors theme.Colors Base color palette
---@param config theme.Config User configuration
---@return table Modified color palette
function M.apply_overrides(colors, config)
	if config.transparent then
		colors.base = colors.none
	end

	return colors
end

-- Get style options from config
--- @param opts theme.Config User configuration
--- @param style_type string Style type (comments, keywords, functions, etc.)
--- @return function Function that takes highlight options and returns merged options with style applied
function M.get_style(opts, style_type)
	opts = opts or {}

	if not opts.styles or not opts.styles[style_type] then
		return function(o)
			return o
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

	return function(o)
		return vim.tbl_deep_extend("force", o, style)
	end
end

function M.get_styles(opts)
	return {
		comments = M.get_style(opts, "comments"),
		keywords = M.get_style(opts, "keywords"),
		functions = M.get_style(opts, "functions"),
		variables = M.get_style(opts, "variables"),
		strings = M.get_style(opts, "strings"),
		constants = M.get_style(opts, "constants"),
	}
end

--- Merge two tables deeply
---@param base table Base table
---@param override table Override table
---@return table Merged table
function M.deep_merge(base, override)
	local result = vim.deepcopy(base)

	for key, value in pairs(override) do
		if type(value) == "table" and type(result[key]) == "table" then
			result[key] = M.deep_merge(result[key], value)
		else
			result[key] = value
		end
	end

	return result
end

return M
