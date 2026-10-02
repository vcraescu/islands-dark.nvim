vim.opt.runtimepath:prepend(vim.fn.getcwd())

local theme = require("islands-dark")
local colors = require("islands-dark.colors")
local palette = require("islands-dark.palette")
local editor = require("islands-dark.highlights.editor")
local gitsigns = require("islands-dark.highlights.integrations.gitsigns")
local nvim_tree = require("islands-dark.highlights.integrations.nvim-tree")
local util = require("islands-dark.util")

--- Check a resolved highlight color.
--- @param group string Highlight group
--- @param attribute string Color attribute
--- @param expected string Expected hex value or NONE
--- @return nil
local function assert_highlight(group, attribute, expected)
	local highlight = vim.api.nvim_get_hl(0, { name = group, link = false })
	local actual = highlight[attribute]
	local value = expected ~= "NONE" and tonumber(expected:sub(2), 16) or nil
	assert(actual == value, group .. "." .. attribute .. ": " .. vim.inspect(highlight))
end

--- Calculate relative luminance for contrast checks.
--- @param color string Hex color
--- @return number
local function luminance(color)
	local channels = {}
	for index = 1, 3 do
		local offset = 2 + (index - 1) * 2
		local channel = tonumber(color:sub(offset, offset + 1), 16) / 255
		channels[index] = channel <= 0.04045 and channel / 12.92 or ((channel + 0.055) / 1.055) ^ 2.4
	end
	return channels[1] * 0.2126 + channels[2] * 0.7152 + channels[3] * 0.0722
end

-- Preserve the supplied backgrounds and use a light inline foreground.
local expected_changes = {
	add = { line_bg = "#1F2B26", text_bg = "#294436" },
	change = { line_bg = "#25323E", text_bg = "#385570" },
	delete = { line_bg = "#2C2D2E", text_bg = "#484A4A" },
}
for kind, change_colors in pairs(colors.changes) do
	assert(change_colors.line_bg == expected_changes[kind].line_bg)
	assert(change_colors.text_bg == expected_changes[kind].text_bg)
	assert(change_colors.text_fg == palette.fg4)
	assert(luminance(change_colors.text_fg) > luminance(change_colors.text_bg))
end

assert(colors.changes.delete.fg == "#868A91")

-- Raw colors must not leak into the semantic API.
for name in pairs(palette) do
	if name ~= "terminal" then
		assert(colors[name] == nil, "Raw palette field exported: " .. name)
	end
end
for _, name in ipairs({ "base", "base1", "base2", "base3", "text", "text1", "text2", "text3", "text4" }) do
	assert(colors[name] == nil, "Old alias exported: " .. name)
end
for _, kind in ipairs({ "add", "change", "delete" }) do
	assert(colors["git_" .. kind] == nil)
	assert(colors["diff_" .. kind] == nil)
end

-- Semantic values must come from the raw palette.
local palette_values = { NONE = true }
for _, value in pairs(palette) do
	if type(value) == "table" then
		for _, terminal_color in pairs(value) do
			palette_values[terminal_color] = true
		end
	else
		palette_values[value] = true
	end
end

--- Check that semantic values use the palette.
--- @param values table Semantic color table
--- @return nil
local function assert_palette_values(values)
	for name, value in pairs(values) do
		if type(value) == "table" then
			assert_palette_values(value)
		else
			assert(palette_values[value], "Color outside the palette: " .. name)
		end
	end
end
assert_palette_values(colors)

-- A shared role must control every consumer, not just the initial defaults.
local custom_colors = vim.deepcopy(colors)
for _, kind in ipairs({ "add", "change", "delete" }) do
	custom_colors.changes[kind] = {
		fg = palette.fg3,
		line_bg = palette.bg2,
		text_bg = palette.bg4,
		text_fg = palette.fg4,
	}
end
local editor_groups = editor.get(custom_colors)
local git_groups = gitsigns.get(custom_colors)
local tree_groups = nvim_tree.get(custom_colors)
for _, kind in ipairs({ "Add", "Change", "Delete" }) do
	if kind ~= "Delete" then
		assert(editor_groups["Diff" .. kind].bg == palette.bg2)
	end
	assert(git_groups["GitSigns" .. kind].fg == palette.fg3)
	if kind ~= "Change" then
		assert(git_groups["GitSigns" .. kind .. "Inline"].bg == palette.bg4)
		assert(git_groups["GitSigns" .. kind .. "Inline"].fg == palette.fg4)
	end
