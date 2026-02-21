-- Main highlights loader for Islands Dark theme

local M = {}

--- Load and combine highlights from all modules
--- @param colors table Color palette
--- @param config table User configuration
--- @param util table Utility functions
--- @return table Combined highlight groups
function M.setup(colors, config, util)
	-- Load all highlight modules
	local editor = require("islands-dark.highlights.editor")
	local syntax = require("islands-dark.highlights.syntax")
	local treesitter = require("islands-dark.highlights.treesitter")
	local lsp = require("islands-dark.highlights.lsp")
	local diagnostics = require("islands-dark.highlights.diagnostics")
	local plugins = require("islands-dark.highlights.plugins")

	-- Combine all highlights
	local highlights = {}

	-- Apply each module's highlights
	local modules = {
		editor.setup(colors),
		syntax.setup(colors, config, util),
		treesitter.setup(colors, config, util),
		lsp.setup(colors, config, util),
		diagnostics.setup(colors),
		plugins.setup(colors),
	}

	for _, module_highlights in ipairs(modules) do
		for group, opts in pairs(module_highlights) do
			highlights[group] = opts
		end
	end

	-- Apply user overrides (supports both 'overrides' and 'on_highlights')
	if config.overrides and type(config.overrides) == "function" then
		local user_overrides = config.overrides(colors)
		for group, opts in pairs(user_overrides) do
			highlights[group] = opts
		end
	end

	-- Apply on_highlights (receives highlights table and can modify it directly)
	if config.on_highlights and type(config.on_highlights) == "function" then
		config.on_highlights(highlights, colors)
	end

	return highlights
end

return M
