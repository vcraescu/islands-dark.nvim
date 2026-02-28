local M = {}

--- Setup Treesitter highlights
--- @param c theme.Colors Color palette
--- @return table Highlight groups for Treesitter syntax elements
function M.get(c, config)
	local util = require("islands-dark.util")
	local styles = util.get_styles(config)

	return {
		-- Comments
		["@comment"] = styles.comments({ link = "Comment" }),
		["@comment.documentation"] = styles.comments({ link = "Comment" }),
		["@comment.error"] = styles.comments({ link = "Error" }),
		["@comment.warning"] = styles.comments({ link = "Debug" }),
		["@comment.note"] = styles.comments({ fg = c.info }),
		["@comment.todo"] = styles.comments({ link = "Todo" }),

		-- Constants
		["@constant"] = styles.constants({ link = "Constant" }),
		["@constant.builtin"] = styles.constants({ link = "Constant" }),
		["@constant.macro"] = styles.constants({ link = "Constant" }),

		-- Strings
		["@string"] = styles.strings({ link = "String" }),
		["@string.documentation"] = styles.strings({ link = "SpecialComment" }),
		["@string.escape"] = styles.strings({ fg = c.escape }),
		["@string.regexp"] = styles.strings({ fg = c.regex }),
		["@string.special"] = styles.strings({ link = "SpecialChar" }),
		["@string.special.symbol"] = styles.strings({ link = "Constant" }),
		["@string.special.url"] = styles.strings({ link = "Underlined" }),

		-- Characters
		["@character"] = { link = "Character" },
		["@character.special"] = { link = "SpecialChar" },

		-- Numbers
		["@number"] = { link = "Number" },
		["@number.float"] = { link = "Number" },

		-- Booleans
		["@boolean"] = { link = "Boolean" },

		-- Functions
		["@function"] = styles.functions({ link = "Function" }),
		["@function.builtin"] = styles.functions({ fg = c.func_builtin }),
		["@function.call"] = styles.functions({ fg = c.func_call }),
		["@function.macro"] = styles.functions({ fg = c.metadata }),
		["@function.method"] = styles.functions({ link = "Function" }),
		["@function.method.call"] = styles.functions({ link = "@function.call" }),

		-- Constructors
		["@constructor"] = { link = "@function.method" },

		-- Parameters
		["@parameter"] = { link = "Identifier" },
		["@parameter.builtin"] = { link = "Identifier" },

		-- Keywords
		["@keyword"] = styles.keywords({ link = "Keyword" }),
		["@keyword.conditional.ternary"] = styles.keywords({ link = "Operator" }),
		["@keyword.exception"] = styles.keywords({ link = "Exception" }),

		-- Operators
		["@operator"] = { link = "Operator" },

		-- Punctuation
		["@punctuation"] = { link = "Delimiter" },

		-- Types
		["@type"] = { link = "Type" },
		["@type.builtin"] = { fg = c.type_builtin },
		["@type.definition"] = { link = "Typedef" },
		["@type.qualifier"] = { link = "Keyword" },

		-- Attributes
		["@attribute"] = { fg = c.metadata },

		-- Properties
		["@property"] = { fg = c.property },

		-- Variables
		["@variable"] = styles.variables({ link = "Identifier" }),
		["@variable.builtin"] = styles.variables({ link = "Keyword" }),
		["@variable.member"] = styles.variables({ link = "@property" }),
		["@variable.parameter"] = styles.variables({ link = "@parameter" }),

		-- Modules
		["@module"] = { fg = c.text },
		["@module.builtin"] = { fg = c.text },

		-- Labels
		["@label"] = { link = "Label" },

		-- Tags (HTML/XML)
		["@tag"] = { link = "Tag" },
		["@tag.attribute"] = { fg = c.attribute },
		["@tag.delimiter"] = { link = "Tag" },
		["@markup.heading.html"] = {},
		["@markup.heading.1.html"] = {},
		["@markup.heading.2.html"] = {},
		["@markup.heading.3.html"] = {},
		["@markup.heading.4.html"] = {},
		["@markup.heading.5.html"] = {},
		["@markup.heading.6.html"] = {},
		["@constant.html"] = { link = "Tag" },
		["@constant.builtin.xml"] = { link = "Special" },

		-- Markup (Markdown, etc.)
		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },
		["@markup.heading"] = { link = "Constant" },
		["@markup.quote"] = { link = "Keyword" },
		["@markup.quote.markdown"] = { link = "String" },
		["@markup.math"] = { link = "Number" },
		["@markup.link"] = { link = "@string.special.url" },
		["@markup.link.label"] = { link = "@markup.link" },
		["@markup.link.url"] = { link = "@markup.link" },
		["@markup.raw"] = { link = "String" },
		["@label.markdown"] = { link = "Constant" },
		["@markup.list"] = { link = "Keyword" },
		["@markup.list.checked"] = { fg = c.text },
		["@markup.list.unchecked"] = { fg = c.text },
		["@conceal.markdown_inline"] = { link = "Label" },
		["@punctuation.special.markdown"] = { link = "Label" },

		-- Diff
		["@diff.plus"] = { link = "DiffAdd" },
		["@diff.minus"] = { link = "DiffDelete" },
		["@diff.delta"] = { link = "DiffChange" },

		-- Special
		["@none"] = {},

		-- Language-specific

		-- Bash
		["@function.builtin.bash"] = { link = "Keyword" },

		-- Go
		["@type.builtin.go"] = { link = "Keyword" },
		["@constant.builtin.go"] = { link = "Keyword" },
		["@module.go"] = { fg = c.metadata },
		["@namespace.go"] = { fg = c.metadata },
		["@string.special.url.gomod"] = { link = "String" },
		["@string.special.url.gosum"] = { link = "String" },

		-- TypeScript/JavaScript
		["@constructor.typescript"] = { link = "Keyword" },
		["@constructor.javascript"] = { link = "Keyword" },
		["@constructor.tsx"] = { link = "@constructor.typescript" },
		["@constructor.typescriptreact"] = { link = "@constructor.typescript" },

		["@type.parameter.typescript"] = { fg = c.type_parameter },
		["@type.parameter.javascript"] = { fg = c.type_parameter },
		["@type.parameter.tsx"] = { fg = c.type_parameter },
		["@type.parameter.typescriptreact"] = { fg = c.type_parameter },

		["@constant.typescript"] = { link = "Identifier" },
		["@constant.javascript"] = { link = "@constant.typescript" },
		["@constant.typescriptreact"] = { link = "@constant.typescript" },

		["@function.method.call.typescript"] = { link = "Function" },
		["@function.method.call.javascript"] = { link = "Function" },
		["@function.method.call.tsx"] = { link = "Function" },
		["@function.method.call.typescriptreact"] = { link = "Function" },

		["@tag.builtin.tsx"] = { link = "Tag" },
		["@tag.delimiter.tsx"] = { link = "Tag" },

		["@type.typescript"] = { link = "Identifier" },
		["@type.javascript"] = { link = "@type.typescript" },
		["@type.tsx"] = { link = "@type.typescript" },
		["@type.typescriptreact"] = { link = "@type.typescript" },

		["@function.call.typescript"] = { link = "Function" },
		["@function.call.javascript"] = { link = "@function.call.typescript" },
		["@function.call.tsx"] = { link = "@function.call.typescript" },
		["@function.call.typescriptreact"] = { link = "@function.call.typescript" },

		["@variable.builtin.typescript"] = { link = "Constant" },
		["@variable.builtin.javascript"] = { link = "@variable.builtin.typescript" },
		["@variable.builtin.tsx"] = { link = "@variable.builtin.typescript" },
		["@variable.builtin.typescriptreact"] = { link = "@variable.builtin.typescript" },

		-- Lua
		["@constructor.lua"] = { fg = c.braces },

		-- Yaml
		["@property.yaml"] = { link = "Keyword" },
		["@type.yaml"] = { link = "Tag" },

		-- CSS
		["@tag.css"] = { link = "Tag" },
		["@constant.css"] = { link = "Tag" },
		["@punctuation.delimiter.css"] = { link = "@tag.css" },

		-- Proto
		["@type.proto"] = { link = "Identifier" },
		["@variable.member.proto"] = { link = "Identifier" },

		-- Python
		["@constructor.python"] = { link = "Keyword" },
		["@variable.member.python"] = { link = "Identifier" },

		-- XML
		["@keyword.directive.define.xml"] = { link = "Tag" },
		["@keyword.directive.xml"] = { link = "Tag" },
		["@number.xml"] = { link = "String" },
		["@string.special.xml"] = { link = "String" },

		-- Terraform
		["@constant.terraform"] = { link = "Keyword" },
		["@type.terraform"] = { link = "Keyword" },

		-- PHP
		["@function.method.call.php"] = { link = "Function" },
		["@function.call.php"] = { link = "Function" },
		["@type.php"] = { link = "Identifier" },
		["@constructor.php"] = { link = "Identifier" },
		["@type.phpdoc"] = { link = "Identifier" },
	}
end

return M
