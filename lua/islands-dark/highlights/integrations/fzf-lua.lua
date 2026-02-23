local M = {}

--- Load fzf-lua highlights
--- @param c table Color palette
--- @return table Highlight groups for fzf-lua plugin
function M.get(c)
	return {
		FzfLuaNormal = { fg = c.fg, bg = c.none },
		FzfLuaBorder = { fg = c.border, bg = c.none },
		FzfLuaTitle = { fg = c.fg, bg = c.none, bold = true },
		FzfLuaPreviewNormal = { fg = c.fg, bg = c.none },
		FzfLuaPreviewBorder = { fg = c.border, bg = c.none },
		FzfLuaPreviewTitle = { fg = c.fg, bg = c.none, bold = true },
		FzfLuaCursor = { fg = c.bg, bg = c.cursor },
		FzfLuaCursorLine = { bg = c.cursor_line },
		FzfLuaCursorLineNr = { fg = c.line_number_current, bg = c.cursor_line },
		FzfLuaSearch = { fg = c.fg, bg = c.search },
		FzfLuaScrollBorderEmpty = { fg = c.border, bg = c.none },
		FzfLuaScrollBorderFull = { fg = c.border, bg = c.none },
		FzfLuaScrollFloatEmpty = { bg = c.none },
		FzfLuaScrollFloatFull = { bg = c.border },
		FzfLuaHelpNormal = { fg = c.fg, bg = c.none },
		FzfLuaHelpBorder = { fg = c.border, bg = c.none },

		FzfLuaPathColNr = { fg = c.line_number, bg = c.none },
		FzfLuaPathLineNr = { fg = c.line_number, bg = c.none },
		FzfLuaBufName = { fg = c.identifier, bg = c.none },
		FzfLuaBufNr = { fg = c.number, bg = c.none },
		FzfLuaBufFlagCur = { fg = c.constant, bg = c.none },
		FzfLuaBufFlagAlt = { fg = c.fg_dim, bg = c.none },
		FzfLuaTabTitle = { fg = c.func, bg = c.none, bold = true },
		FzfLuaTabMarker = { fg = c.constant, bg = c.none },

		FzfLuaLiveSym = { fg = c.constant, bg = c.none },
		FzfLuaFzfNormal = { fg = c.fg, bg = c.none },
		FzfLuaFzfCursorLine = { bg = c.cursor_line },
		FzfLuaFzfMatch = { fg = c.inc_search, bg = c.none, bold = true },
		FzfLuaFzfBorder = { fg = c.border, bg = c.none },
		FzfLuaFzfScrollbar = { fg = c.border, bg = c.none },
		FzfLuaFzfSeparator = { fg = c.border, bg = c.none },
		FzfLuaFzfGutter = { bg = c.none },

		FzfLuaHeaderBind = { fg = c.keyword, bg = c.none },
		FzfLuaHeaderText = { fg = c.fg_dim, bg = c.none },
		FzfLuaDirPart = { fg = c.fg_dim, bg = c.none },
		FzfLuaFilePart = { fg = c.fg, bg = c.none },

		FzfLuaFzfPointer = { fg = c.constant, bg = c.none },
		FzfLuaFzfMarker = { fg = c.constant, bg = c.none },
		FzfLuaFzfHeader = { fg = c.fg_dim, bg = c.none },
		FzfLuaFzfInfo = { fg = c.info, bg = c.none },
		FzfLuaFzfPrompt = { fg = c.identifier, bg = c.none },
		FzfLuaFzfQuery = { fg = c.fg, bg = c.none },

		FzfLuaDiffAdd = { fg = c.string, bg = c.none },
		FzfLuaDiffDelete = { fg = c.error, bg = c.none },
		FzfLuaDiffChange = { fg = c.warning, bg = c.none },
	}
end

return M
