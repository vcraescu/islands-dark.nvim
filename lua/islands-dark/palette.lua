--- @type theme.Palette
local M = {}

-- Numbers start at 1 without gaps; they are not brightness ranks.
-- Comments describe current theme usage.
-- Unverified values are preserved until IslandsDark.icls is available.

-- Backgrounds
M.bg1 = "#191A1C" -- Editor background, terminal black
M.bg2 = "#1F2024" -- Cursor line, gutter, inactive statusline background
M.bg3 = "#2B2D30" -- Statusline, color column background
M.bg4 = "#393B40" -- Folded text, quickfix line, inlay hint background

-- Foregrounds
M.fg1 = "#7A7E85" -- Comments, dim text, diagnostic hints, terminal bright black
M.fg2 = "#A1A3AB" -- Muted text, current line number, terminal white
M.fg3 = "#BCBEC4" -- Text, variables, parameters, operators, delimiters, cursor, terminal bright white
M.fg4 = "#D1D3D9" -- File explorer text, selected fzf entry foreground; source unverified
M.fg5 = "#858A94" -- Inlay hint foreground
M.fg6 = "#868991" -- Folded text foreground

-- Blues
M.blue1 = "#114957" -- Current search, incremental search, matching bracket background
M.blue2 = "#214283" -- Visual selection background; source unverified
M.blue3 = "#56A8F5" -- Functions, directories, links, match text, changed signs
M.blue4 = "#6FAFBD" -- Types, diagnostic information; source unverified
M.blue5 = "#25323E" -- Changed line background; user-specified
M.blue6 = "#385570" -- Changed text background; user-specified

-- Cyans
M.cyan1 = "#293C40" -- Markup code, LSP reference background
M.cyan2 = "#2AACB8" -- Numbers, special syntax, regular expressions

-- Greens
M.green1 = "#375239" -- Search result background
M.green2 = "#6AAB73" -- Strings, success messages, added signs
M.green3 = "#8BB33D" -- TODO comment foreground
M.green4 = "#5F826B" -- Documentation comments
M.green5 = "#67A37C" -- Documentation comment tags
M.green6 = "#2FBAA3" -- Special tag names
M.green7 = "#1F2B26" -- Added line background; user-specified
M.green8 = "#294436" -- Added text, replacement preview background; user-specified

-- Reds
M.red1 = "#F75464" -- Errors, conflict foreground
M.red2 = "#2B2322" -- Conflict line, deleted virtual line, deletion preview background; user-specified
M.red3 = "#45302B" -- Conflict text, deleted text background; user-specified

-- Yellows
M.yellow1 = "#B3AE60" -- Metadata, macros, preprocessor directives
M.yellow2 = "#D5B778" -- Tags, attributes, warnings
M.yellow3 = "#B09D79" -- Function calls; source unverified
M.yellow4 = "#AFBF7E" -- Include directives; source unverified

-- Oranges
M.orange1 = "#CC7832" -- Built-in functions, variables, types, constants; source unverified
M.orange2 = "#CF8E6D" -- Keywords, escape sequences

-- Purples
M.purple1 = "#C77DBB" -- Constants, properties, Git merge indicators

-- Grays
M.gray1 = "#43454A" -- Borders, separators, completion scrollbar thumb
M.gray2 = "#4B5059" -- Line numbers, ghost text
M.gray3 = "#2C2D2E" -- Unused; user-specified
M.gray4 = "#484A4A" -- Unused; user-specified
M.gray5 = "#868A91" -- Deleted signs, removed text foreground

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
