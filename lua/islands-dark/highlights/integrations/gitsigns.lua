local M = {}

--- Load gitsigns highlights
--- @param c theme.Colors Color palette
--- @return table Highlight groups for gitsigns plugin
function M.get(c)
	return {
		GitSignsAdd = { fg = c.vcs_added, bg = c.none },
		GitSignsChange = { fg = c.vcs_changed, bg = c.none },
		GitSignsDelete = { fg = c.vcs_removed, bg = c.none },
		GitSignsAddInline = { bg = c.vcs_added },
		GitSignsChangeInline = { bg = c.vcs_added },
		GitSignsDeleteInline = { bg = c.vcs_removed },
		GitSignsCurrentLineBlame = { fg = c.vcs_ignored },
	}
end

return M
