--- @class theme.Colors
local M = {}

-- ============================================================================
-- SECTION 1: BASE PALETTE (Source of Truth)
-- All hex values from IslandsDark.icls
-- Naming: {color}{number} where 1=darkest, increasing=lighter
-- ============================================================================

-- ───────────────────────────────────────────────────────────────────────────
-- Backgrounds (1=darkest → 3=lightest)
-- ───────────────────────────────────────────────────────────────────────────
M.bg1 = "#191A1C" -- EDITOR_BACKGROUND
M.bg2 = "#1F2024" -- GUTTER_BACKGROUND
M.bg3 = "#2B2D30" -- SELECTION_BACKGROUND
M.bg4 = "#393b40" -- CURSOR_LINE_BACKGROUND_ALT

-- ───────────────────────────────────────────────────────────────────────────
-- Foregrounds (1=darkest → 3=lightest)
-- ───────────────────────────────────────────────────────────────────────────
M.fg1 = "#7A7E85" -- COMMENT
M.fg2 = "#A1A3AB" -- LINE_NUMBER
M.fg3 = "#BCBEC4" -- DEFAULT_TEXT
M.fg4 = "#d1d3d9"

-- ───────────────────────────────────────────────────────────────────────────
-- Blues (1=darkest → 4=lightest)
-- ───────────────────────────────────────────────────────────────────────────
M.blue1 = "#114957" -- SEARCH_RESULT_BACKGROUND (dark blue)
M.blue2 = "#214283" -- VISUAL_SELECTION (blue)
M.blue3 = "#548AF7" -- DEFAULT_INSTANCE_METHOD (bright blue)
M.blue4 = "#56A8F5" -- DEFAULT_FUNCTION_DECLARATION (standard blue)
M.blue5 = "#6FAFBD" -- DEFAULT_CLASS_NAME (teal blue)

-- ───────────────────────────────────────────────────────────────────────────
-- Cyans/Teals (1=darkest → 2=lightest)
-- ───────────────────────────────────────────────────────────────────────────
M.cyan1 = "#293C40" -- LSP_REFERENCE_BACKGROUND (dark teal)
M.cyan2 = "#2AACB8" -- DEFAULT_NUMBER (cyan)

-- ───────────────────────────────────────────────────────────────────────────
-- Greens (1=darkest → 2=lightest)
-- ───────────────────────────────────────────────────────────────────────────
M.green1 = "#375239" -- ADDED_LINES_COLOR (dark green)
M.green2 = "#6AAB73" -- DEFAULT_STRING (green)

-- ───────────────────────────────────────────────────────────────────────────
-- Reds (1=darkest → 2=lightest)
-- ───────────────────────────────────────────────────────────────────────────
M.red1 = "#5E3838" -- DELETED_LINES_COLOR (dark red)
M.red2 = "#F75464" -- ERRORS_ATTRIBUTES (red)

-- ───────────────────────────────────────────────────────────────────────────
-- Yellows (1=darkest → 2=lightest)
-- ───────────────────────────────────────────────────────────────────────────
M.yellow1 = "#B3AE60" -- TODO_DEFAULT (olive/muted yellow)
M.yellow2 = "#D5B778" -- DEFAULT_TAG (yellow)
M.yellow3 = "#B09D79" -- FUNCTION_CALL (mustard yellow)
M.yellow4 = "#AFBF7E"

-- ───────────────────────────────────────────────────────────────────────────
-- Oranges (1=darkest → 2=lightest)
-- ───────────────────────────────────────────────────────────────────────────
M.orange1 = "#CC7832" -- DEFAULT_STATIC_FIELD (rust orange)
M.orange2 = "#CF8E6D" -- DEFAULT_KEYWORD (orange)

-- ───────────────────────────────────────────────────────────────────────────
-- Purples (1=darkest → 2=lightest)
-- ───────────────────────────────────────────────────────────────────────────
M.purple1 = "#C77DBB" -- DEFAULT_CONSTANT (mauve)
M.purple2 = "#B189F5" -- DEFAULT_TEMPLATE_LANGUAGE (lavender/bright purple)

