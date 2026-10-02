--- @type theme.Palette
local M = {}

-- Numbers are stable identifiers, not brightness ranks.
-- Source names refer to the theme export in test/IslandsDark.xml.
-- Unverified values are preserved until IslandsDark.icls is available.
-- User-specified diff backgrounds are marked below.

-- Backgrounds
M.bg1 = "#191A1C" -- TEXT.BACKGROUND
M.bg2 = "#1F2024" -- CARET_ROW_COLOR
M.bg3 = "#2B2D30" -- DIFF_SEPARATORS_BACKGROUND
M.bg4 = "#393B40" -- INLINE_PARAMETER_HINT.BACKGROUND

-- Foregrounds
M.fg1 = "#7A7E85" -- DEFAULT_LINE_COMMENT.FOREGROUND
M.fg2 = "#A1A3AB" -- LINE_NUMBER_ON_CARET_ROW_COLOR
M.fg3 = "#BCBEC4" -- TEXT.FOREGROUND
M.fg4 = "#D1D3D9" -- Unverified: original .icls not included
M.fg5 = "#858A94" -- INLINE_PARAMETER_HINT.FOREGROUND
M.fg6 = "#868991" -- FOLDED_TEXT_ATTRIBUTES.FOREGROUND

-- Blues
M.blue1 = "#114957" -- TEXT_SEARCH_RESULT_ATTRIBUTES.BACKGROUND
M.blue2 = "#214283" -- Unverified: original .icls not included
M.blue4 = "#56A8F5" -- DEFAULT_FUNCTION_DECLARATION.FOREGROUND
M.blue5 = "#6FAFBD" -- Unverified: original .icls not included
M.blue6 = "#25323E" -- User-specified changed line background
M.blue7 = "#385570" -- User-specified changed text background

-- Cyans
M.cyan1 = "#293C40" -- INJECTED_LANGUAGE_FRAGMENT.BACKGROUND
M.cyan2 = "#2AACB8" -- DEFAULT_NUMBER.FOREGROUND

-- Greens
M.green1 = "#375239" -- LINE_FULL_COVERAGE.FOREGROUND
M.green2 = "#6AAB73" -- DEFAULT_STRING.FOREGROUND
M.green3 = "#8BB33D" -- TODO_DEFAULT_ATTRIBUTES.FOREGROUND
M.green4 = "#5F826B" -- DEFAULT_DOC_COMMENT.FOREGROUND
M.green5 = "#67A37C" -- DEFAULT_DOC_COMMENT_TAG.FOREGROUND
M.green6 = "#2FBAA3" -- HTML_CUSTOM_TAG_NAME.FOREGROUND
M.green7 = "#1F2B26" -- User-specified added line background
M.green8 = "#294436" -- User-specified added text background

-- Reds
M.red2 = "#F75464" -- BAD_CHARACTER.FOREGROUND

-- Yellows
M.yellow1 = "#B3AE60" -- DEFAULT_METADATA.FOREGROUND
M.yellow2 = "#D5B778" -- HTML_TAG_NAME.FOREGROUND
M.yellow3 = "#B09D79" -- Unverified: original .icls not included
M.yellow4 = "#AFBF7E" -- Unverified: original .icls not included

-- Oranges
M.orange1 = "#CC7832" -- Unverified: original .icls not included
M.orange2 = "#CF8E6D" -- DEFAULT_KEYWORD.FOREGROUND

-- Purples
M.purple1 = "#C77DBB" -- DEFAULT_CONSTANT.FOREGROUND

-- Grays
M.gray1 = "#43454A" -- METHOD_SEPARATORS_COLOR
M.gray2 = "#4B5059" -- LINE_NUMBERS_COLOR
M.gray3 = "#2C2D2E" -- User-specified deleted line background
M.gray4 = "#484A4A" -- User-specified deleted text background
M.gray5 = "#868A91" -- DELETED_LINES_COLOR

-- ANSI colors: original .icls sources are not included in the theme export.
M.terminal = {
	red = "#F0524F", -- Unverified: ANSI red
	bright_red = "#FF4050", -- Unverified: ANSI bright red
	green = "#5C962C", -- Unverified: ANSI green
	bright_green = "#4FC414", -- Unverified: ANSI bright green
	yellow = "#A68A0D", -- Unverified: ANSI yellow
	bright_yellow = "#E5BF00", -- Unverified: ANSI bright yellow
	blue = "#3993D4", -- Unverified: ANSI blue
	bright_blue = "#1FB0FF", -- Unverified: ANSI bright blue
	magenta = "#A771BF", -- Unverified: ANSI magenta
	bright_magenta = "#ED7EED", -- Unverified: ANSI bright magenta
	cyan = "#00A3A3", -- Unverified: ANSI cyan
	bright_cyan = "#00E5E5", -- Unverified: ANSI bright cyan
}

return M
