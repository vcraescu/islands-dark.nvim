local M = {}

--- Get FzfLua highlight groups
--- @param c theme.Colors Color palette
--- @return theme.Highlights
function M.get(c)
	return {
		FzfLuaNormal = { link = "Normal" },
		FzfLuaBorder = { fg = c.border, bg = c.bg },
		FzfLuaTitle = { fg = c.fg, bg = c.bg, bold = true },

		FzfLuaPathColNr = { fg = c.line_number, bg = c.none },
		FzfLuaPathLineNr = { fg = c.line_number, bg = c.none },
		FzfLuaBufNr = { fg = c.number, bg = c.none },
		FzfLuaBufFlagCur = { fg = c.constant, bg = c.none },
		FzfLuaBufFlagAlt = { fg = c.fg_muted, bg = c.none },
		FzfLuaTabTitle = { fg = c.func, bg = c.none, bold = true },
		FzfLuaTabMarker = { fg = c.constant, bg = c.none },

		FzfLuaLiveSym = { link = "FzfLuaLivePrompt" },
		FzfLuaLivePrompt = { fg = c.fg, bg = c.none },
		FzfLuaFzfMatch = { fg = c.search_match, bg = c.none, bold = true },

		FzfLuaHeaderBind = { fg = c.keyword, bg = c.none },
		FzfLuaHeaderText = { fg = c.fg_muted, bg = c.none },

		FzfLuaFzfPointer = { fg = c.comment },
		FzfLuaFzfCursorLine = { link = "PmenuSel" },
	}
end

return M
