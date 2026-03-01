local M = {}

--- Default configuration
--- Users can override these settings by passing a table to the setup function
--- @class theme.Config
local defaults = {
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

--- Setup configuration
---@param opts theme.Config|nil User configuration
function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", defaults, opts or {})
end

--- Get current configuration
--- @return theme.Config Current configuration
function M.get()
	if not M.config then
		M.config = vim.deepcopy(defaults)
	end
	return M.config
end

return M
