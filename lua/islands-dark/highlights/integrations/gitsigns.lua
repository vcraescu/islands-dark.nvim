local M = {}

--- Load gitsigns highlights
--- @param c table Color palette
--- @return table Highlight groups for gitsigns plugin
function M.get(c)
	return {
		GitSignsAdd = { fg = c.diff_add, bg = c.none },
		GitSignsChange = { fg = c.diff_change, bg = c.none },
		GitSignsDelete = { fg = c.diff_remove, bg = c.none },
		GitSignsAddInline = { bg = c.diff_add },
		GitSignsChangeInline = { bg = c.diff_change },
		GitSignsDeleteInline = { bg = c.diff_remove },
		GitSignsCurrentLineBlame = { fg = c.fg_dimmer },
	}
end

return M
