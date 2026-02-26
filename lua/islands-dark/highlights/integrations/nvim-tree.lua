local M = {}

--- Load nvim-tree highlights
--- @param c theme.Colors Color palette
--- @return table Highlight groups for nvim-tree
function M.get(c)
	return {
		NvimTreeNormal = { fg = c.text3, bg = c.none },
		NvimTreeWinSeparator = { fg = c.border, bg = c.none },

		NvimTreeRootFolder = { fg = c.comment },

		NvimTreeFolderName = { link = "NvimTreeNormal" },
		NvimTreeFolderIcon = { link = "NvimTreeNormal" },
		NvimTreeEmptyFolderName = { link = "NvimTreeFolderName" },
		NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },

		NvimTreeOpenedFile = { link = "NvimTreeNormal" },
		NvimTreeSpecialFile = { link = "NvimTreeNormal" },
		NvimTreeExecFile = { fg = c.keyword },
		NvimTreeImageFile = { fg = c.constant },
		NvimTreeSymlink = { fg = c.link, underline = true },

		NvimTreeGitDirty = { fg = c.git_change },
		NvimTreeGitDirtyIcon = { link = "NvimTreeGitDirty" },
		NvimTreeGitStaged = { fg = c.git_change },
		NvimTreeGitStagedIcon = { link = "NvimTreeGitStaged" },
		NvimTreeGitMerge = { fg = c.purple1 },
		NvimTreeGitMergeIcon = { link = "NvimTreeGitMerge" },
		NvimTreeGitRenamed = { fg = c.git_change },
		NvimTreeGitRenamedIcon = { link = "NvimTreeGitRenamed" },
		NvimTreeGitNew = { fg = c.git_add },
		NvimTreeGitNewIcon = { link = "NvimTreeGitNew" },
		NvimTreeGitDeleted = { fg = c.git_delete },
		NvimTreeGitDeletedIcon = { link = "NvimTreeGitDeleted" },
		NvimTreeGitIgnored = { fg = c.git_ignore },
		NvimTreeGitIgnoredIcon = { link = "NvimTreeGitIgnored" },

		NvimTreeCursorLine = { bg = c.base3 },

		NvimTreeIndentMarker = { fg = c.comment },

		NvimTreeWindowPicker = { bg = c.base3, bold = true },

		NvimTreeStatusLineNC = { fg = c.comment, bg = c.visual },
	}
end

return M
