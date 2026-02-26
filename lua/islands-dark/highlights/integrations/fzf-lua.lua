local M = {}

--- @param c theme.Colors Color palette
--- @return table Highlight groups for fzf-lua plugin
function M.get(c)
	return {
		FzfLuaBorder = { link = "FloatBorder" },
		FzfLuaTitle = { link = "FloatTitle" },
		FzfLuaCursorLine = { link = "CursorLine" },

		FzfLuaPathColNr = { fg = c.line_number, bg = c.none },
		FzfLuaPathLineNr = { fg = c.line_number, bg = c.none },
		FzfLuaBufNr = { fg = c.number, bg = c.none },
		FzfLuaBufFlagCur = { fg = c.constant, bg = c.none },
		FzfLuaBufFlagAlt = { fg = c.text1, bg = c.none },
		FzfLuaTabTitle = { fg = c.func, bg = c.none, bold = true },
		FzfLuaTabMarker = { fg = c.constant, bg = c.none },

		FzfLuaLiveSym = { fg = c.text, bg = c.none },
		FzfLuaFzfMatch = { fg = c.search_match, bg = c.none, bold = true },

		FzfLuaHeaderBind = { fg = c.keyword, bg = c.none },
		FzfLuaHeaderText = { fg = c.text1, bg = c.none },
	}
end

return M
