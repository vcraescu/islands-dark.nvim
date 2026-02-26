local M = {}

-- Load integrations highlights
--- @param c theme.Colors Color palette
--- @return table Highlight groups for plugin integrations
function M.get(c)
	local blink_cmp = require("islands-dark.highlights.integrations.blink-cmp")
	local fzf_lua = require("islands-dark.highlights.integrations.fzf-lua")
	local gitsigns = require("islands-dark.highlights.integrations.gitsigns")
	local nvim_tree = require("islands-dark.highlights.integrations.nvim-tree")

	local highlights =
		vim.tbl_deep_extend("force", {}, blink_cmp.get(c), fzf_lua.get(c), gitsigns.get(c), nvim_tree.get(c))

	return highlights
end

return M