end
assert(editor_groups.DiffDelete.bg == custom_colors.background_gutter)
assert(editor_groups.DiffDelete.fg == custom_colors.foreground_dim)
assert(editor_groups.DiffText.bg == palette.bg4)
assert(editor_groups.DiffText.fg == palette.fg4)
assert(editor_groups.DiffTextAdd.link == "DiffText")
assert(git_groups.GitSignsTopdelete.link == "GitSignsDelete")
assert(git_groups.GitSignsChangedelete.link == "GitSignsDelete")
assert(git_groups.GitSignsAddLn.bg == palette.bg2)
assert(git_groups.GitSignsChangeLn.bg == palette.bg2)
assert(git_groups.GitSignsDeleteVirtLn.bg == palette.bg2)
assert(git_groups.GitSignsDeletePreview.link == "GitSignsDeleteVirtLn")
assert(git_groups.GitSignsChangeInline.link == "GitSignsAddInline")
assert(git_groups.GitSignsAddLnInline.link == "GitSignsChangeLnInline")
assert(git_groups.GitSignsChangeLnInline.bg == palette.bg4)
assert(git_groups.GitSignsChangeLnInline.fg == palette.fg4)
assert(git_groups.GitSignsDeleteLnInline.link == "GitSignsChangeLnInline")
assert(tree_groups.NvimTreeGitNew.fg == palette.fg3)
assert(tree_groups.NvimTreeGitDirty.fg == palette.fg3)
assert(tree_groups.NvimTreeGitDeleted.fg == palette.fg3)

-- Transparent loads must not mutate either color module.
local transparent_colors = util.apply_overrides(colors, { transparent = true })
assert(transparent_colors.background == colors.none)
assert(transparent_colors.fold == colors.none)
assert(colors.background == palette.bg1)
assert(colors.fold == "#393B40")
assert(colors.fold_foreground == "#868991")
assert(colors.fold ~= colors.background)
assert(colors.fold ~= colors.changes.delete.line_bg)
transparent_colors.changes.add.fg = palette.fg1
transparent_colors.terminal.red = palette.red1
assert(colors.changes.add.fg == palette.green2)
assert(colors.terminal.red == palette.terminal.red)

for _, transparent in ipairs({ false, true, false }) do
	theme.setup({ transparent = transparent })
	theme.load()
	assert(vim.g.colors_name == "islands-dark")
	assert_highlight("Normal", "fg", colors.foreground)
	assert_highlight("Normal", "bg", transparent and colors.none or colors.background)
	assert_highlight("FloatTitle", "bg", transparent and colors.none or colors.background)
	assert_highlight("Folded", "fg", "#868991")
	assert_highlight("Folded", "bg", transparent and colors.none or "#393B40")
	local folded = vim.api.nvim_get_hl(0, { name = "Folded", link = false })
	assert(not folded.italic)
	assert(not folded.bold)
	assert_highlight("StatusLine", "bg", colors.background_surface)
	assert_highlight("StatusLineNC", "bg", colors.background_gutter)
	assert_highlight("DiffAdd", "bg", colors.changes.add.line_bg)
	assert_highlight("DiffChange", "bg", colors.changes.change.line_bg)
	assert_highlight("DiffDelete", "bg", colors.background_gutter)
	assert_highlight("DiffDelete", "fg", colors.foreground_dim)
	assert_highlight("DiffText", "bg", colors.changes.change.text_bg)
	assert_highlight("DiffText", "fg", colors.changes.change.text_fg)
	assert_highlight("DiffTextAdd", "bg", colors.changes.change.text_bg)
	assert_highlight("@diff.minus", "bg", colors.changes.delete.line_bg)
	assert_highlight("GitSignsAddLn", "bg", colors.changes.add.line_bg)
	assert_highlight("GitSignsChangeLn", "bg", "#25323E")
	assert_highlight("GitSignsAddLnInline", "bg", "#385570")
	assert_highlight("GitSignsDeleteVirtLn", "bg", colors.changes.delete.line_bg)
	assert_highlight("GitSignsDeletePreview", "bg", colors.changes.delete.line_bg)
	for _, group in ipairs({ "GitSignsDelete", "GitSignsTopdelete", "GitSignsChangedelete" }) do
		assert_highlight(group, "fg", "#868A91")
		assert_highlight(group, "bg", colors.none)
	end
	for _, kind in ipairs({ "Add", "Change", "Delete" }) do
		local change_colors = colors.changes[kind:lower()]
		assert_highlight("GitSigns" .. kind, "fg", change_colors.fg)
		local preview_colors = kind == "Change" and colors.changes.add or change_colors
		assert_highlight("GitSigns" .. kind .. "Inline", "bg", preview_colors.text_bg)
		assert_highlight("GitSigns" .. kind .. "Inline", "fg", preview_colors.text_fg)
		assert_highlight("GitSigns" .. kind .. "LnInline", "bg", colors.changes.change.text_bg)
		assert_highlight("GitSigns" .. kind .. "LnInline", "fg", colors.changes.change.text_fg)
	end
	assert_highlight("GitSignsDeleteVirtLnInLine", "bg", colors.changes.delete.text_bg)
	assert_highlight("GitSignsDeleteVirtLnInLine", "fg", colors.changes.delete.text_fg)
	assert_highlight("DiffTextAdd", "fg", colors.changes.change.text_fg)
	local terminal_names = {
		"black",
		"red",
		"green",
		"yellow",
		"blue",
		"magenta",
		"cyan",
		"white",
		"bright_black",
		"bright_red",
		"bright_green",
		"bright_yellow",
		"bright_blue",
		"bright_magenta",
		"bright_cyan",
		"bright_white",
	}
	for index, name in ipairs(terminal_names) do
		assert(vim.g["terminal_color_" .. (index - 1)] == colors.terminal[name])
	end
	local fzf_colors = theme.get_fzf_colors()
	local background = transparent and colors.none or colors.background
	assert(fzf_colors:find("fg:" .. colors.foreground, 1, true))
	assert(fzf_colors:find("bg:" .. background, 1, true))
	assert(fzf_colors:find("gutter:" .. background, 1, true))
