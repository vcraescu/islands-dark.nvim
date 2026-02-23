-- Islands Dark Color Palette
-- Direct port of JetBrains IntelliJ IDEA Islands Dark theme
-- Based on color definitions from islands_dark.xml

--- @class theme.Colors
local colors = {
	-- Base colors
	bg = "#191A1C", -- CONSOLE_BACKGROUND_KEY
	bg_alt = "#2B2D30", -- DIFF_SEPARATORS_BACKGROUND, FOLDED_TEXT_BORDER_COLOR
	fg = "#BCBEC4", -- DEFAULT_FOREGROUND
	fg_dim = "#A1A3AB", -- Dimmed text
	fg_dimmer = "#868A91", -- More dimmed text

	-- UI colors
	cursor_line = "#1F2024", -- CARET_ROW_COLOR
	cursor = "#CED0D6", -- DEFAULT_CARET
	visual = "#2B2D30", -- RECENT_LOCATIONS_SELECTION (no explicit SELECTION_BACKGROUND)
	visual_inactive = "#323438", -- INDENT_GUIDE
	line_number = "#4B5059", -- LINE_NUMBERS_COLOR
	line_number_current = "#A1A3AB", -- LINE_NUMBER_ON_CARET_ROW_COLOR
	fold_bg = "#2B2D30", -- FOLDED_TEXT_BORDER_COLOR
	border = "#323438", -- Separator/border color (lighter for better visibility)
	color_column = "#323438", -- VERTICAL_LINE_COLOR

	-- Syntax colors (from Islands Dark color scheme)
	keyword = "#CF8E6D", -- DEFAULT_KEYWORD
	string = "#6AAB73", -- DEFAULT_STRING
	number = "#2AACB8", -- DEFAULT_NUMBER
	func = "#56A8F5", -- DEFAULT_FUNCTION_DECLARATION
	method = "#57AAF7", -- DEFAULT_INSTANCE_METHOD
	constant = "#C77DBB", -- DEFAULT_CONSTANT, DEFAULT_STATIC_FIELD
	type = "#6FAFBD", -- TYPE_PARAMETER_NAME_ATTRIBUTES
	type_definition = "#BCBEC4", -- TYPE_PARAMETER_NAME_ATTRIBUTES
	type_parameter = "#16BAAC", -- Type parameters like <T> (TYPE_PARAMETER_NAME_ATTRIBUTES)
	type_builtin = "#CC7832", -- Built-in types (same as type)
	comment = "#7A7E85", -- DEFAULT_LINE_COMMENT
	doc_comment = "#5F826B", -- DEFAULT_DOC_COMMENT
	tag = "#D5B778", -- DEFAULT_TAG (HTML/XML)
	attribute = "#BCBEC4", -- DEFAULT_ATTRIBUTE (HTML)
	operator = "#BCBEC4", -- DEFAULT_OPERATION_SIGN
	punctuation = "#BCBEC4", -- DEFAULT_COMMA, DEFAULT_DOT, etc.
	variable = "#BCBEC4", -- DEFAULT_LOCAL_VARIABLE
	parameter = "#BCBEC4", -- DEFAULT_PARAMETER
	field = "#C77DBB", -- DEFAULT_INSTANCE_FIELD
	property = "#C77DBB", -- Properties, same as fields
	enum_member = "#C77DBB", -- DEFAULT_CONSTANT (same as constant)
	label = "#CF8E6D", -- DEFAULT_LABEL

	-- Special syntax colors
	escape = "#CF8E6D", -- DEFAULT_VALID_STRING_ESCAPE
	regex = "#42C3D4", -- JS.REGEXP
	metadata = "#B3AE60", -- DEFAULT_METADATA
	identifier = "#56A8F5", -- DEFAULT_IDENTIFIER (functions, imports)
	braces = "#BCBEC4", -- DEFAULT_BRACES, DEFAULT_BRACKETS, DEFAULT_PARENTHESES
	special = "#2AACB8",

	-- Diff colors
	diff_add = "#375239", -- LINE_FULL_COVERAGE
	diff_delete = "#5E3838", -- LINE_NONE_COVERAGE
	diff_change = "#3F4045", -- MATCHED_TAG_NAME
	diff_text = "#43454A", -- METHOD_SEPARATORS_COLOR

	-- Diagnostics & Messages
	error = "#F75464", -- ERRORS_ATTRIBUTES
	warning = "#F2C55C", -- WARNING_ATTRIBUTES
	info = "#857042", -- INFORMATION_ATTRIBUTES
	hint = "#6F737A", -- Default gray for hints
	todo = "#B3AE60", -- TODO_DEFAULT_ATTRIBUTES

	-- Special markers
	search_bg = "#2D543F", -- SEARCH_RESULT_ATTRIBUTES
	search_fg = "#BCBEC4",
	search_current_bg = "#114957", -- TEXT_SEARCH_RESULT_ATTRIBUTES
	search_current_fg = "#BCBEC4",
	match_paren_bg = "#43454A", -- MATCHED_BRACE_ATTRIBUTES
	write_identifier_bg = "#402F33", -- WRITE_IDENTIFIER_UNDER_CARET_ATTRIBUTES
	identifier_under_caret_bg = "#373B39", -- IDENTIFIER_UNDER_CARET_ATTRIBUTES

	-- VCS colors
	vcs_added = "#375239", -- LINE_FULL_COVERAGE
	vcs_modified = "#3F4045", -- MATCHED_TAG_NAME
	vcs_removed = "#5E3838", -- LINE_NONE_COVERAGE

	-- Additional semantic colors
	deprecated = "#6F737A", -- NOT_USED_ELEMENT_ATTRIBUTES

	-- Template/Interpolation
	template_var = "#B189F5", -- TEMPLATE_VARIABLE_ATTRIBUTES (lavender)

	-- Injected language
	injected_lang_bg = "#293C40", -- INJECTED_LANGUAGE_FRAGMENT

	-- URL/Hyperlink
	hyperlink = "#548AF7", -- HYPERLINK_ATTRIBUTES

	-- Special values
	none = "NONE",
}

return colors
