local M = {}

--- Basic editor UI highlights
--- @param c theme.Colors Color palette
--- @return table Highlight groups for editor UI elements
function M.get(c)
	return {
		-- Basic editor UI
		Normal = { fg = c.fg, bg = c.none },
		NormalFloat = { fg = c.fg, bg = c.none },
		FloatBorder = { fg = c.border, bg = c.none },
		FloatTitle = { fg = c.fg, bg = c.none, bold = true },

		-- Cursor and lines
		Cursor = { fg = c.bg, bg = c.cursor },
		lCursor = { fg = c.bg, bg = c.cursor },
		CursorIM = { fg = c.bg, bg = c.cursor },
		CursorLine = { bg = c.cursor_line },
		CursorLineNr = { fg = c.line_number_current, bg = c.cursor_line },
		CursorColumn = { bg = c.cursor_line },

		-- Line numbers and gutter
		LineNr = { fg = c.line_number, bg = c.none },
		SignColumn = { fg = c.line_number, bg = c.none },
		FoldColumn = { fg = c.line_number, bg = c.none },

		-- Folds
		Folded = { fg = c.fg_dim, bg = c.fold_bg },

		-- Visual selection
		Visual = { bg = c.visual },
		VisualNOS = { bg = c.visual_inactive },

		-- Search
		Search = { fg = c.fg, bg = c.search },
		IncSearch = { fg = c.fg, bg = c.match },
		CurSearch = { fg = c.fg, bg = c.match },
		Substitute = { fg = c.fg, bg = c.match },

		-- Matching
		MatchParen = { bg = c.match, bold = true },

		-- Splits and windows
		VertSplit = { fg = c.border },
		WinSeparator = { fg = c.border },
		StatusLine = { fg = c.fg, bg = c.bg_alt },
		StatusLineNC = { fg = c.fg_dim, bg = c.bg_alt },
		WinBar = { fg = c.fg, bg = c.cursor_line },
		WinBarNC = { fg = c.fg_dim, bg = c.cursor_line },

		-- Tab line
		TabLine = { fg = c.fg_dim, bg = c.bg_alt },
		TabLineFill = { bg = c.bg_alt },
		TabLineSel = { fg = c.fg, bg = c.none, bold = true },

		-- Popup menu
		Pmenu = { fg = c.fg, bg = c.none },
		PmenuSel = { fg = c.fg, bg = c.visual },
		PmenuSbar = { bg = c.none },
		PmenuThumb = { bg = c.border },
		PmenuBorder = { fg = c.border, bg = c.none },
		PmenuMatch = { fg = c.keyword, bg = c.none, bold = true },
		PmenuMatchSel = { fg = c.keyword, bg = c.visual, bold = true },

		-- Messages and command line
		MsgArea = { fg = c.fg, bg = c.none },
		MsgSeparator = { fg = c.border, bg = c.none },
		ErrorMsg = { fg = c.error },
		WarningMsg = { fg = c.warning },
		MoreMsg = { fg = c.info },
		Question = { fg = c.info },

		-- Special UI elements
		ColorColumn = { bg = c.color_column },
		Conceal = { fg = c.fg_dimmer },
		Directory = { fg = c.identifier },
		NonText = { fg = c.fg_dimmer },
		SpecialKey = { fg = c.fg_dimmer },
		Title = { fg = c.func, bold = true },
		Whitespace = { fg = c.fg_dimmer },

		-- Spell checking
		SpellBad = { sp = c.error, undercurl = true },
		SpellCap = { sp = c.warning, undercurl = true },
		SpellLocal = { sp = c.hint, undercurl = true },
		SpellRare = { sp = c.info, undercurl = true },

		-- Diff
		DiffAdd = { bg = c.diff_add },
		DiffChange = { bg = c.diff_change },
		DiffDelete = { bg = c.diff_delete },
		DiffText = { bg = c.diff_text },

		-- Quickfix and location list
		QuickFixLine = { bg = c.cursor_line },
		qfLineNr = { fg = c.line_number },
		qfFileName = { fg = c.identifier },
	}
end

return M
