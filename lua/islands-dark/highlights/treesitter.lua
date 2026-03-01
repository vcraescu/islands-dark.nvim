local M = {}

--- Get Treesitter highlights
--- @param c theme.Colors Color palette
--- @return theme.Highlights
function M.get(c, config)
	local util = require("islands-dark.util")
	local styles = util.get_styles(config)

	local base = {
		["@annotation"] = { link = "PreProc" },
		["@attribute"] = { link = "PreProc" },
		["@boolean"] = { link = "Boolean" },
		["@character"] = { link = "Character" },
		["@character.special"] = { link = "SpecialChar" },
		["@comment"] = styles.comments({ link = "Comment" }),
		["@comment.error"] = styles.comments({ link = "Error" }),
		["@comment.hint"] = styles.comments({ fg = c.hint }),
		["@comment.info"] = styles.comments({ fg = c.info }),
		["@comment.note"] = styles.comments({ fg = c.hint }),
		["@comment.todo"] = styles.comments({ link = "Todo" }),
		["@comment.warning"] = styles.comments({ link = "Debug" }),
		["@conceal.markdown_inline"] = { link = "Label" },
		["@constant"] = { link = "Constant" },
		["@constructor"] = { link = "Function" },
		["@diff.delta"] = { link = "DiffChange" },
		["@diff.minus"] = { link = "DiffDelete" },
		["@diff.plus"] = { link = "DiffAdd" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = styles.functions({ fg = c.func_builtin }),
		["@function.call"] = styles.functions({ fg = c.func_call }),
		["@function.macro"] = { link = "Macro" },
		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "@function.call" },
		["@keyword"] = { link = "Keyword" },
		["@keyword.conditional.ternary"] = { link = "Operator" },
		["@keyword.exception"] = { link = "Exception" },
		["@label"] = { link = "Label" },
		["@label.markdown"] = { fg = c.constant },
		["@markup.heading"] = { fg = c.constant },
		["@markup.heading.1.html"] = {},
		["@markup.heading.2.html"] = {},
		["@markup.heading.3.html"] = {},
		["@markup.heading.4.html"] = {},
		["@markup.heading.5.html"] = {},
		["@markup.heading.6.html"] = {},
		["@markup.heading.html"] = {},
		["@markup.italic"] = { italic = true },
		["@markup.link"] = { link = "Underline" },
		["@markup.link.label"] = { link = "@markup.link" },
		["@markup.link.url"] = { link = "@markup.link" },
		["@markup.list"] = { fg = c.keyword },
		["@markup.list.checked"] = { fg = c.text },
		["@markup.list.unchecked"] = { fg = c.text },
		["@markup.math"] = { link = "Number" },
		["@markup.quote"] = { link = "Keyword" },
		["@markup.quote.markdown"] = { fg = c.string },
		["@markup.raw"] = { fg = c.string },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.strong"] = { bold = true },
		["@markup.underline"] = { underline = true },
		["@module"] = { link = "Include" },
		["@module.builtin"] = { fg = c.keyword },
		["@none"] = {},
		["@number"] = { link = "Number" },
		["@operator"] = { link = "Operator" },
		["@parameter"] = { link = "Identifier" },
		["@parameter.builtin"] = { link = "Identifier" },
		["@property"] = { fg = c.property },
		["@punctuation"] = { link = "Delimiter" },
		["@punctuation.special.markdown"] = { link = "Label" },
		["@string"] = { link = "String" },
		["@string.documentation"] = { link = "SpecialComment" },
		["@string.escape"] = { fg = c.escape },
		["@string.regexp"] = { fg = c.regex },
		["@string.special"] = { link = "SpecialChar" },
		["@string.special.symbol"] = { link = "Constant" },
		["@string.special.url"] = { link = "Underlined" },
		["@tag"] = { link = "Tag" },
		["@tag.attribute"] = { fg = c.attribute },
		["@tag.delimiter"] = { link = "Tag" },
		["@type"] = { link = "Type" },
		["@type.builtin"] = { fg = c.type_builtin },
		["@type.definition"] = { link = "Typedef" },
		["@type.qualifier"] = { link = "Keyword" },
		["@variable"] = { link = "Identifier" },
		["@variable.builtin"] = { link = "Keyword" },
		["@variable.member"] = { link = "@property" },
		["@variable.parameter"] = { link = "@parameter" },
	}

	return vim.tbl_deep_extend("force", base, M.get_langs(c))
