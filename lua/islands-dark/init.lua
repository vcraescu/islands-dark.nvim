-- Islands Dark colorscheme for Neovim
-- A faithful port of JetBrains IntelliJ IDEA Islands Dark theme

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
	local colors = require("islands-dark.palette.colors")
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
		vim.g.terminal_color_0 = colors.bg
		vim.g.terminal_color_1 = colors.error
		vim.g.terminal_color_2 = colors.string
		vim.g.terminal_color_3 = colors.metadata
		vim.g.terminal_color_4 = colors.func
		vim.g.terminal_color_5 = colors.constant
		vim.g.terminal_color_6 = colors.number
		vim.g.terminal_color_7 = colors.fg

		vim.g.terminal_color_8 = colors.fg_dimmer
		vim.g.terminal_color_9 = colors.error
		vim.g.terminal_color_10 = colors.string
		vim.g.terminal_color_11 = colors.warning
		vim.g.terminal_color_12 = colors.identifier
		vim.g.terminal_color_13 = colors.template_var
		vim.g.terminal_color_14 = colors.number
		vim.g.terminal_color_15 = colors.cursor
	end
end

--- Setup the colorscheme with custom configuration
---@param opts theme.Config|nil User configuration options
function M.setup(opts)
	opts = opts or {}
	local config = require("islands-dark.config")

	config.setup(opts)
end

return M
