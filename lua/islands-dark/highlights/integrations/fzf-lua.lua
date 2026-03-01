local M = {}

--- Get FzfLua highlight groups
--- @param c theme.Colors Color palette
--- @return theme.Highlights
function M.get(c)
	return {
		FzfLuaNormal = { link = "NormalFloat" },
		FzfLuaBorder = { link = "FloatBorder" },
		FzfLuaTitle = { link = "FloatTitle" },
		FzfLuaBackdrop = { bg = c.base1 },

		FzfLuaPathColNr = { fg = c.line_number, bg = c.none },
		FzfLuaPathLineNr = { fg = c.line_number, bg = c.none },
		FzfLuaBufNr = { fg = c.number, bg = c.none },
		FzfLuaBufFlagCur = { fg = c.constant, bg = c.none },
		FzfLuaBufFlagAlt = { fg = c.text1, bg = c.none },
		FzfLuaTabTitle = { fg = c.func, bg = c.none, bold = true },
		FzfLuaTabMarker = { fg = c.constant, bg = c.none },

		FzfLuaLiveSym = { link = "FzfLuaLivePrompt" },
		FzfLuaLivePrompt = { fg = c.text, bg = c.none },
		FzfLuaFzfMatch = { fg = c.search_match, bg = c.none, bold = true },

		FzfLuaHeaderBind = { fg = c.keyword, bg = c.none },
		FzfLuaHeaderText = { fg = c.text1, bg = c.none },

		FzfLuaFzfPointer = { fg = c.comment },
	}
end

return M
