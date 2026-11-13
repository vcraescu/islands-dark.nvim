--- @class theme.Palette
local M = {}

-- Numbers start at 1 without gaps; they are not brightness ranks.
-- Comments describe current theme usage.
-- Unverified values are preserved until IslandsDark.icls is available.

-- Backgrounds
M.bg1 = "#191A1C" -- Editor background, terminal black
M.bg2 = "#1F2024" -- Cursor line, gutter, inactive statusline background
M.bg3 = "#2B2D30" -- Statusline, color column background
M.bg4 = "#393B40" -- Folded text, quickfix line, inlay hint background
M.bg5 = "#27282B" -- Pmenu and floating window background (LOOKUP_COLOR, DOCUMENTATION_COLOR)

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
M.blue5 = "#25323E" -- Changed line background (DIFF_MODIFIED mixed 40% with editor background)
M.blue6 = "#385570" -- Changed text background (DIFF_MODIFIED)
M.blue7 = "#375FAD" -- Changed signs (MODIFIED_LINES_COLOR)
M.blue8 = "#70AEFF" -- Modified file status (FILESTATUS_MODIFIED)

-- Cyans
M.cyan1 = "#293C40" -- Markup code, LSP reference background
M.cyan2 = "#2AACB8" -- Numbers, special syntax, regular expressions

-- Greens
M.green1 = "#375239" -- Search result background
M.green2 = "#6AAB73" -- Strings, success messages, fzf marker
M.green3 = "#8BB33D" -- TODO comment foreground
M.green4 = "#5F826B" -- Documentation comments
M.green5 = "#67A37C" -- Documentation comment tags
M.green6 = "#2FBAA3" -- Special tag names
M.green7 = "#1F2B26" -- Added line background (DIFF_INSERTED mixed 40% with editor background)
M.green8 = "#294436" -- Added text, replacement preview background (DIFF_INSERTED)
M.green9 = "#549159" -- Added signs (ADDED_LINES_COLOR)

-- Reds
M.red1 = "#F75464" -- Errors
M.red2 = "#DE6A66" -- Conflicted file status (FILESTATUS_IDEA_FILESTATUS_MERGED_WITH_CONFLICTS)
M.red3 = "#E88F89" -- Untracked file status (FILESTATUS_UNKNOWN)

-- Yellows
M.yellow1 = "#B3AE60" -- Metadata, macros, preprocessor directives
M.yellow2 = "#D5B778" -- Tags, attributes, warnings
M.yellow3 = "#B09D79" -- Function calls; source unverified
M.yellow4 = "#AFBF7E" -- Include directives; source unverified

-- Oranges
M.orange1 = "#CC7832" -- Built-in functions, variables, types, constants; source unverified
M.orange2 = "#CF8E6D" -- Keywords, escape sequences
M.orange3 = "#D69A6B" -- Ignored file status (FILESTATUS_IDEA_FILESTATUS_IGNORED)

-- Purples
M.purple1 = "#C77DBB" -- Constants, properties

-- Grays
M.gray1 = "#43454A" -- Borders, separators, completion scrollbar thumb
M.gray2 = "#4B5059" -- Line numbers, ghost text
M.gray3 = "#868A91" -- Deleted signs (DELETED_LINES_COLOR)
M.gray4 = "#6F737A" -- Deleted file status (FILESTATUS_DELETED)
M.gray5 = "#484A4A" -- Deleted text background (DIFF_DELETED)
M.gray6 = "#2C2D2E" -- Deleted line background (DIFF_DELETED mixed 40% with editor background)

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
