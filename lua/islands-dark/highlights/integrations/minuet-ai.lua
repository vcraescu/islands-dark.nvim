local M = {}

--- Get Minuet-AI highlight groups
--- @param c theme.Colors palette
--- @return theme.Highlights
function M.get(c)
	return {
		MinuetVirtualText = { fg = c.text2 },

		MinuetDuetAdd = { link = "DiffAdd" },
		MinuetDuetDelete = { link = "DiffDelete" },
		MinuetDuetComment = { link = "Comment" },
		MinuetDuetCursor = { link = "IncSearch" },

		LspKindMinuet = { link = "LspKindText" },
		BlinkCmpItemKindMinuet = { link = "BlinkCmpItemKind" },
		CmpItemKindMinuet = { link = "CmpItemKind" },
	}
end

return M
