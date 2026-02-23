-- Utility functions for Islands Dark theme

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
---@param colors table Base color palette
---@param config table User configuration
---@return table Modified color palette
function M.apply_overrides(colors, config)
	if config.transparent then
		colors.bg = "NONE"
		colors.bg_alt = "NONE"
		colors.bg_dark = "NONE"
		colors.gutter = "NONE"
	end

	return colors
end

-- Get style options from config
-- @param config table User configuration
-- param style_type string Style type (comments, keywords, functions, etc.)
-- @return function Function that takes highlight options and returns merged options with style applied
function M.get_style(config, style_type)
	if not config.styles or not config.styles[style_type] then
		return {}
	end

	local style = {}
	local user_style = config.styles[style_type]

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

	return function(opts)
		return vim.tbl_deep_extend("force", opts, style)
	end
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