end

for index = 0, 15 do
	vim.g["terminal_color_" .. index] = nil
end
theme.setup({ terminal_colors = false })
theme.load()
for index = 0, 15 do
	assert(vim.g["terminal_color_" .. index] == nil)
end

--- Return highlight overrides using semantic colors.
--- @param c theme.Colors Semantic colors
--- @return theme.Highlights
local function overrides(c)
	return { Function = { fg = c.foreground_bright, bold = true } }
end

--- Modify highlights using shared change colors.
--- @param highlights theme.Highlights Highlight groups
--- @param c theme.Colors Semantic colors
--- @return nil
local function on_highlights(highlights, c)
	highlights.GitSignsAdd = { fg = c.changes.change.fg }
end

theme.setup({ overrides = overrides, on_highlights = on_highlights })
theme.load()
assert_highlight("Function", "fg", colors.foreground_bright)
assert(vim.api.nvim_get_hl(0, { name = "Function", link = false }).bold)
assert_highlight("GitSignsAdd", "fg", colors.changes.change.fg)

theme.setup({ styles = { functions = { italic = true }, comments = { italic = true } } })
theme.load()
for _, group in ipairs({ "Function", "@function", "@function.builtin", "Comment", "@comment" }) do
	assert(vim.api.nvim_get_hl(0, { name = group, link = false }).italic, "Style missing: " .. group)
end
vim.api.nvim_set_hl(0, "Function", { fg = tonumber(colors.keyword:sub(2), 16) })
assert_highlight("@function", "fg", colors.keyword)

-- Verify which groups native diff actually uses on each supported version.
local before = vim.api.nvim_create_buf(false, true)
local after = vim.api.nvim_create_buf(false, true)
vim.api.nvim_buf_set_lines(before, 0, -1, false, { "keep", "return total", "keep2" })
vim.api.nvim_buf_set_lines(after, 0, -1, false, { "keep", "return total + tax", "keep2", "new line" })
vim.api.nvim_win_set_buf(0, before)
local before_window = vim.api.nvim_get_current_win()
vim.cmd("diffthis")
vim.cmd("vsplit")
vim.api.nvim_win_set_buf(0, after)
local after_window = vim.api.nvim_get_current_win()
vim.cmd("diffthis")
local detailed_inline = vim.fn.has("nvim-0.12") == 1
if detailed_inline then
	vim.opt.diffopt:append("inline:word")
end
vim.cmd("diffupdate")
assert(vim.fn.synIDattr(vim.fn.diff_hlID(2, 1), "name") == "DiffChange")
assert(vim.fn.synIDattr(vim.fn.diff_hlID(4, 1), "name") == "DiffAdd")
local insertion_group = detailed_inline and "DiffTextAdd" or "DiffText"
assert(vim.fn.synIDattr(vim.fn.diff_hlID(2, 15), "name") == insertion_group)
assert_highlight(insertion_group, "bg", "#385570")
assert_highlight("DiffChange", "bg", "#25323E")
vim.api.nvim_set_current_win(before_window)
assert(vim.fn.diff_filler(4) == 1)
assert_highlight("DiffDelete", "bg", colors.background_gutter)
vim.api.nvim_set_current_win(after_window)
vim.api.nvim_buf_set_lines(after, 1, 2, false, { "return amount" })
vim.cmd("diffupdate")
assert(vim.fn.synIDattr(vim.fn.diff_hlID(2, 8), "name") == "DiffText")
vim.cmd("diffoff!")

print("Theme checks passed")
