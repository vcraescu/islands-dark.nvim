-- Islands Dark Color Palette
-- Direct port of JetBrains IntelliJ IDEA Islands Dark theme
-- Based on color definitions from islands_dark.xml

local palette = require("islands-dark.palette")

--- @class theme.Colors
return {
	-- Base colors
	bg = palette.base,
	bg_alt = palette.charcoal,
	fg = palette.text,
	fg_dim = palette.silver,
	fg_dimmer = palette.gray,

	-- UI colors
	cursor_line = palette.dark_gray,
	cursor = palette.light_gray,
	visual = palette.charcoal,
	visual_inactive = palette.slate,
	line_number = palette.steel,
	line_number_current = palette.silver,
	fold_bg = palette.charcoal,
	border = palette.slate,
	color_column = palette.slate,

	-- Syntax colors (from Islands Dark color scheme)
	keyword = palette.orange,
	string = palette.green,
	number = palette.cyan,
	func = palette.blue,
	method = palette.blue,
	constant = palette.mauve,
	type = palette.teal_blue,
	type_definition = palette.text,
	type_parameter = palette.teal,
	type_builtin = palette.rust,
	comment = palette.muted_gray,
	doc_comment = palette.sage,
	tag = palette.khaki,
	attribute = palette.text,
	operator = palette.text,
	punctuation = palette.text,
	variable = palette.text,
	parameter = palette.text,
	field = palette.mauve,
	property = palette.mauve,
	enum_member = palette.mauve,
	label = palette.orange,

	-- Special syntax colors
	escape = palette.orange,
	regex = palette.teal,
	metadata = palette.khaki,
	identifier = palette.blue,
	braces = palette.text,
	special = palette.cyan,

	-- Diff colors
	diff_add = palette.dark_green,
	diff_delete = palette.dark_red,
	diff_change = palette.gray_blue,
	diff_text = palette.gray_blue,

	-- Diagnostics & Messages
	error = palette.red,
	warning = palette.yellow,
	info = palette.khaki,
	hint = palette.dim_gray,
	todo = palette.khaki,

	-- Special markers
	search_bg = palette.dark_green,
	search_fg = palette.text,
	search_current_bg = palette.dark_blue,
	search_current_fg = palette.text,
	match_paren_bg = palette.gray_blue,
	write_identifier_bg = palette.dark_red,
	identifier_under_caret_bg = palette.dark_teal,

	-- VCS colors
	vcs_added = palette.dark_green,
	vcs_modified = palette.gray_blue,
	vcs_removed = palette.dark_red,

	-- Additional semantic colors
	deprecated = palette.dim_gray,

	-- Template/Interpolation
	template_var = palette.lavender,

	-- URL/Hyperlink
	hyperlink = palette.blue,

	-- Special values
	none = palette.none,
}
