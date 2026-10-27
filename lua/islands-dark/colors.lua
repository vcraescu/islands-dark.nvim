--- @class theme.Colors
local M = {}
local palette = require("islands-dark.palette")

-- Backgrounds
--- Editor background
M.bg = palette.bg1
--- Gutter and inactive surface background
M.bg_gutter = palette.bg2
--- Statusline and surface background
M.bg_surface = palette.bg3
--- Emphasized surface background
M.bg_highlight = palette.bg4

-- Foregrounds
--- Default text
M.fg = palette.fg3
--- Secondary text
M.fg_muted = palette.fg2
--- Dim text
M.fg_dim = palette.fg1
--- Emphasized text
M.fg_bright = palette.fg4
--- Inlay hint text
M.fg_inlay = palette.fg5

-- Editor
M.border = palette.gray1
M.cursor = palette.fg3
M.cursorline = palette.bg2
M.quickfixline = palette.bg4
M.visual = palette.blue2
M.line_number = palette.gray2
M.line_number_current = palette.fg2
M.color_column = palette.bg3
--- Folded text background
M.fold_bg = palette.bg4
--- Folded text foreground
M.fold_fg = palette.fg6
M.ghost_text = palette.gray2
M.directory = palette.blue3
M.markup_code_bg = palette.cyan1

-- Keywords and literals
M.keyword = palette.orange2
M.string = palette.green2
M.number = palette.cyan2

-- Functions and methods
M.func = palette.blue3
M.func_builtin = palette.orange1
M.func_call = palette.yellow3

-- Variables and parameters
M.variable = palette.fg3
M.variable_builtin = palette.orange1
M.parameter = palette.fg3
M.property = palette.purple1

-- Types and constants
M.type = palette.blue4
M.type_builtin = palette.orange1
M.type_definition = palette.fg3
M.constant = palette.purple1
M.constant_builtin = palette.orange1

-- Comments
M.comment = palette.fg1
M.comment_doc = palette.green4
M.comment_tag = palette.green5

-- Operators and punctuation
M.operator = palette.fg3
M.delimiter = palette.fg3

-- Tags and attributes
M.tag = palette.yellow2
M.attribute = palette.yellow2
M.special_tag = palette.green6

-- Labels and special syntax
M.label = palette.fg3
M.metadata = palette.yellow1
M.special = palette.cyan2
M.special_char = palette.blue3
M.escape = palette.orange2
M.regex = palette.cyan2
M.include = palette.yellow4

-- Diagnostics and LSP
M.error = palette.red1
M.warning = palette.yellow2
M.info = palette.blue4
M.hint = palette.fg1
M.ok = palette.green2
M.lsp_reference = palette.cyan1

-- Search
M.search = palette.green1
M.search_match = palette.blue3
M.match = palette.blue1

-- Shared Git and diff colors: sign and marker `fg`, full-line `line_bg`, inline `text_bg`
M.changes = {
	add = {
		fg = palette.green2,
		line_bg = palette.green7,
		text_bg = palette.green8,
	},
	change = {
		fg = palette.blue3,
		line_bg = palette.blue5,
		text_bg = palette.blue6,
	},
	conflict = {
		fg = palette.red1,
		line_bg = palette.red2,
		text_bg = palette.red3,
	},
	delete = {
		fg = palette.red1,
		line_bg = palette.red2,
		text_bg = palette.red3,
	},
}
M.git_merge = palette.purple1

-- Special elements
M.todo = palette.green3
M.link = palette.blue3
--- Transparency sentinel
M.none = "NONE"

-- Terminal
M.terminal = {
	black = palette.bg1,
	bright_black = palette.fg1,
	red = palette.terminal.red,
	bright_red = palette.terminal.bright_red,
	green = palette.terminal.green,
	bright_green = palette.terminal.bright_green,
	yellow = palette.terminal.yellow,
	bright_yellow = palette.terminal.bright_yellow,
	blue = palette.terminal.blue,
	bright_blue = palette.terminal.bright_blue,
	magenta = palette.terminal.magenta,
	bright_magenta = palette.terminal.bright_magenta,
	cyan = palette.terminal.cyan,
	bright_cyan = palette.terminal.bright_cyan,
	white = palette.fg2,
	bright_white = palette.fg3,
}

return M
