local M = {}

--- Load nvim-tree highlights
--- @param c theme.Colors Color palette
--- @return table Highlight groups for nvim-tree
function M.get(c)
	return {
		NvimTreeNormal = { fg = c.fg, bg = c.none },
		NvimTreeWinSeparator = { fg = c.border, bg = c.none },

		NvimTreeRootFolder = { link = "NvimTreeFolderName", fg = c.fg_dim },

		NvimTreeFolderName = { fg = c.fg, bold = true },
		NvimTreeFolderIcon = { fg = c.fg, bold = true },
		NvimTreeEmptyFolderName = { link = "NvimTreeFolderName" },
		NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },

		NvimTreeOpenedFile = { fg = c.fg },
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

		NvimTreeIndentMarker = { fg = c.fg_dimmer },

		NvimTreeWindowPicker = { bg = c.info, bold = true },

		NvimTreeStatusLineNC = { fg = c.fg_dim, bg = c.bg_alt },
	}
end

return M
