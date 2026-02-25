-- Islands Dark Color Palette
-- Direct port of JetBrains IntelliJ IDEA Islands Dark theme
-- Based on color definitions from islands_dark.xml

local palette = require("islands-dark.palette")

--- @class theme.Colors
return {
	-- Base colors
	base = palette.base,
	base1 = palette.base1,
	base2 = palette.base2,
	fg = palette.text,
	fg_dim = palette.text1,
	fg_dimmer = palette.text2,

	-- UI colors
	cursor_line = palette.base1,
	cursor = palette.text,
	visual = palette.base2,
	visual_inactive = palette.base2,
	line_number = palette.text2,
	line_number_current = palette.text,
	fold_bg = palette.base2,
	border = palette.base2,
	color_column = palette.base2,

	-- Syntax colors (from Islands Dark color scheme)
	keyword = palette.orange,
	string = palette.green,
	number = palette.cyan,
	func = palette.blue,
	method = palette.blue,
	constant = palette.mauve,
	type = palette.teal_blue,
	type_definition = palette.text,
	type_parameter = palette.cyan,
	type_builtin = palette.rust,
	comment = palette.text2,
	doc_comment = palette.green,
	tag = palette.yellow,
	attribute = palette.text,
	operator = palette.text,
	punctuation = palette.text,
	variable = palette.text,
	parameter = palette.text,
	property = palette.mauve,
	label = palette.orange,

	-- Special syntax colors
	escape = palette.orange,
	regex = palette.cyan,
	metadata = palette.dark_yellow,
	identifier = palette.blue,
	braces = palette.text,
	special = palette.cyan,

	-- Diff colors
	diff_add = palette.dark_green,
	diff_delete = palette.dark_red,
	diff_change = palette.dark_blue,
	diff_text = palette.dark_blue,

	-- Diagnostics & Messages
	error = palette.red,
	warning = palette.yellow,
	info = palette.teal_blue,
	hint = palette.text2,
	todo = palette.olive,

	-- Special markers
	search = palette.dark_green, -- Search highlight background
	lsp_ref = palette.dark_teal, -- LspReference* background
	match = palette.dark_blue,
	search_match = palette.blue,

	-- VCS colors
	vcs_added = palette.green,
	vcs_changed = palette.blue,
	vcs_removed = palette.red,
	vcs_merged = palette.mauve,
	vcs_ignored = palette.text2,

	-- Template/Interpolation
	template_var = palette.lavender,

	-- URL/Hyperlink
	hyperlink = palette.blue,

	-- Special values
	none = palette.none,
}
