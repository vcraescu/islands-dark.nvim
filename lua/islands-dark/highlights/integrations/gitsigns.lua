local M = {}

--- Load gitsigns highlights
--- @param c table Color palette
--- @return table Highlight groups for gitsigns plugin
function M.get(c)
	return {
		GitSignsAdd = { fg = c.string, bg = c.none },
		GitSignsChange = { fg = c.warning, bg = c.none },
		GitSignsDelete = { fg = c.error, bg = c.none },
		GitSignsAddLn = { bg = c.vcs_added },
		GitSignsChangeLn = { bg = c.vcs_modified },
		GitSignsDeleteLn = { bg = c.vcs_removed },
		GitSignsAddNr = { fg = c.string, bg = c.none },
		GitSignsChangeNr = { fg = c.warning, bg = c.none },
		GitSignsDeleteNr = { fg = c.error, bg = c.none },
		GitSignsAddInline = { bg = c.vcs_added },
		GitSignsChangeInline = { bg = c.vcs_modified },
		GitSignsDeleteInline = { bg = c.vcs_removed },
		GitSignsCurrentLineBlame = { fg = c.fg_dimmer },
	}
end

return M
