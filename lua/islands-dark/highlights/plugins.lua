-- Plugin-specific highlights for Islands Dark theme

local M = {}

--- Setup plugin highlights
--- @param c table Color palette
--- @return table Highlight groups for plugins
function M.setup(c)
	local highlights = {}

	-- ============================================================================
	-- nvim-cmp
	-- ============================================================================
	highlights.CmpItemMenu = { fg = c.fg, bg = c.none }
	highlights.CmpItemAbbr = { fg = c.fg, bg = c.none }
	highlights.CmpItemAbbrMatch = { fg = c.keyword, bg = c.none }
	highlights.CmpItemAbbrMatchFuzzy = { fg = c.keyword, bg = c.none }
	highlights.CmpBorder = { fg = c.border, bg = c.none }

	-- ============================================================================
	-- blink.cmp
	-- ============================================================================
	highlights.BlinkCmpMenu = { fg = c.fg, bg = c.none }
	highlights.BlinkCmpMenuBorder = { fg = c.border, bg = c.none }
	highlights.BlinkCmpMenuSelection = { fg = c.fg, bg = c.visual }
	highlights.BlinkCmpScrollBarThumb = { bg = c.border }
	highlights.BlinkCmpScrollBarGutter = { bg = c.none }

	highlights.BlinkCmpLabel = { fg = c.fg, bg = c.none }
	highlights.BlinkCmpLabelDeprecated = { fg = c.deprecated, bg = c.none }
	highlights.BlinkCmpLabelMatch = { fg = c.keyword, bg = c.none, bold = true }
	highlights.BlinkCmpLabelDetail = { fg = c.fg_dim, bg = c.none }
	highlights.BlinkCmpLabelDescription = { fg = c.fg_dim, bg = c.none }

	highlights.BlinkCmpKind = { fg = c.type, bg = c.none }
	highlights.BlinkCmpKindClass = { fg = c.type, bg = c.none }
	highlights.BlinkCmpKindColor = { fg = c.constant, bg = c.none }
	highlights.BlinkCmpKindConstant = { fg = c.constant, bg = c.none }
	highlights.BlinkCmpKindConstructor = { fg = c.type, bg = c.none }
	highlights.BlinkCmpKindEnum = { fg = c.type, bg = c.none }
	highlights.BlinkCmpKindEnumMember = { fg = c.enum_member, bg = c.none }
	highlights.BlinkCmpKindEvent = { fg = c.constant, bg = c.none }
	highlights.BlinkCmpKindField = { fg = c.field, bg = c.none }
	highlights.BlinkCmpKindFile = { fg = c.fg, bg = c.none }
	highlights.BlinkCmpKindFolder = { fg = c.identifier, bg = c.none }
	highlights.BlinkCmpKindFunction = { fg = c.func, bg = c.none }
	highlights.BlinkCmpKindInterface = { fg = c.type, bg = c.none }
	highlights.BlinkCmpKindKeyword = { fg = c.keyword, bg = c.none }
	highlights.BlinkCmpKindMethod = { fg = c.method, bg = c.none }
	highlights.BlinkCmpKindModule = { fg = c.type, bg = c.none }
	highlights.BlinkCmpKindOperator = { fg = c.operator, bg = c.none }
	highlights.BlinkCmpKindProperty = { fg = c.property, bg = c.none }
	highlights.BlinkCmpKindReference = { fg = c.hyperlink, bg = c.none }
	highlights.BlinkCmpKindSnippet = { fg = c.string, bg = c.none }
	highlights.BlinkCmpKindStruct = { fg = c.type, bg = c.none }
	highlights.BlinkCmpKindText = { fg = c.fg, bg = c.none }
	highlights.BlinkCmpKindTypeParameter = { fg = c.type, bg = c.none }
	highlights.BlinkCmpKindUnit = { fg = c.constant, bg = c.none }
	highlights.BlinkCmpKindValue = { fg = c.constant, bg = c.none }
	highlights.BlinkCmpKindVariable = { fg = c.variable, bg = c.none }

	highlights.BlinkCmpSource = { fg = c.fg_dim, bg = c.none }
	highlights.BlinkCmpSourceLSP = { fg = c.fg_dim, bg = c.none }
	highlights.BlinkCmpSourcePath = { fg = c.fg_dim, bg = c.none }
	highlights.BlinkCmpSourceSnippets = { fg = c.fg_dim, bg = c.none }
	highlights.BlinkCmpSourceBuffer = { fg = c.fg_dim, bg = c.none }

	highlights.BlinkCmpDoc = { fg = c.fg, bg = c.none }
	highlights.BlinkCmpDocBorder = { fg = c.border, bg = c.none }
	highlights.BlinkCmpDocSeparator = { fg = c.border, bg = c.none }
	highlights.BlinkCmpDocCursorLine = { bg = c.cursor_line }

	highlights.BlinkCmpSignatureHelp = { fg = c.fg, bg = c.none }
	highlights.BlinkCmpSignatureHelpBorder = { fg = c.border, bg = c.none }
	highlights.BlinkCmpSignatureHelpActiveParameter = { fg = c.parameter, bg = c.none, bold = true }

	highlights.BlinkCmpGhostText = { fg = c.fg_dimmer }

	-- ============================================================================
	-- fzf-lua
	-- ============================================================================
	highlights.FzfLuaNormal = { fg = c.fg, bg = c.none }
	highlights.FzfLuaBorder = { fg = c.border, bg = c.none }
	highlights.FzfLuaTitle = { fg = c.fg, bg = c.none, bold = true }
	highlights.FzfLuaPreviewNormal = { fg = c.fg, bg = c.none }
	highlights.FzfLuaPreviewBorder = { fg = c.border, bg = c.none }
	highlights.FzfLuaPreviewTitle = { fg = c.fg, bg = c.none, bold = true }
	highlights.FzfLuaCursor = { fg = c.bg, bg = c.cursor }
	highlights.FzfLuaCursorLine = { bg = c.cursor_line }
	highlights.FzfLuaCursorLineNr = { fg = c.line_number_current, bg = c.cursor_line }
	highlights.FzfLuaSearch = { fg = c.search_fg, bg = c.search_bg }
	highlights.FzfLuaScrollBorderEmpty = { fg = c.border, bg = c.none }
	highlights.FzfLuaScrollBorderFull = { fg = c.border, bg = c.none }
	highlights.FzfLuaScrollFloatEmpty = { bg = c.none }
	highlights.FzfLuaScrollFloatFull = { bg = c.border }
	highlights.FzfLuaHelpNormal = { fg = c.fg, bg = c.none }
	highlights.FzfLuaHelpBorder = { fg = c.border, bg = c.none }

	highlights.FzfLuaPathColNr = { fg = c.line_number, bg = c.none }
	highlights.FzfLuaPathLineNr = { fg = c.line_number, bg = c.none }
	highlights.FzfLuaBufName = { fg = c.identifier, bg = c.none }
	highlights.FzfLuaBufNr = { fg = c.number, bg = c.none }
	highlights.FzfLuaBufFlagCur = { fg = c.constant, bg = c.none }
	highlights.FzfLuaBufFlagAlt = { fg = c.fg_dim, bg = c.none }
	highlights.FzfLuaTabTitle = { fg = c.func, bg = c.none, bold = true }
	highlights.FzfLuaTabMarker = { fg = c.constant, bg = c.none }

	highlights.FzfLuaLiveSym = { fg = c.constant, bg = c.none }
	highlights.FzfLuaFzfNormal = { fg = c.fg, bg = c.none }
	highlights.FzfLuaFzfCursorLine = { bg = c.cursor_line }
	highlights.FzfLuaFzfMatch = { fg = c.search_current_bg, bg = c.none, bold = true }
	highlights.FzfLuaFzfBorder = { fg = c.border, bg = c.none }
	highlights.FzfLuaFzfScrollbar = { fg = c.border, bg = c.none }
	highlights.FzfLuaFzfSeparator = { fg = c.border, bg = c.none }
	highlights.FzfLuaFzfGutter = { bg = c.none }

	highlights.FzfLuaHeaderBind = { fg = c.keyword, bg = c.none }
	highlights.FzfLuaHeaderText = { fg = c.fg_dim, bg = c.none }
	highlights.FzfLuaDirPart = { fg = c.fg_dim, bg = c.none }
	highlights.FzfLuaFilePart = { fg = c.fg, bg = c.none }

	highlights.FzfLuaFzfPointer = { fg = c.constant, bg = c.none }
	highlights.FzfLuaFzfMarker = { fg = c.constant, bg = c.none }
	highlights.FzfLuaFzfHeader = { fg = c.fg_dim, bg = c.none }
	highlights.FzfLuaFzfInfo = { fg = c.info, bg = c.none }
	highlights.FzfLuaFzfPrompt = { fg = c.identifier, bg = c.none }
	highlights.FzfLuaFzfQuery = { fg = c.fg, bg = c.none }

	highlights.FzfLuaDiffAdd = { fg = c.string, bg = c.none }
	highlights.FzfLuaDiffDelete = { fg = c.error, bg = c.none }
	highlights.FzfLuaDiffChange = { fg = c.warning, bg = c.none }

	-- ============================================================================
	-- nvim-tree
	-- ============================================================================
	highlights.NvimTreeNormal = { fg = c.fg, bg = c.none }
	highlights.NvimTreeNormalNC = { fg = c.fg, bg = c.none }
	highlights.NvimTreeEndOfBuffer = { fg = c.bg, bg = c.none }
	highlights.NvimTreeVertSplit = { fg = c.border, bg = c.none }
	highlights.NvimTreeWinSeparator = { fg = c.border, bg = c.none }
	highlights.NvimTreeCursorLine = { bg = c.cursor_line }
	highlights.NvimTreeCursorLineNr = { fg = c.line_number_current, bg = c.cursor_line }

	highlights.NvimTreeRootFolder = { fg = c.fg_dim, bold = true }

	highlights.NvimTreeFolderName = { fg = c.fg_dim }
	highlights.NvimTreeFolderIcon = { fg = c.fg_dim }
	highlights.NvimTreeEmptyFolderName = { fg = c.fg_dim }
	highlights.NvimTreeOpenedFolderName = { fg = c.fg_dim, bold = true }
	highlights.NvimTreeSymlinkFolderName = { fg = c.hyperlink }

	highlights.NvimTreeFileIcon = { fg = c.fg }
	highlights.NvimTreeFileName = { fg = c.fg }
	highlights.NvimTreeExecFile = { fg = c.string, bold = true }
	highlights.NvimTreeOpenedFile = { fg = c.fg, bold = true }
	highlights.NvimTreeSpecialFile = { fg = c.constant }
	highlights.NvimTreeImageFile = { fg = c.constant }
	highlights.NvimTreeSymlink = { fg = c.hyperlink }

	highlights.NvimTreeGitDirty = { fg = c.func }
	highlights.NvimTreeGitStaged = { fg = c.string }
	highlights.NvimTreeGitMerge = { fg = c.error }
	highlights.NvimTreeGitRenamed = { fg = c.warning }
	highlights.NvimTreeGitNew = { fg = c.string }
	highlights.NvimTreeGitDeleted = { fg = c.error }
	highlights.NvimTreeGitIgnored = { fg = c.comment }

	highlights.NvimTreeLspDiagnosticsError = { fg = c.error }
	highlights.NvimTreeLspDiagnosticsWarning = { fg = c.warning }
	highlights.NvimTreeLspDiagnosticsInformation = { fg = c.info }
	highlights.NvimTreeLspDiagnosticsHint = { fg = c.hint }

	highlights.NvimTreeIndentMarker = { fg = c.border }

	highlights.NvimTreeWindowPicker = { bg = c.info, bold = true }

	highlights.NvimTreeStatusLine = { fg = c.fg, bg = c.bg_alt }
	highlights.NvimTreeStatusLineNC = { fg = c.fg_dim, bg = c.bg_alt }
	highlights.NvimTreeBookmark = { fg = c.constant }
	highlights.NvimTreeModifiedFile = { fg = c.warning }

	highlights.NvimTreeGitDirtyIcon = { fg = c.func }
	highlights.NvimTreeGitStagedIcon = { fg = c.string }
	highlights.NvimTreeGitMergeIcon = { fg = c.error }
	highlights.NvimTreeGitRenamedIcon = { fg = c.warning }
	highlights.NvimTreeGitNewIcon = { fg = c.string }
	highlights.NvimTreeGitDeletedIcon = { fg = c.error }

	-- ============================================================================
	-- gitsigns
	-- ============================================================================
	highlights.GitSignsAdd = { fg = c.string, bg = c.none }
	highlights.GitSignsChange = { fg = c.warning, bg = c.none }
	highlights.GitSignsDelete = { fg = c.error, bg = c.none }
	highlights.GitSignsAddLn = { bg = c.vcs_added }
	highlights.GitSignsChangeLn = { bg = c.vcs_modified }
	highlights.GitSignsDeleteLn = { bg = c.vcs_removed }
	highlights.GitSignsAddNr = { fg = c.string, bg = c.none }
	highlights.GitSignsChangeNr = { fg = c.warning, bg = c.none }
	highlights.GitSignsDeleteNr = { fg = c.error, bg = c.none }
	highlights.GitSignsAddInline = { bg = c.vcs_added }
	highlights.GitSignsChangeInline = { bg = c.vcs_modified }
	highlights.GitSignsDeleteInline = { bg = c.vcs_removed }
	highlights.GitSignsCurrentLineBlame = { fg = c.fg_dimmer }

	return highlights
end

return M
