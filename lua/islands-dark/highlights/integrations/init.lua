local M = {}

--- @param c theme.Colors Color palette
--- @return theme.Highlights
function M.get(c)
	local blink_cmp = require("islands-dark.highlights.integrations.blink-cmp")
	local copilot = require("islands-dark.highlights.integrations.copilot")
	local fzf_lua = require("islands-dark.highlights.integrations.fzf-lua")
	local gitsigns = require("islands-dark.highlights.integrations.gitsigns")
	local nvim_tree = require("islands-dark.highlights.integrations.nvim-tree")

	return vim.tbl_extend(
		"force",
		{},
		blink_cmp.get(c),
		copilot.get(c),
		fzf_lua.get(c),
		gitsigns.get(c),
		nvim_tree.get(c)
	)
end

return M
