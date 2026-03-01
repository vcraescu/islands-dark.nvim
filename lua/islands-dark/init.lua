local M = {}

--- Load the colorscheme
function M.load()
	-- Reset highlights
	vim.cmd("highlight clear")

	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	-- Set colorscheme name and options
	vim.g.colors_name = "islands-dark"
	vim.o.background = "dark"
	vim.o.termguicolors = true

	local config = require("islands-dark.config")
	local colors = require("islands-dark.colors")
	local util = require("islands-dark.util")
	local highlights = require("islands-dark.highlights")

	-- Get configuration
	config = config.get()
	colors = util.apply_overrides(colors, config)

	-- Get all highlights
	local highlight_groups = highlights.setup(colors, config)

	-- Apply all highlights
	util.load_highlights(highlight_groups)

	-- Set terminal colors if enabled
	if config.terminal_colors then
		vim.g.terminal_color_0 = colors.terminal.black
		vim.g.terminal_color_1 = colors.terminal.red
		vim.g.terminal_color_2 = colors.terminal.green
		vim.g.terminal_color_3 = colors.terminal.yellow
		vim.g.terminal_color_4 = colors.terminal.blue
		vim.g.terminal_color_5 = colors.terminal.purple
		vim.g.terminal_color_6 = colors.terminal.cyan
		vim.g.terminal_color_7 = colors.terminal.white

		vim.g.terminal_color_8 = colors.terminal.bright_black
		vim.g.terminal_color_9 = colors.terminal.bright_red
		vim.g.terminal_color_10 = colors.terminal.bright_green
		vim.g.terminal_color_11 = colors.terminal.bright_yellow
		vim.g.terminal_color_12 = colors.terminal.bright_blue
		vim.g.terminal_color_13 = colors.terminal.bright_purple
		vim.g.terminal_color_14 = colors.terminal.bright_cyan
		vim.g.terminal_color_15 = colors.terminal.bright_white
	end
end

--- Setup the colorscheme with custom configuration
---@param opts theme.Config|nil User configuration options
function M.setup(opts)
	opts = opts or {}
	local config = require("islands-dark.config")

	config.setup(opts)
end

--- Get fzf color string for use with fzf-lua or fzf
--- @return string FZF color configuration string
function M.get_fzf_colors()
	local colors = require("islands-dark.colors")

	return table.concat({
		"fg:" .. colors.text,
		"bg:" .. colors.base,
		"hl:" .. colors.search_match,
		"fg+:" .. colors.text3,
		"bg+:" .. colors.visual,
		"hl+:" .. colors.search_match,
		"info:" .. colors.warning,
		"prompt:" .. colors.keyword,
		"pointer:" .. colors.constant,
		"marker:" .. colors.git_add,
		"spinner:" .. colors.number,
		"header:" .. colors.type,
		"border:" .. colors.border,
		"label:" .. colors.text,
		"query:" .. colors.text,
		"gutter:" .. colors.base,
		"selected-bg:" .. colors.base2,
	}, ",")
end

return M