-- ───────────────────────────────────────────────────────────────────────────
-- Grays (1=darkest → 2=lightest)
-- ───────────────────────────────────────────────────────────────────────────
M.gray1 = "#43454A" -- BORDER_COLOR (gray blue)

-- ───────────────────────────────────────────────────────────────────────────
-- Special
-- ───────────────────────────────────────────────────────────────────────────
M.none = "NONE"

-- ============================================================================
-- SECTION 2: SEMANTIC ALIASES (How Colors Are Used)
-- Provides descriptive names for highlight definitions
-- ============================================================================

-- ───────────────────────────────────────────────────────────────────────────
-- Base Aliases (Familiar Naming)
-- ───────────────────────────────────────────────────────────────────────────
M.base = M.bg1
M.base1 = M.bg2
M.base2 = M.bg3
M.base3 = M.bg4

M.text = M.fg3
M.text1 = M.fg2
M.text2 = M.fg1
M.text3 = M.fg4

-- ───────────────────────────────────────────────────────────────────────────
-- Editor UI Elements
-- ───────────────────────────────────────────────────────────────────────────
M.border = M.gray1
M.cursor = M.text
M.cursorline = M.base1
M.visual = M.blue2
M.line_number = M.text2
M.color_column = M.base2
M.fold = M.base2

-- ───────────────────────────────────────────────────────────────────────────
-- Syntax Highlighting
-- ───────────────────────────────────────────────────────────────────────────
-- Keywords & Control Flow
M.keyword = M.orange2
M.boolean = M.orange2

-- Strings
M.string = M.green2
M.string_escape = M.orange2
M.string_regex = M.cyan2

-- Numbers
M.number = M.cyan2

-- Functions & Methods
M.func = M.blue4
M.func_builtin = M.orange1
M.func_call = M.yellow3
M.method = M.blue4

-- Variables & Parameters
M.variable = M.text
M.variable_builtin = M.orange1
M.parameter = M.text
M.property = M.purple1

-- Types
M.type = M.blue5
M.type_builtin = M.orange1
M.type_parameter = M.cyan2
M.type_definition = M.text

-- Constants
M.constant = M.purple1
M.constant_builtin = M.orange1

-- Comments
M.comment = M.text2
M.comment_doc = M.green2

-- Operators & Punctuation
M.operator = M.text
M.punctuation = M.text
M.delimiter = M.text

-- Tags & Attributes
M.tag = M.yellow2
M.attribute = M.text

-- Labels & Special
M.label = M.yellow4
M.metadata = M.yellow1
M.identifier = M.blue4
M.special = M.cyan2
M.escape = M.orange2
M.regex = M.cyan2
M.braces = M.text

-- ───────────────────────────────────────────────────────────────────────────
-- Diagnostics & LSP
-- ───────────────────────────────────────────────────────────────────────────
M.error = M.red2
M.warning = M.yellow2
M.info = M.blue5
M.hint = M.text2
M.ok = M.green2

M.lsp_reference = M.cyan1

-- ───────────────────────────────────────────────────────────────────────────
-- Search & Matching
-- ───────────────────────────────────────────────────────────────────────────
M.search = M.green1
M.search_match = M.blue4
M.match = M.blue1

-- ───────────────────────────────────────────────────────────────────────────
-- Diff & Version Control
-- ───────────────────────────────────────────────────────────────────────────
M.diff_add = M.green1
M.diff_delete = M.red1
M.diff_change = M.blue1

M.git_add = M.green2
M.git_change = M.blue4
M.git_delete = M.red2
M.git_ignore = M.text2

-- ───────────────────────────────────────────────────────────────────────────
-- Special Elements
-- ───────────────────────────────────────────────────────────────────────────
M.todo = M.yellow1
M.note = M.blue5
M.link = M.blue4

return M
