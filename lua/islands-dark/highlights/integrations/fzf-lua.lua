local M = {}

--- Load fzf-lua highlights
--- @param c table Color palette
--- @return table Highlight groups for fzf-lua plugin
function M.get(c)
	return {
		FzfLuaNormal = { fg = c.fg3, bg = c.none },
		FzfLuaBorder = { fg = c.border, bg = c.none },
		FzfLuaTitle = { fg = c.fg3, bg = c.none, bold = true },
		FzfLuaPreviewNormal = { fg = c.fg3, bg = c.none },
		FzfLuaPreviewBorder = { fg = c.border, bg = c.none },
		FzfLuaPreviewTitle = { fg = c.fg3, bg = c.none, bold = true },
		FzfLuaCursor = { fg = c.bg1, bg = c.cursor },
		FzfLuaCursorLine = { bg = c.cursorline },
		FzfLuaCursorLineNr = { fg = c.fg3, bg = c.cursorline },
		FzfLuaSearch = { fg = c.fg3, bg = c.search },
		FzfLuaScrollBorderEmpty = { fg = c.border, bg = c.none },
		FzfLuaScrollBorderFull = { fg = c.border, bg = c.none },
		FzfLuaScrollFloatEmpty = { bg = c.none },
		FzfLuaScrollFloatFull = { bg = c.border },
		FzfLuaHelpNormal = { fg = c.fg3, bg = c.none },
		FzfLuaHelpBorder = { fg = c.border, bg = c.none },

		FzfLuaPathColNr = { fg = c.line_number, bg = c.none },
		FzfLuaPathLineNr = { fg = c.line_number, bg = c.none },
		FzfLuaBufName = { fg = c.identifier, bg = c.none },
		FzfLuaBufNr = { fg = c.number, bg = c.none },
		FzfLuaBufFlagCur = { fg = c.constant, bg = c.none },
		FzfLuaBufFlagAlt = { fg = c.fg2, bg = c.none },
		FzfLuaTabTitle = { fg = c.func, bg = c.none, bold = true },
		FzfLuaTabMarker = { fg = c.constant, bg = c.none },

		FzfLuaLiveSym = { fg = c.constant, bg = c.none },
		FzfLuaFzfNormal = { fg = c.fg3, bg = c.none },
		FzfLuaFzfCursorLine = { bg = c.cursorline },
		FzfLuaFzfMatch = { fg = c.search_match, bg = c.none, bold = true },
		FzfLuaFzfBorder = { fg = c.border, bg = c.none },
		FzfLuaFzfScrollbar = { fg = c.border, bg = c.none },
		FzfLuaFzfSeparator = { fg = c.border, bg = c.none },
		FzfLuaFzfGutter = { bg = c.none },

		FzfLuaHeaderBind = { fg = c.keyword, bg = c.none },
		FzfLuaHeaderText = { fg = c.fg2, bg = c.none },
		FzfLuaDirPart = { fg = c.fg2, bg = c.none },
		FzfLuaFilePart = { fg = c.fg3, bg = c.none },

		FzfLuaFzfPointer = { fg = c.constant, bg = c.none },
		FzfLuaFzfMarker = { fg = c.constant, bg = c.none },
		FzfLuaFzfHeader = { fg = c.fg2, bg = c.none },
		FzfLuaFzfInfo = { fg = c.info, bg = c.none },
		FzfLuaFzfPrompt = { fg = c.identifier, bg = c.none },
		FzfLuaFzfQuery = { fg = c.fg3, bg = c.none },

		FzfLuaDiffAdd = { fg = c.string, bg = c.none },
		FzfLuaDiffDelete = { fg = c.error, bg = c.none },
		FzfLuaDiffChange = { fg = c.warning, bg = c.none },
	}
end

return M
