local M = {}

--- Load fzf-lua highlights
--- @param c theme.Colors Color palette
--- @return table Highlight groups for fzf-lua plugin
function M.get(c)
	return {
		FzfLuaNormal = { fg = c.text, bg = c.none },
		FzfLuaBorder = { fg = c.border, bg = c.none },
		FzfLuaTitle = { fg = c.text, bg = c.none, bold = true },
		FzfLuaPreviewNormal = { fg = c.text, bg = c.none },
		FzfLuaPreviewBorder = { fg = c.border, bg = c.none },
		FzfLuaPreviewTitle = { fg = c.text, bg = c.none, bold = true },
		FzfLuaCursor = { link = "Cursor" },
		FzfLuaCursorLine = { link = "CursorLine" },
		FzfLuaCursorLineNr = { link = "CursorLineNr" },
		FzfLuaSearch = { fg = c.text, bg = c.search },
		FzfLuaScrollBorderEmpty = { fg = c.border, bg = c.none },
		FzfLuaScrollBorderFull = { fg = c.border, bg = c.none },
		FzfLuaScrollFloatEmpty = { bg = c.none },
		FzfLuaScrollFloatFull = { bg = c.border },
		FzfLuaHelpNormal = { fg = c.text, bg = c.none },
		FzfLuaHelpBorder = { fg = c.border, bg = c.none },

		FzfLuaPathColNr = { fg = c.line_number, bg = c.none },
		FzfLuaPathLineNr = { fg = c.line_number, bg = c.none },
		FzfLuaBufName = { fg = c.identifier, bg = c.none },
		FzfLuaBufNr = { fg = c.number, bg = c.none },
		FzfLuaBufFlagCur = { fg = c.constant, bg = c.none },
		FzfLuaBufFlagAlt = { fg = c.text1, bg = c.none },
		FzfLuaTabTitle = { fg = c.func, bg = c.none, bold = true },
		FzfLuaTabMarker = { fg = c.constant, bg = c.none },

		FzfLuaLiveSym = { fg = c.text, bg = c.none },
		FzfLuaFzfNormal = { fg = c.text, bg = c.none },
		FzfLuaFzfCursorLine = { link = "CursorLine" },
		FzfLuaFzfMatch = { fg = c.search_match, bg = c.none, bold = true },
		FzfLuaFzfBorder = { fg = c.border, bg = c.none },
		FzfLuaFzfScrollbar = { fg = c.border, bg = c.none },
		FzfLuaFzfSeparator = { fg = c.border, bg = c.none },
		FzfLuaFzfGutter = { bg = c.none },

		FzfLuaHeaderBind = { fg = c.keyword, bg = c.none },
		FzfLuaHeaderText = { fg = c.text1, bg = c.none },
		FzfLuaDirPart = { fg = c.text2, bg = c.none },
		FzfLuaFilePart = { fg = c.text, bg = c.none },

		FzfLuaFzfPointer = { fg = c.constant, bg = c.none },
		FzfLuaFzfMarker = { fg = c.constant, bg = c.none },
		FzfLuaFzfHeader = { fg = c.text1, bg = c.none },
		FzfLuaFzfInfo = { fg = c.info, bg = c.none },
		FzfLuaFzfPrompt = { fg = c.identifier, bg = c.none },
		FzfLuaFzfQuery = { fg = c.text, bg = c.none },

		FzfLuaDiffAdd = { fg = c.string, bg = c.none },
		FzfLuaDiffDelete = { fg = c.error, bg = c.none },
		FzfLuaDiffChange = { fg = c.warning, bg = c.none },
	}
end

return M
