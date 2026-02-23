-- Treesitter highlights for Islands Dark theme

local M = {}

--- Setup Treesitter highlights
--- @param c table Color palette
--- @return table Highlight groups for Treesitter syntax elements
function M.setup(c, config)
	local highlights = {}
	local util = require("islands-dark.util")
	local constant_style = util.get_style(config, "constants")
	local comment_style = util.get_style(config, "comments")
	local variable_style = util.get_style(config, "variables")
	local function_style = util.get_style(config, "functions")
	local string_style = util.get_style(config, "strings")
	local keyword_style = util.get_style(config, "keywords")

	-- Comments
	highlights["@comment"] = { link = "Comment" }
	highlights["@comment.documentation"] = comment_style({ link = "SpecialComment" })
	highlights["@comment.error"] = comment_style({ fg = c.fg, bg = c.error })
	highlights["@comment.warning"] = comment_style({ link = "Debug" })
	highlights["@comment.note"] = comment_style({ fg = c.info })
	highlights["@comment.todo"] = comment_style({ fg = c.fg, bg = c.todo })

	-- Constants
	highlights["@constant"] = { link = "Constant" }
	highlights["@constant.builtin"] = constant_style({ link = "Keyword" })
	highlights["@constant.macro"] = constant_style({ link = "Macro" })

	-- Strings
	highlights["@string"] = string_style({ link = "String" })
	highlights["@string.documentation"] = string_style({ link = "SpecialComment" })
	highlights["@string.escape"] = string_style({ fg = c.escape })
	highlights["@string.regexp"] = string_style({ fg = c.regex })
	highlights["@string.special"] = string_style({ link = "SpecialChar" })
	highlights["@string.special.symbol"] = string_style({ link = "Constant" })
	highlights["@string.special.url"] = string_style({ link = "Underlined" })

	-- Characters
	highlights["@character"] = { link = "Character" }
	highlights["@character.special"] = { link = "SpecialChar" }

	-- Numbers
	highlights["@number"] = { link = "Number" }
	highlights["@number.float"] = { link = "@number" }

	-- Booleans
	highlights["@boolean"] = { link = "Boolean" }

	-- Functions
	highlights["@function"] = function_style({ link = "Function" })
	highlights["@function.builtin"] = function_style({ link = "Function" })
	highlights["@function.call"] = function_style({ link = "Function" })
	highlights["@function.macro"] = function_style({ fg = c.metadata })
	highlights["@function.method"] = function_style({ fg = c.method })
	highlights["@function.method.call"] = function_style({ link = "@function.method" })

	-- Constructors
	highlights["@constructor"] = { link = "@function.method" }

	-- Parameters
	highlights["@parameter"] = { link = "Identifier" }
	highlights["@parameter.builtin"] = { link = "Identifier" }

	-- Keywords
	highlights["@keyword"] = keyword_style({ link = "Keyword" })
	highlights["@keyword.conditional"] = keyword_style({ link = "@keyword" })
	highlights["@keyword.conditional.ternary"] = keyword_style({ link = "Operator" })
	highlights["@keyword.coroutine"] = keyword_style({ link = "@keyword" })
	highlights["@keyword.debug"] = keyword_style({ link = "@keyword" })
	highlights["@keyword.directive"] = keyword_style({ link = "@keyword" })
	highlights["@keyword.directive.define"] = keyword_style({ link = "@keyword" })
	highlights["@keyword.exception"] = keyword_style({ link = "Exception" })
	highlights["@keyword.function"] = keyword_style({ link = "@keyword" })
	highlights["@keyword.import"] = keyword_style({ link = "@keyword" })
	highlights["@keyword.operator"] = keyword_style({ link = "@keyword" })
	highlights["@keyword.repeat"] = keyword_style({ link = "@keyword" })
	highlights["@keyword.return"] = keyword_style({ link = "@keyword" })
	highlights["@keyword.storage"] = keyword_style({ link = "@keyword" })

	-- Operators
	highlights["@operator"] = { link = "Operator" }

	-- Punctuation
	highlights["@punctuation.delimiter"] = { link = "Delimiter" }
	highlights["@punctuation.bracket"] = { link = "Delimiter" }
	highlights["@punctuation.special"] = { link = "Delimiter" }

	-- Types
	highlights["@type"] = { fg = c.type }
	highlights["@type.builtin"] = { fg = c.type_builtin }
	highlights["@type.definition"] = { link = "Typedef" }
	highlights["@type.qualifier"] = { link = "@keyword" }

	-- Attributes
	highlights["@attribute"] = { fg = c.metadata }
	highlights["@attribute.builtin"] = { fg = c.metadata }

	-- Properties
	highlights["@property"] = { fg = c.property }

	-- Variables
	highlights["@variable"] = variable_style({ link = "Identifier" })
	highlights["@variable.builtin"] = variable_style({ link = "@keyword" })
	highlights["@variable.member"] = variable_style({ fg = c.field })
	highlights["@variable.parameter"] = variable_style({ link = "@parameter" })

	-- Modules
	highlights["@module"] = { fg = c.fg }
	highlights["@module.builtin"] = { fg = c.fg }

	-- Labels
	highlights["@label"] = { link = "Label" }

	-- Tags (HTML/XML)
	highlights["@tag"] = { link = "Tag" }
	highlights["@tag.attribute"] = { fg = c.attribute }
	highlights["@tag.delimiter"] = { link = "@tag" }
	highlights["@markup.heading.html"] = {}
	highlights["@markup.heading.1.html"] = {}
	highlights["@markup.heading.2.html"] = {}
	highlights["@markup.heading.3.html"] = {}
	highlights["@markup.heading.4.html"] = {}
	highlights["@markup.heading.5.html"] = {}
	highlights["@markup.heading.6.html"] = {}
	highlights["@constant.html"] = { link = "@tag" }
	highlights["@constant.builtin.xml"] = { link = "Special" }

	-- Markup (Markdown, etc.)
	highlights["@markup.strong"] = { bold = true }
	highlights["@markup.italic"] = { italic = true }
	highlights["@markup.strikethrough"] = { strikethrough = true }
	highlights["@markup.underline"] = { underline = true }
	highlights["@markup.heading"] = { link = "@constant" }
	highlights["@markup.quote"] = { fg = c.keyword }
	highlights["@markup.quote.markdown"] = { fg = c.string }
	highlights["@markup.math"] = { link = "@number" }
	highlights["@markup.link"] = { link = "@string.special.url" }
	highlights["@markup.link.label"] = { link = "@markup.link" }
	highlights["@markup.link.url"] = { link = "@markup.link" }
	highlights["@markup.raw"] = { link = "@string" }
	highlights["@markup.raw.block"] = { fg = c.string, bg = c.injected_lang_bg }
	highlights["@label.markdown"] = { link = "@constant" }
	highlights["@markup.list"] = { link = "@keyword" }
	highlights["@markup.list.checked"] = { fg = c.fg }
	highlights["@markup.list.unchecked"] = { fg = c.fg }
	highlights["@conceal.markdown_inline"] = { link = "@label" }
	highlights["@punctuation.special.markdown"] = { link = "@label" }

	-- Diff
	highlights["@diff.plus"] = { fg = c.vcs_added }
	highlights["@diff.minus"] = { fg = c.vcs_removed }
	highlights["@diff.delta"] = { fg = c.vcs_modified }

	-- Special
	highlights["@none"] = {}

	-- Language-specific

	-- Bash
	highlights["@function.builtin.bash"] = { link = "@keyword" }

	-- Go
	highlights["@type.builtin.go"] = { link = "@keyword" }
	highlights["@constant.builtin.go"] = { link = "@keyword" }
	highlights["@module.go"] = { fg = c.metadata }
	highlights["@namespace.go"] = { fg = c.metadata }
	highlights["@string.special.url.gomod"] = { link = "@string" }
	highlights["@string.special.url.gosum"] = { link = "@string" }

	-- TypeScript/JavaScript
	highlights["@constructor.typescript"] = { link = "@keyword" }
	highlights["@constructor.javascript"] = { link = "@keyword" }
	highlights["@constructor.tsx"] = { link = "@constructor.typescript" }
	highlights["@type.parameter.typescript"] = { fg = c.type_parameter }
	highlights["@type.parameter.javascript"] = { fg = c.type_parameter }
	highlights["@type.parameter.tsx"] = { fg = c.type_parameter }
	highlights["@constant.typescript"] = { link = "@variable" }
	highlights["@constant.javascript"] = { link = "@variable" }

	-- Lua
	highlights["@constructor.lua"] = { fg = c.braces }

	-- Yaml
	highlights["@property.yaml"] = { link = "@keyword" }
	highlights["@type.yaml"] = { link = "@tag" }

	-- CSS
	highlights["@tag.css"] = { link = "@tag" }
	highlights["@constant.css"] = { link = "@tag" }
	highlights["@punctuation.delimiter.css"] = { link = "@tag.css" }

	-- Proto
	highlights["@property.proto"] = { link = "@identifier" }
	highlights["@type.proto"] = { link = "@identifier" }
	highlights["@variable.member.proto"] = { link = "@property.proto" }

	-- Python
	highlights["@constructor.python"] = { link = "@keyword" }
	highlights["@variable.member.python"] = { link = "@indentifier" }

	-- XML
	highlights["@keyword.directive.define.xml"] = { link = "@tag" }
	highlights["@keyword.directive.xml"] = { link = "@tag" }
	highlights["@number.xml"] = { link = "@string" }
	highlights["@string.special.xml"] = { link = "@string" }

	return highlights
end

return M
