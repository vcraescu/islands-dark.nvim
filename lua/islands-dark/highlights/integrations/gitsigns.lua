local M = {}

--- Get GitSigns highlight groups
--- @param c theme.Colors Color palette
--- @return theme.Highlights
function M.get(c)
	return {
		GitSignsAdd = { fg = c.changes.add.fg, bg = c.none },
		GitSignsChange = { fg = c.changes.change.fg, bg = c.none },
		GitSignsDelete = { fg = c.changes.delete.fg, bg = c.none },
		GitSignsAddLn = { bg = c.changes.add.line_bg },
		GitSignsChangeLn = { bg = c.changes.change.line_bg },
		GitSignsDeleteVirtLn = { bg = c.changes.delete.line_bg },
		GitSignsDeletePreview = { link = "GitSignsDeleteVirtLn" },
		GitSignsAddInline = { bg = c.changes.add.text_bg, fg = c.changes.add.text_fg },
		-- Preview replacements are inside added lines.
		GitSignsChangeInline = { link = "GitSignsAddInline" },
		GitSignsDeleteInline = { bg = c.changes.delete.text_bg, fg = c.changes.delete.text_fg },
		-- Buffer word diffs are inside changed lines.
		GitSignsAddLnInline = { link = "GitSignsChangeLnInline" },
		GitSignsChangeLnInline = { bg = c.changes.change.text_bg, fg = c.changes.change.text_fg },
		GitSignsDeleteLnInline = { link = "GitSignsChangeLnInline" },
		GitSignsDeleteVirtLnInLine = { link = "GitSignsDeleteInline" },
		GitSignsCurrentLineBlame = { fg = c.git_ignore },
	}
end

return M
