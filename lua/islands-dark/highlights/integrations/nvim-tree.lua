local M = {}

--- Load nvim-tree highlights
--- @param c theme.Colors Color palette
--- @return table Highlight groups for nvim-tree
function M.get(c)
	return {
		NvimTreeNormal = { fg = c.fg, bg = c.none },
		NvimTreeWinSeparator = { fg = c.border, bg = c.none },

		NvimTreeRootFolder = { link = "NvimTreeFolderName", fg = c.fg_dim },

		NvimTreeFolderName = { fg = c.fg },
		NvimTreeFolderIcon = { fg = c.fg, bold = true },
		NvimTreeEmptyFolderName = { link = "NvimTreeFolderName" },
		NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },

		NvimTreeOpenedFile = { fg = c.fg },
		NvimTreeSpecialFile = {},
		NvimTreeExecFile = { fg = c.keyword },
		NvimTreeImageFile = { fg = c.constant },
		NvimTreeSymlink = { fg = c.hyperlink, underline = true },

		NvimTreeGitDirty = { fg = c.vcs_changed },
		NvimTreeGitDirtyIcon = { link = "NvimTreeGitDirty" },
		NvimTreeGitStaged = { fg = c.vcs_changed },
		NvimTreeGitStagedIcon = { link = "NvimTreeGitStaged" },
		NvimTreeGitMerge = { fg = c.vcs_merged },
		NvimTreeGitMergeIcon = { link = "NvimTreeGitMerge" },
		NvimTreeGitRenamed = { fg = c.vcs_changed },
		NvimTreeGitRenamedIcon = { link = "NvimTreeGitRenamed" },
		NvimTreeGitNew = { fg = c.vcs_added },
		NvimTreeGitNewIcon = { link = "NvimTreeGitNew" },
		NvimTreeGitDeleted = { fg = c.vcs_removed },
		NvimTreeGitDeletedIcon = { link = "NvimTreeGitDeleted" },
		NvimTreeGitIgnored = { fg = c.vcs_ignored },
		NvimTreeGitIgnoredIcon = { link = "NvimTreeGitIgnored" },

		NvimTreeIndentMarker = { fg = c.fg_dimmer },

		NvimTreeWindowPicker = { bg = c.info, bold = true },

		NvimTreeStatusLineNC = { fg = c.fg_dim, bg = c.bg_alt },
	}
end

return M
