local M = {}

--- Load Blink CMP highlights
--- @param c table Color palette
--- @return table Highlight groups for Blink CMP
function M.get(c)
	return {
		BlinkCmpMenu = { fg = c.text, bg = c.none },
		BlinkCmpMenuBorder = { fg = c.border, bg = c.none },
		BlinkCmpMenuSelection = { fg = c.text, bg = c.visual },
		BlinkCmpScrollBarThumb = { bg = c.border },
		BlinkCmpScrollBarGutter = { bg = c.none },

		BlinkCmpLabel = { fg = c.text, bg = c.none },
		BlinkCmpLabelDeprecated = { bg = c.none, strikethrough = true },
		BlinkCmpLabelMatch = { fg = c.search_match, bg = c.none, bold = true },
		BlinkCmpLabelDetail = { fg = c.text1, bg = c.none },
		BlinkCmpLabelDescription = { fg = c.text1, bg = c.none },

		BlinkCmpKind = { fg = c.type, bg = c.none },
		BlinkCmpKindClass = { fg = c.type, bg = c.none },
		BlinkCmpKindColor = { fg = c.constant, bg = c.none },
		BlinkCmpKindConstant = { fg = c.constant, bg = c.none },
		BlinkCmpKindConstructor = { fg = c.type, bg = c.none },
		BlinkCmpKindEnum = { fg = c.type, bg = c.none },
		BlinkCmpKindEnumMember = { fg = c.property, bg = c.none },
		BlinkCmpKindEvent = { fg = c.constant, bg = c.none },
		BlinkCmpKindField = { fg = c.property, bg = c.none },
		BlinkCmpKindFile = { fg = c.text, bg = c.none },
		BlinkCmpKindFolder = { fg = c.identifier, bg = c.none },
		BlinkCmpKindFunction = { fg = c.func, bg = c.none },
		BlinkCmpKindInterface = { fg = c.type, bg = c.none },
		BlinkCmpKindKeyword = { fg = c.keyword, bg = c.none },
		BlinkCmpKindMethod = { fg = c.method, bg = c.none },
		BlinkCmpKindModule = { fg = c.type, bg = c.none },
		BlinkCmpKindOperator = { fg = c.operator, bg = c.none },
		BlinkCmpKindProperty = { fg = c.property, bg = c.none },
		BlinkCmpKindReference = { fg = c.link, bg = c.none },
		BlinkCmpKindSnippet = { fg = c.string, bg = c.none },
		BlinkCmpKindStruct = { fg = c.type, bg = c.none },
		BlinkCmpKindText = { fg = c.text, bg = c.none },
		BlinkCmpKindTypeParameter = { fg = c.type, bg = c.none },
		BlinkCmpKindUnit = { fg = c.constant, bg = c.none },
		BlinkCmpKindValue = { fg = c.constant, bg = c.none },
		BlinkCmpKindVariable = { fg = c.variable, bg = c.none },

		BlinkCmpSource = { fg = c.text1, bg = c.none },
		BlinkCmpSourceLSP = { fg = c.text1, bg = c.none },
		BlinkCmpSourcePath = { fg = c.text1, bg = c.none },
		BlinkCmpSourceSnippets = { fg = c.text1, bg = c.none },
		BlinkCmpSourceBuffer = { fg = c.text1, bg = c.none },

		BlinkCmpDoc = { fg = c.text, bg = c.none },
		BlinkCmpDocBorder = { fg = c.border, bg = c.none },
		BlinkCmpDocSeparator = { fg = c.border, bg = c.none },
		BlinkCmpDocCursorLine = { bg = c.cursorline },

		BlinkCmpSignatureHelp = { fg = c.text, bg = c.none },
		BlinkCmpSignatureHelpBorder = { fg = c.border, bg = c.none },
		BlinkCmpSignatureHelpActiveParameter = { fg = c.parameter, bg = c.none, bold = true },

		BlinkCmpGhostText = { fg = c.text2 },
	}
end

return M
