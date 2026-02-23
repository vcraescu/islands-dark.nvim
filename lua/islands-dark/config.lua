-- Configuration management for Islands Dark theme

local M = {}

--- Default configuration
--- Users can override these settings by passing a table to the setup function
--- @class theme.Config
M.defaults = {
	-- Transparent background
	transparent = false,

	-- Set terminal colors
	terminal_colors = true,

	-- Style customization for different syntax groups
	styles = {
		comments = {},
		keywords = {},
		functions = {},
		variables = {},
		strings = {},
		constants = {},
	},

	-- Function that receives colors table and returns highlight overrides
	--- @param colors theme.Colors Base color palette
	overrides = function(colors)
		return {}
	end,

	-- Function that receives the final highlights table and can modify it directly
	--- @param highlights table Final highlights table that will be applied
	--- @param colors theme.Colors Base color palette
	on_highlights = function(highlights, colors)
		-- This function can be used to modify the highlights table directly
	end,
}

--- Current active configuration
M.config = vim.deepcopy(M.defaults)

--- Setup configuration
---@param user_config table|nil User configuration
function M.setup(user_config)
	M.config = vim.tbl_deep_extend("force", M.defaults, user_config or {})
end

--- Get current configuration
--- @return table Current configuration
function M.get()
	return M.config
end

--- Reset configuration to defaults
function M.reset()
	M.config = vim.deepcopy(M.defaults)
end

return M
