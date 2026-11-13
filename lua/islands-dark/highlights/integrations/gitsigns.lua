local M = {}

--- Get GitSigns highlight groups
--- @param c theme.Colors Color palette
--- @return theme.Highlights
function M.get(c)
	return {
		GitSignsAdd = { fg = c.changes.add.fg, bg = c.changes.add.line_bg },
		GitSignsChange = { fg = c.changes.change.fg, bg = c.changes.change.line_bg },
		GitSignsDelete = { fg = c.changes.delete.fg, bg = c.changes.delete.line_bg },
		GitSignsTopdelete = { link = "GitSignsDelete" },
		GitSignsChangedelete = { link = "GitSignsDelete" },
		GitSignsAddLn = { bg = c.changes.add.line_bg },
		GitSignsChangeLn = { bg = c.changes.change.line_bg },
		GitSignsDeleteVirtLn = { bg = c.changes.delete.line_bg },
		GitSignsDeletePreview = { link = "GitSignsDeleteVirtLn" },
		GitSignsAddInline = { bg = c.changes.add.text_bg },
		-- Preview replacements are inside added lines.
		GitSignsChangeInline = { link = "GitSignsAddInline" },
		GitSignsDeleteInline = { bg = c.changes.delete.text_bg },
		-- Buffer word diffs are inside changed lines.
		GitSignsAddLnInline = { link = "GitSignsChangeLnInline" },
		GitSignsChangeLnInline = { bg = c.changes.change.text_bg },
		GitSignsDeleteLnInline = { link = "GitSignsChangeLnInline" },
		GitSignsDeleteVirtLnInLine = { link = "GitSignsDeleteInline" },
		GitSignsCurrentLineBlame = { link = "Ignore" },
	}
end

return M
