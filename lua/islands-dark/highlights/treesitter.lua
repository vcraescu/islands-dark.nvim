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
		["@comment.documentation"] = styles.comments({ link = "SpecialComment" }),
		["@comment.error"] = styles.comments({ fg = c.fg, bg = c.error }),
		["@comment.warning"] = styles.comments({ link = "Debug" }),
		["@comment.note"] = styles.comments({ fg = c.info }),
		["@comment.todo"] = styles.comments({ fg = c.fg, bg = c.todo }),

		-- Constants
		["@constant"] = styles.constants({ link = "Constant" }),
		["@constant.builtin"] = styles.constants({ link = "Keyword" }),
		["@constant.macro"] = styles.constants({ link = "Macro" }),

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
		["@number.float"] = { link = "@number" },

		-- Booleans
		["@boolean"] = { link = "Boolean" },

		-- Functions
		["@function"] = styles.functions({ link = "Function" }),
		["@function.builtin"] = styles.functions({ link = "Function" }),
		["@function.call"] = styles.functions({ link = "Function" }),
		["@function.macro"] = styles.functions({ fg = c.metadata }),
		["@function.method"] = styles.functions({ fg = c.method }),
		["@function.method.call"] = styles.functions({ link = "@function.method" }),

		-- Constructors
		["@constructor"] = { link = "@function.method" },

		-- Parameters
		["@parameter"] = { link = "Identifier" },
		["@parameter.builtin"] = { link = "Identifier" },

		-- Keywords
		["@keyword"] = styles.keywords({ link = "Keyword" }),
		["@keyword.conditional"] = styles.keywords({ link = "@keyword" }),
		["@keyword.conditional.ternary"] = styles.keywords({ link = "Operator" }),
		["@keyword.coroutine"] = styles.keywords({ link = "@keyword" }),
		["@keyword.debug"] = styles.keywords({ link = "@keyword" }),
		["@keyword.directive"] = styles.keywords({ link = "@keyword" }),
		["@keyword.directive.define"] = styles.keywords({ link = "@keyword" }),
		["@keyword.exception"] = styles.keywords({ link = "Exception" }),
		["@keyword.function"] = styles.keywords({ link = "@keyword" }),
		["@keyword.import"] = styles.keywords({ link = "@keyword" }),
		["@keyword.operator"] = styles.keywords({ link = "@keyword" }),
		["@keyword.repeat"] = styles.keywords({ link = "@keyword" }),
		["@keyword.return"] = styles.keywords({ link = "@keyword" }),
		["@keyword.storage"] = styles.keywords({ link = "@keyword" }),

		-- Operators
		["@operator"] = { link = "Operator" },

		-- Punctuation
		["@punctuation.delimiter"] = { link = "Delimiter" },
		["@punctuation.bracket"] = { link = "Delimiter" },
		["@punctuation.special"] = { link = "Delimiter" },

		-- Types
		["@type"] = { fg = c.type },
		["@type.builtin"] = { fg = c.type_builtin },
		["@type.definition"] = { link = "Typedef" },
		["@type.qualifier"] = { link = "@keyword" },

		-- Attributes
		["@attribute"] = { fg = c.metadata },
		["@attribute.builtin"] = { fg = c.metadata },

		-- Properties
		["@property"] = { fg = c.property },

		-- Variables
		["@variable"] = styles.variables({ link = "Identifier" }),
		["@variable.builtin"] = styles.variables({ link = "@keyword" }),
		["@variable.member"] = styles.variables({ link = "@property" }),
		["@variable.parameter"] = styles.variables({ link = "@parameter" }),

		-- Modules
		["@module"] = { fg = c.fg },
		["@module.builtin"] = { fg = c.fg },

		-- Labels
		["@label"] = { link = "Label" },

		-- Tags (HTML/XML)
		["@tag"] = { link = "Tag" },
		["@tag.attribute"] = { fg = c.attribute },
		["@tag.delimiter"] = { link = "@tag" },
		["@markup.heading.html"] = {},
		["@markup.heading.1.html"] = {},
		["@markup.heading.2.html"] = {},
		["@markup.heading.3.html"] = {},
		["@markup.heading.4.html"] = {},
		["@markup.heading.5.html"] = {},
		["@markup.heading.6.html"] = {},
		["@constant.html"] = { link = "@tag" },
		["@constant.builtin.xml"] = { link = "Special" },

		-- Markup (Markdown, etc.)
		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },
		["@markup.heading"] = { link = "@constant" },
		["@markup.quote"] = { fg = c.keyword },
		["@markup.quote.markdown"] = { fg = c.string },
		["@markup.math"] = { link = "@number" },
		["@markup.link"] = { link = "@string.special.url" },
		["@markup.link.label"] = { link = "@markup.link" },
		["@markup.link.url"] = { link = "@markup.link" },
		["@markup.raw"] = { link = "@string" },
		["@label.markdown"] = { link = "@constant" },
		["@markup.list"] = { link = "@keyword" },
		["@markup.list.checked"] = { fg = c.fg },
		["@markup.list.unchecked"] = { fg = c.fg },
		["@conceal.markdown_inline"] = { link = "@label" },
		["@punctuation.special.markdown"] = { link = "@label" },

		-- Diff
		["@diff.plus"] = { fg = c.vcs_added },
		["@diff.minus"] = { fg = c.vcs_removed },
		["@diff.delta"] = { fg = c.vcs_modified },

		-- Special
		["@none"] = {},

		-- Language-specific

		-- Bash
		["@function.builtin.bash"] = { link = "@keyword" },

		-- Go
		["@type.builtin.go"] = { link = "@keyword" },
		["@constant.builtin.go"] = { link = "@keyword" },
		["@module.go"] = { fg = c.metadata },
		["@namespace.go"] = { fg = c.metadata },
		["@string.special.url.gomod"] = { link = "@string" },
		["@string.special.url.gosum"] = { link = "@string" },

		-- TypeScript/JavaScript
		["@constructor.typescript"] = { link = "@keyword" },
		["@constructor.javascript"] = { link = "@keyword" },
		["@constructor.tsx"] = { link = "@constructor.typescript" },
		["@type.parameter.typescript"] = { fg = c.type_parameter },
		["@type.parameter.javascript"] = { fg = c.type_parameter },
		["@type.parameter.tsx"] = { fg = c.type_parameter },
		["@constant.typescript"] = { link = "@variable" },
		["@constant.javascript"] = { link = "@variable" },

		-- Lua
		["@constructor.lua"] = { fg = c.braces },

		-- Yaml
		["@property.yaml"] = { link = "@keyword" },
		["@type.yaml"] = { link = "@tag" },

		-- CSS
		["@tag.css"] = { link = "@tag" },
		["@constant.css"] = { link = "@tag" },
		["@punctuation.delimiter.css"] = { link = "@tag.css" },

		-- Proto
		["@property.proto"] = { link = "@identifier" },
		["@type.proto"] = { link = "@identifier" },
		["@variable.member.proto"] = { link = "@property.proto" },

		-- Python
		["@constructor.python"] = { link = "@keyword" },
		["@variable.member.python"] = { link = "@indentifier" },

		-- XML
		["@keyword.directive.define.xml"] = { link = "@tag" },
		["@keyword.directive.xml"] = { link = "@tag" },
		["@number.xml"] = { link = "@string" },
		["@string.special.xml"] = { link = "@string" },

		-- Terraform
		["@constant.terraform"] = { link = "@keyword" },
	}
end

return M
