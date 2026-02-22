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
	highlights["@comment.documentation"] = { link = "SpecialComment", unpack(comment_style) }
	highlights["@comment.error"] = { fg = c.fg, bg = c.error, unpack(comment_style) }
	highlights["@comment.warning"] = { link = "Debug", unpack(comment_style) }
	highlights["@comment.note"] = { fg = c.info, unpack(comment_style) }
	highlights["@comment.todo"] = { fg = c.fg, bg = c.todo, unpack(comment_style) }

	-- Constants
	highlights["@constant"] = { link = "Constant" }
	highlights["@constant.builtin"] = { link = "Keyword", unpack(constant_style) }
	highlights["@constant.macro"] = { link = "Macro", unpack(constant_style) }

	-- Strings
	highlights["@string"] = { link = "String", unpack(string_style) }
	highlights["@string.documentation"] = { link = "SpecialComment", unpack(string_style) }
	highlights["@string.escape"] = { fg = c.escape, unpack(string_style) }
	highlights["@string.regexp"] = { fg = c.regex, unpack(string_style) }
	highlights["@string.special"] = { link = "SpecialChar", unpack(string_style) }
	highlights["@string.special.symbol"] = { link = "Constant", unpack(string_style) }
	highlights["@string.special.url"] = { link = "Underlined", unpack(string_style) }

	-- Characters
	highlights["@character"] = { link = "Character" }
	highlights["@character.special"] = { link = "SpecialChar" }

	-- Numbers
	highlights["@number"] = { link = "Number" }
	highlights["@number.float"] = { link = "@number" }

	-- Booleans
	highlights["@boolean"] = { link = "Boolean" }

	-- Functions
	highlights["@function"] = { link = "Function", unpack(function_style) }
	highlights["@function.builtin"] = { link = "Function", unpack(function_style) }
	highlights["@function.call"] = { link = "Function", unpack(function_style) }
	highlights["@function.macro"] = { fg = c.metadata, unpack(function_style) }
	highlights["@function.method"] = { fg = c.method, unpack(function_style) }
	highlights["@function.method.call"] = { link = "@function.method", unpack(function_style) }

	-- Constructors
	highlights["@constructor"] = { link = "@function.method" }

	-- Parameters
	highlights["@parameter"] = { link = "Identifier" }
	highlights["@parameter.builtin"] = { link = "Identifier" }

	-- Keywords
	highlights["@keyword"] = { link = "Keyword", unpack(keyword_style) }
	highlights["@keyword.conditional"] = { link = "@keyword", unpack(keyword_style) }
	highlights["@keyword.conditional.ternary"] = { link = "Operator", unpack(keyword_style) }
	highlights["@keyword.coroutine"] = { link = "@keyword", unpack(keyword_style) }
	highlights["@keyword.debug"] = { link = "@keyword", unpack(keyword_style) }
	highlights["@keyword.directive"] = { link = "@keyword", unpack(keyword_style) }
	highlights["@keyword.directive.define"] = { link = "@keyword", unpack(keyword_style) }
	highlights["@keyword.exception"] = { link = "Exception", unpack(keyword_style) }
	highlights["@keyword.function"] = { link = "@keyword", unpack(keyword_style) }
	highlights["@keyword.import"] = { link = "@keyword", unpack(keyword_style) }
	highlights["@keyword.operator"] = { link = "@keyword", unpack(keyword_style) }
	highlights["@keyword.repeat"] = { link = "@keyword", unpack(keyword_style) }
	highlights["@keyword.return"] = { link = "@keyword", unpack(keyword_style) }
	highlights["@keyword.storage"] = { link = "@keyword", unpack(keyword_style) }

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
	highlights["@variable"] = { link = "Identifier", unpack(variable_style) }
	highlights["@variable.builtin"] = { link = "@keyword", unpack(variable_style) }
	highlights["@variable.member"] = { fg = c.field, unpack(variable_style) }
	highlights["@variable.parameter"] = { link = "@parameter", unpack(variable_style) }

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
