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
	--- @type theme.Styles
	styles = {
		comments = {},
		keywords = {},
		functions = {},
		variables = {},
	},

	-- Function that receives colors table and returns highlight overrides
	--- @type fun(colors: theme.Colors): theme.Highlights
	overrides = function()
		return {}
	end,

	-- Function that receives the final highlights table and can modify it directly
	--- @type fun(highlights: theme.Highlights, colors: theme.Colors)
	on_highlights = function() end,
}

--- Setup configuration
---@param opts? theme.Opts User configuration
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
