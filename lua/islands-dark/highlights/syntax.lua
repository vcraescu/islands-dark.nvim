local M = {}

--- Get syntax highlight groups
--- @param c theme.Colors Color palette
--- @param config theme.Config User configuration
--- @return theme.Highlights
function M.get(c, config)
	local util = require("islands-dark.util")
	local styles = util.get_styles(config)

	return {
		Boolean = { link = "Keyword" },
		Character = { fg = c.string },
		Comment = styles.comments({ fg = c.comment }),
		Conditional = { link = "Keyword" },
		Constant = { fg = c.constant },
		Debug = { fg = c.warning },
		Define = { link = "Keyword" },
		Delimiter = { fg = c.punctuation },
		Error = { fg = c.error },
		Exception = { link = "Keyword" },
		Float = { fg = c.number },
		Function = styles.functions({ fg = c.func }),
		Identifier = styles.variables({ fg = c.variable }),
		Ignore = { fg = c.text2 },
		Include = { fg = c.label },
		Keyword = styles.keywords({ fg = c.keyword }),
		Label = { fg = c.label },
		Macro = styles.functions({ fg = c.metadata }),
		Number = { fg = c.number },
		Operator = { fg = c.operator },
		PreCondit = { link = "Keyword" },
		PreProc = { fg = c.metadata },
		Repeat = { link = "Keyword" },
		Special = { fg = c.special },
		SpecialChar = { link = "Special" },
		SpecialComment = { fg = c.comment_doc },
		Statement = { link = "Keyword" },
		StorageClass = { link = "Keyword" },
		String = { fg = c.string },
		Structure = { link = "Keyword" },
		Tag = { fg = c.tag },
		Todo = { fg = c.todo, bold = true },
		Type = { fg = c.type },
		Typedef = { fg = c.type_definition },
		Underlined = { fg = c.link, underline = true },
	}
end

return M
