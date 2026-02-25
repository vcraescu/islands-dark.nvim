local M = {}

--- Basic editor UI highlights
--- @param c theme.Colors Color palette
--- @return table Highlight groups for editor UI elements
function M.get(c)
	return {
		-- Basic editor UI
		Normal = { fg = c.fg3, bg = c.none },
		NormalFloat = { fg = c.fg3, bg = c.none },
		FloatBorder = { fg = c.border, bg = c.none },
		FloatTitle = { fg = c.fg3, bg = c.none, bold = true },

		-- Cursor and lines
		Cursor = { fg = c.bg1, bg = c.cursor },
		lCursor = { fg = c.bg1, bg = c.cursor },
		CursorIM = { fg = c.bg1, bg = c.cursor },
		CursorLine = { bg = c.cursorline },
		CursorLineNr = { fg = c.fg3, bg = c.cursorline },
		CursorColumn = { bg = c.cursorline },

		-- Line numbers and gutter
		LineNr = { fg = c.line_number, bg = c.none },
		SignColumn = { fg = c.line_number, bg = c.none },
		FoldColumn = { fg = c.line_number, bg = c.none },

		-- Folds
		Folded = { fg = c.fg2, bg = c.fold },

		-- Visual selection
		Visual = { bg = c.visual },
		VisualNOS = { bg = c.visual },

		-- Search
		Search = { fg = c.fg3, bg = c.search },
		IncSearch = { fg = c.fg3, bg = c.match },
		CurSearch = { fg = c.fg3, bg = c.match },
		Substitute = { fg = c.fg3, bg = c.match },

		-- Matching
		MatchParen = { bg = c.match, bold = true },

		-- Splits and windows
		VertSplit = { fg = c.border },
		WinSeparator = { fg = c.border },
		StatusLine = { fg = c.fg3, bg = c.bg3 },
		StatusLineNC = { fg = c.fg2, bg = c.bg3 },
		WinBar = { fg = c.fg3, bg = c.cursorline },
		WinBarNC = { fg = c.fg2, bg = c.cursorline },

		-- Tab line
		TabLine = { fg = c.fg2, bg = c.bg3 },
		TabLineFill = { bg = c.bg3 },
		TabLineSel = { fg = c.fg3, bg = c.none, bold = true },

		-- Popup menu
		Pmenu = { fg = c.fg3, bg = c.none },
		PmenuSel = { fg = c.fg3, bg = c.visual },
		PmenuSbar = { bg = c.none },
		PmenuThumb = { bg = c.border },
		PmenuBorder = { fg = c.border, bg = c.none },
		PmenuMatch = { fg = c.keyword, bg = c.none, bold = true },
		PmenuMatchSel = { fg = c.keyword, bg = c.visual, bold = true },

		-- Messages and command line
		MsgArea = { fg = c.fg3, bg = c.none },
		MsgSeparator = { fg = c.border, bg = c.none },
		ErrorMsg = { fg = c.error },
		WarningMsg = { fg = c.warning },
		MoreMsg = { fg = c.info },
		Question = { fg = c.info },

		-- Special UI elements
		ColorColumn = { bg = c.color_column },
		Conceal = { fg = c.fg1 },
		Directory = { fg = c.identifier },
		NonText = { fg = c.fg1 },
		SpecialKey = { fg = c.fg1 },
		Title = { fg = c.func, bold = true },
		Whitespace = { fg = c.fg1 },

		-- Spell checking
		SpellBad = { sp = c.error, undercurl = true },
		SpellCap = { sp = c.warning, undercurl = true },
		SpellLocal = { sp = c.hint, undercurl = true },
		SpellRare = { sp = c.info, undercurl = true },

		-- Diff
		DiffAdd = { bg = c.diff_add },
		DiffChange = { bg = c.diff_change },
		DiffDelete = { bg = c.diff_delete },
		DiffText = { bg = c.diff_change },

		-- Quickfix and location list
		QuickFixLine = { bg = c.cursorline },
		qfLineNr = { fg = c.line_number },
		qfFileName = { fg = c.identifier },
	}
end

return M
