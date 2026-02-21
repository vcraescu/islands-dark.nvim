-- Editor UI highlights for Islands Dark theme

local M = {}

--- Basic editor UI highlights
--- @param c table Color palette
--- @return table Highlight groups for editor UI elements
function M.setup(c)
	local highlights = {}

	-- Basic editor UI
	highlights.Normal = { fg = c.fg, bg = c.none }
	highlights.NormalFloat = { fg = c.fg, bg = c.none }
	highlights.FloatBorder = { fg = c.border, bg = c.none }
	highlights.FloatTitle = { fg = c.fg, bg = c.none, bold = true }

	-- Cursor and lines
	highlights.Cursor = { fg = c.bg, bg = c.cursor }
	highlights.lCursor = { fg = c.bg, bg = c.cursor }
	highlights.CursorIM = { fg = c.bg, bg = c.cursor }
	highlights.CursorLine = { bg = c.cursor_line }
	highlights.CursorLineNr = { fg = c.line_number_current, bg = c.cursor_line }
	highlights.CursorColumn = { bg = c.cursor_line }

	-- Line numbers and gutter
	highlights.LineNr = { fg = c.line_number, bg = c.none }
	highlights.SignColumn = { fg = c.line_number, bg = c.none }
	highlights.FoldColumn = { fg = c.line_number, bg = c.none }

	-- Folds
	highlights.Folded = { fg = c.fg_dim, bg = c.fold_bg }

	-- Visual selection
	highlights.Visual = { bg = c.visual }
	highlights.VisualNOS = { bg = c.visual_inactive }

	-- Search
	highlights.Search = { fg = c.search_fg, bg = c.search_bg }
	highlights.IncSearch = { fg = c.search_current_fg, bg = c.search_current_bg }
	highlights.CurSearch = { fg = c.search_current_fg, bg = c.search_current_bg }
	highlights.Substitute = { fg = c.search_current_fg, bg = c.search_current_bg }

	-- Matching
	highlights.MatchParen = { bg = c.match_paren_bg, bold = true }

	-- Splits and windows
	highlights.VertSplit = { fg = c.border }
	highlights.WinSeparator = { fg = c.border }
	highlights.StatusLine = { fg = c.fg, bg = c.bg_alt }
	highlights.StatusLineNC = { fg = c.fg_dim, bg = c.bg_alt }
	highlights.WinBar = { fg = c.fg, bg = c.cursor_line }
	highlights.WinBarNC = { fg = c.fg_dim, bg = c.cursor_line }

	-- Tab line
	highlights.TabLine = { fg = c.fg_dim, bg = c.bg_alt }
	highlights.TabLineFill = { bg = c.bg_alt }
	highlights.TabLineSel = { fg = c.fg, bg = c.none, bold = true }

	-- Popup menu
	highlights.Pmenu = { fg = c.fg, bg = c.none }
	highlights.PmenuSel = { fg = c.fg, bg = c.visual }
	highlights.PmenuSbar = { bg = c.none }
	highlights.PmenuThumb = { bg = c.border }
	highlights.PmenuBorder = { fg = c.border, bg = c.none }
	highlights.PmenuMatch = { fg = c.keyword, bg = c.none, bold = true }
	highlights.PmenuMatchSel = { fg = c.keyword, bg = c.visual, bold = true }

	-- Messages and command line
	highlights.MsgArea = { fg = c.fg, bg = c.none }
	highlights.MsgSeparator = { fg = c.border, bg = c.none }
	highlights.ErrorMsg = { fg = c.error }
	highlights.WarningMsg = { fg = c.warning }
	highlights.MoreMsg = { fg = c.info }
	highlights.Question = { fg = c.info }

	-- Special UI elements
	highlights.ColorColumn = { bg = c.bg_alt }
	highlights.Conceal = { fg = c.fg_dimmer }
	highlights.Directory = { fg = c.identifier }
	highlights.NonText = { fg = c.fg_dimmer }
	highlights.SpecialKey = { fg = c.fg_dimmer }
	highlights.Title = { fg = c.func, bold = true }
	highlights.Whitespace = { fg = c.fg_dimmer }

	-- Spell checking
	highlights.SpellBad = { sp = c.error, undercurl = true }
	highlights.SpellCap = { sp = c.warning, undercurl = true }
	highlights.SpellLocal = { sp = c.hint, undercurl = true }
	highlights.SpellRare = { sp = c.info, undercurl = true }

	-- Diff
	highlights.DiffAdd = { bg = c.diff_add }
	highlights.DiffChange = { bg = c.diff_change }
	highlights.DiffDelete = { fg = c.error, bg = c.diff_delete }
	highlights.DiffText = { bg = c.diff_text }

	-- Quickfix and location list
	highlights.QuickFixLine = { bg = c.cursor_line }
	highlights.qfLineNr = { fg = c.line_number }
	highlights.qfFileName = { fg = c.identifier }

	return highlights
end

return M
