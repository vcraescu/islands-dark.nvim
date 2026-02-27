local M = {}

--- Basic editor UI highlights
--- @param c theme.Colors Color palette
--- @return table Highlight groups for editor UI elements
function M.get(c)
	return {
		-- Basic editor UI
		Normal = { fg = c.text, bg = c.none },
		NormalFloat = { fg = c.text, bg = c.none },
		FloatBorder = { fg = c.border, bg = c.none },
		FloatTitle = { fg = c.text, bg = c.none, bold = true },

		-- Cursor and lines
		Cursor = { fg = c.base, bg = c.cursor },
		lCursor = { fg = c.base, bg = c.cursor },
		CursorIM = { fg = c.base, bg = c.cursor },
		CursorLine = { bg = c.cursorline },
		CursorLineNr = { fg = c.text, bg = c.cursorline },
		CursorColumn = { bg = c.cursorline },

		-- Line numbers and gutter
		LineNr = { fg = c.line_number, bg = c.none },
		SignColumn = { fg = c.line_number, bg = c.none },
		FoldColumn = { fg = c.line_number, bg = c.none },

		-- Folds
		Folded = { fg = c.text1, bg = c.fold },

		-- Visual selection
		Visual = { bg = c.visual },
		VisualNOS = { bg = c.visual },

		-- Search
		Search = { fg = c.text, bg = c.search },
		IncSearch = { fg = c.text, bg = c.match },
		CurSearch = { fg = c.text, bg = c.match },
		Substitute = { fg = c.text, bg = c.match },

		-- Matching
		MatchParen = { bg = c.match, bold = true },

		-- Splits and windows
		VertSplit = { fg = c.border },
		WinSeparator = { fg = c.border },
		StatusLine = { fg = c.text, bg = c.base2 },
		StatusLineNC = { fg = c.text1, bg = c.base2 },
		WinBar = { fg = c.text, bg = c.cursorline },
		WinBarNC = { fg = c.text1, bg = c.cursorline },

		-- Tab line
		TabLine = { fg = c.text1, bg = c.base2 },
		TabLineFill = { bg = c.base2 },
		TabLineSel = { fg = c.text, bg = c.none, bold = true },

		-- Popup menu
		Pmenu = { link = "NormalFloat" },
		PmenuSel = { link = "Visual" },
		PmenuSbar = { bg = c.none },
		PmenuThumb = { bg = c.border },
		PmenuBorder = { link = "FloatBorder" },
		PmenuMatch = { fg = c.search_match, bg = c.none, bold = true },
		PmenuMatchSel = { link = "PmenuSel" },
		PmenuExtra = { fg = c.text1, bg = c.none },
		PmenuKind = { fg = c.type, bg = c.none },

		-- Messages and command line
		MsgArea = { fg = c.text, bg = c.none },
		MsgSeparator = { fg = c.border, bg = c.none },
		ErrorMsg = { fg = c.error },
		WarningMsg = { fg = c.warning },
		MoreMsg = { fg = c.info },
		Question = { fg = c.info },

		-- Special UI elements
		ColorColumn = { bg = c.color_column },
		Conceal = { fg = c.text2 },
		Directory = { fg = c.identifier },
		NonText = { fg = c.text2 },
		SpecialKey = { fg = c.text2 },
		Title = { fg = c.func, bold = true },
		Whitespace = { fg = c.text2 },

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
		Added = { fg = c.git_add },
		Changed = { fg = c.git_change },
		Removed = { fg = c.git_delete },

		-- Quickfix and location list
		QuickFixLine = { bg = c.cursorline },
		qfLineNr = { fg = c.line_number },
		qfFileName = { fg = c.identifier },

		--- Neovim 0.10+ health checks
		healthError = { fg = c.error },
		healthSuccess = { fg = c.ok },
		healthWarning = { fg = c.warning },
	}
end

return M
