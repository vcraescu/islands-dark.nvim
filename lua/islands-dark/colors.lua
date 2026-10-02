--- @type theme.Colors
local M = {}
local palette = require("islands-dark.palette")

-- Backgrounds
M.background = palette.bg1
M.background_gutter = palette.bg2
M.background_surface = palette.bg3
M.background_highlight = palette.bg4

-- Foregrounds
M.foreground = palette.fg3
M.foreground_muted = palette.fg2
M.foreground_dim = palette.fg1
M.foreground_bright = palette.fg4
M.foreground_inlay = palette.fg5

-- Editor
M.border = palette.gray1
M.cursor = palette.fg3
M.cursorline = palette.bg2
M.quickfixline = palette.bg4
M.visual = palette.blue2
M.line_number = palette.gray2
M.line_number_current = palette.fg2
M.color_column = palette.bg3
M.fold = palette.bg3
M.ghost_text = palette.gray2
M.directory = palette.blue4
M.markup_code_background = palette.cyan1

-- Keywords and literals
M.keyword = palette.orange2
M.boolean = palette.orange2
M.string = palette.green2
M.number = palette.cyan2

-- Functions and methods
M.func = palette.blue4
M.func_builtin = palette.orange1
M.func_call = palette.yellow3
M.method = palette.blue4

-- Variables and parameters
M.variable = palette.fg3
M.variable_builtin = palette.orange1
M.parameter = palette.fg3
M.property = palette.purple1

-- Types and constants
M.type = palette.blue5
M.type_builtin = palette.orange1
M.type_parameter = palette.cyan2
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
		fg = palette.red2,
		line_bg = palette.red3,
		text_bg = palette.red4,
		text_fg = palette.fg4,
	},
}
M.git_ignore = palette.fg1
M.git_merge = palette.purple1

-- Special elements
M.todo = palette.green3
M.note = palette.blue5
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
