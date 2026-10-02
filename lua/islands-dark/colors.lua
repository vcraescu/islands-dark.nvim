--- @type theme.Colors
local M = {}
local palette = require("islands-dark.palette")

-- Backgrounds
M.bg = palette.bg1
M.bg_gutter = palette.bg2
M.bg_surface = palette.bg3
M.bg_highlight = palette.bg4

-- Foregrounds
M.fg = palette.fg3
M.fg_muted = palette.fg2
M.fg_dim = palette.fg1
M.fg_bright = palette.fg4
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
M.fold_bg = palette.bg4
M.fold_fg = palette.fg6
M.ghost_text = palette.gray2
M.directory = palette.blue4
M.markup_code_bg = palette.cyan1

-- Keywords and literals
M.keyword = palette.orange2
M.string = palette.green2
M.number = palette.cyan2

-- Functions and methods
M.func = palette.blue4
M.func_builtin = palette.orange1
M.func_call = palette.yellow3

-- Variables and parameters
M.variable = palette.fg3
M.variable_builtin = palette.orange1
M.parameter = palette.fg3
M.property = palette.purple1

-- Types and constants
M.type = palette.blue5
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
M.special_char = palette.blue4
M.escape = palette.orange2
M.regex = palette.cyan2
M.include = palette.yellow4

-- Diagnostics and LSP
M.error = palette.red2
M.warning = palette.yellow2
M.info = palette.blue5
M.hint = palette.fg1
M.ok = palette.green2
M.lsp_reference = palette.cyan1

-- Search
M.search = palette.green1
M.search_match = palette.blue4
M.match = palette.blue1

-- Shared Git and diff colors
M.changes = {
	add = {
		fg = palette.green2,
		line_bg = palette.green7,
		text_bg = palette.green8,
		text_fg = palette.fg4,
	},
	change = {
		fg = palette.blue4,
		line_bg = palette.blue6,
		text_bg = palette.blue7,
		text_fg = palette.fg4,
	},
	delete = {
		fg = palette.gray5,
		line_bg = palette.gray3,
		text_bg = palette.gray4,
		text_fg = palette.fg4,
	},
}
M.git_ignore = palette.fg1
M.git_merge = palette.purple1

-- Special elements
M.todo = palette.green3
M.link = palette.blue4
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
