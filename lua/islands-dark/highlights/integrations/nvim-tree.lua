local M = {}

--- Load nvim-tree highlights
--- @param c table Color palette
--- @return table Highlight groups for nvim-tree
function M.get(c)
	return {
		NvimTreeNormal = { fg = c.fg, bg = c.none },
		NvimTreeNormalNC = { fg = c.fg, bg = c.none },
		NvimTreeEndOfBuffer = { fg = c.bg, bg = c.none },
		NvimTreeVertSplit = { fg = c.border, bg = c.none },
		NvimTreeWinSeparator = { fg = c.border, bg = c.none },
		NvimTreeCursorLine = { bg = c.cursor_line },
		NvimTreeCursorLineNr = { fg = c.line_number_current, bg = c.cursor_line },

		NvimTreeRootFolder = { fg = c.fg_dim, bold = true },

		NvimTreeFolderName = { fg = c.fg, bold = true },
		NvimTreeFolderIcon = { fg = c.fg, bold = true },
		NvimTreeEmptyFolderName = { fg = c.fg, bold = true },
		NvimTreeOpenedFolderName = { fg = c.fg, bold = true },
		NvimTreeSymlinkFolderName = { fg = c.hyperlink, bold = true },

		NvimTreeFileIcon = { fg = c.fg },
		NvimTreeFileName = { fg = c.fg },
		NvimTreeExecFile = { fg = c.string, bold = true },
		NvimTreeOpenedFile = { fg = c.fg, bold = true },
		NvimTreeSpecialFile = { fg = c.constant },
		NvimTreeImageFile = { fg = c.constant },
		NvimTreeSymlink = { fg = c.hyperlink },

		NvimTreeGitDirty = { fg = c.func },
		NvimTreeGitStaged = { fg = c.string },
		NvimTreeGitMerge = { fg = c.error },
		NvimTreeGitRenamed = { fg = c.warning },
		NvimTreeGitNew = { fg = c.string },
		NvimTreeGitDeleted = { fg = c.error },
		NvimTreeGitIgnored = { fg = c.comment },

		NvimTreeLspDiagnosticsError = { fg = c.error },
		NvimTreeLspDiagnosticsWarning = { fg = c.warning },
		NvimTreeLspDiagnosticsInformation = { fg = c.info },
		NvimTreeLspDiagnosticsHint = { fg = c.hint },

		NvimTreeIndentMarker = { fg = c.fg, bold = true },

		NvimTreeWindowPicker = { bg = c.info, bold = true },

		NvimTreeStatusLine = { fg = c.fg, bg = c.bg_alt },
		NvimTreeStatusLineNC = { fg = c.fg_dim, bg = c.bg_alt },
		NvimTreeBookmark = { fg = c.constant },
		NvimTreeModifiedFile = { fg = c.warning },

		NvimTreeGitDirtyIcon = { fg = c.func },
		NvimTreeGitStagedIcon = { fg = c.string },
		NvimTreeGitMergeIcon = { fg = c.error },
		NvimTreeGitRenamedIcon = { fg = c.warning },
		NvimTreeGitNewIcon = { fg = c.string },
		NvimTreeGitDeletedIcon = { fg = c.error },
	}
end

return M
