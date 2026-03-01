local M = {}

--- Get GitSigns highlight groups
--- @param c theme.Colors Color palette
--- @return theme.Highlights
function M.get(c)
	return {
		GitSignsAdd = { fg = c.git_add, bg = c.none },
		GitSignsChange = { fg = c.git_change, bg = c.none },
		GitSignsDelete = { fg = c.git_delete, bg = c.none },
		GitSignsAddInline = { bg = c.git_add },
		GitSignsChangeInline = { bg = c.git_add },
		GitSignsDeleteInline = { bg = c.git_delete },
		GitSignsCurrentLineBlame = { fg = c.git_ignore },
	}
end

return M