end

--- Get language-specific Treesitter highlights
--- @param c theme.Colors Color palette
--- @return theme.Highlights
function M.get_langs(c)
	return {
		-- Bash
		["@function.builtin.bash"] = { link = "Keyword" },

		-- Go
		["@constant.builtin.go"] = { link = "Keyword" },
		["@module.go"] = { fg = c.metadata },
		["@namespace.go"] = { fg = c.metadata },
		["@string.special.url.gomod"] = { link = "String" },
		["@string.special.url.gosum"] = { link = "String" },
		["@type.builtin.go"] = { link = "Keyword" },

		-- TypeScript/JavaScript
		["@constant.javascript"] = { link = "@constant.typescript" },
		["@constant.typescript"] = { link = "Identifier" },
		["@constant.typescriptreact"] = { link = "@constant.typescript" },
		["@constructor.javascript"] = { link = "Keyword" },
		["@constructor.tsx"] = { link = "@constructor.typescript" },
		["@constructor.typescript"] = { link = "Keyword" },
		["@constructor.typescriptreact"] = { link = "@constructor.typescript" },
		["@function.call.javascript"] = { link = "@function.call.typescript" },
		["@function.call.tsx"] = { link = "@function.call.typescript" },
		["@function.call.typescript"] = { link = "Function" },
		["@function.call.typescriptreact"] = { link = "@function.call.typescript" },
		["@function.method.call.javascript"] = { link = "Function" },
		["@function.method.call.tsx"] = { link = "Function" },
		["@function.method.call.typescript"] = { link = "Function" },
		["@function.method.call.typescriptreact"] = { link = "Function" },
		["@tag.builtin.tsx"] = { link = "Tag" },
		["@tag.delimiter.tsx"] = { link = "Tag" },
		["@type.javascript"] = { link = "@type.typescript" },
		["@type.parameter.javascript"] = { fg = c.type_parameter },
		["@type.parameter.tsx"] = { fg = c.type_parameter },
		["@type.parameter.typescript"] = { fg = c.type_parameter },
		["@type.parameter.typescriptreact"] = { fg = c.type_parameter },
		["@type.tsx"] = { link = "@type.typescript" },
		["@type.typescript"] = { link = "Identifier" },
		["@type.typescriptreact"] = { link = "@type.typescript" },
		["@variable.builtin.javascript"] = { link = "@variable.builtin.typescript" },
		["@variable.builtin.tsx"] = { link = "@variable.builtin.typescript" },
		["@variable.builtin.typescript"] = { link = "Constant" },
		["@variable.builtin.typescriptreact"] = { link = "@variable.builtin.typescript" },

		-- Lua
		["@constructor.lua"] = { fg = c.braces },

		-- Yaml
		["@property.yaml"] = { link = "Keyword" },
		["@type.yaml"] = { link = "Tag" },

		-- CSS
		["@constant.css"] = { link = "Tag" },
		["@punctuation.delimiter.css"] = { link = "@tag.css" },
		["@tag.css"] = { link = "Tag" },

		-- Proto
		["@type.proto"] = { link = "Identifier" },
		["@variable.member.proto"] = { link = "Identifier" },

		-- Python
		["@constructor.python"] = { link = "Keyword" },
		["@variable.member.python"] = { link = "Identifier" },

		-- XML
		["@constant.builtin.xml"] = { link = "Special" },
		["@keyword.directive.define.xml"] = { link = "Tag" },
		["@keyword.directive.xml"] = { link = "Tag" },
		["@number.xml"] = { link = "String" },
		["@string.special.xml"] = { link = "String" },

		-- HTML
		["@constant.html"] = { link = "Tag" },

		-- Terraform
		["@constant.terraform"] = { link = "Keyword" },
		["@type.terraform"] = { link = "Keyword" },

		-- PHP
		["@constructor.php"] = { link = "Identifier" },
		["@function.call.php"] = { link = "Function" },
		["@function.method.call.php"] = { link = "Function" },
		["@type.php"] = { link = "Identifier" },
		["@type.phpdoc"] = { link = "Identifier" },
	}
end

return M
