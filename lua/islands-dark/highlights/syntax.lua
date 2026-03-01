local M = {}

--- @param c theme.Colors Color palette
--- @param config theme.Config User configuration
--- @return theme.Highlights
function M.get(c, config)
	local util = require("islands-dark.util")
	local styles = util.get_styles(config)

	return {
		-- Comments
		Comment = styles.comments({ fg = c.comment }),

		-- Constants
		Constant = { fg = c.constant },
		String = { fg = c.string },
		Character = { fg = c.string },
		Number = { fg = c.number },
		Boolean = { link = "Keyword" },
		Float = { fg = c.number },

		-- Identifiers
		Identifier = styles.variables({ fg = c.variable }),
		Function = styles.functions({ fg = c.func }),

		-- Statements
		Statement = { link = "Keyword" },
		Conditional = { link = "Keyword" },
		Repeat = { link = "Keyword" },
		Label = { fg = c.label },
		Operator = { fg = c.operator },
		Keyword = styles.keywords({ fg = c.keyword }),
		Exception = { link = "Keyword" },

		-- PreProc
		PreProc = { fg = c.metadata },
		Include = { link = "Keyword" },
		Define = { link = "Keyword" },
		Macro = styles.functions({ fg = c.metadata }),
		PreCondit = { link = "Keyword" },

		-- Types
		Type = { fg = c.type },
		StorageClass = { link = "Keyword" },
		Structure = { link = "Keyword" },
		Typedef = { fg = c.type_definition },

		-- Special
		Special = { fg = c.special },
		SpecialChar = { link = "Special" },
		Tag = { fg = c.tag },
		Delimiter = { fg = c.punctuation },
		SpecialComment = { fg = c.comment_doc },
		Debug = { fg = c.warning },

		-- Other
		Underlined = { fg = c.link, underline = true },
		Ignore = { fg = c.text2 },
		Error = { fg = c.error },
		Todo = { fg = c.todo, bold = true },
	}
end

return M
