-- Treesitter highlights for Islands Dark theme

local M = {}

--- Setup Treesitter highlights
--- @param c table Color palette
--- @return table Highlight groups for Treesitter syntax elements
function M.setup(c)
	local highlights = {}

	-- Comments
	highlights["@comment"] = { link = "Comment" }
	highlights["@comment.documentation"] = { link = "SpecialComment" }
	highlights["@comment.error"] = { link = "Error" }
	highlights["@comment.warning"] = { link = "Debug" }
	highlights["@comment.note"] = { fg = c.info }
	highlights["@comment.todo"] = { link = "Todo" }

	-- Constants
	highlights["@constant"] = { link = "Constant" }
	highlights["@constant.builtin"] = { link = "Keyword" }
	highlights["@constant.macro"] = { link = "Macro" }

	-- Strings
	highlights["@string"] = { link = "String" }
	highlights["@string.documentation"] = { link = "SpecialComment" }
	highlights["@string.escape"] = { link = "SpecialChar" }
	highlights["@string.regexp"] = { fg = c.regex }
	highlights["@string.special"] = { link = "SpecialChar" }
	highlights["@string.special.symbol"] = { link = "Constant" }
	highlights["@string.special.url"] = { link = "Underlined" }

	-- Characters
	highlights["@character"] = { link = "Character" }
	highlights["@character.special"] = { link = "SpecialChar" }

	-- Numbers
	highlights["@number"] = { link = "Number" }
	highlights["@number.float"] = { link = "@number" }

	-- Booleans
	highlights["@boolean"] = { link = "Boolean" }

	-- Functions
	highlights["@function"] = { link = "Function" }
	highlights["@function.builtin"] = { link = "Function" }
	highlights["@function.call"] = { link = "Function" }
	highlights["@function.macro"] = { fg = c.metadata }
	highlights["@function.method"] = { fg = c.method }
	highlights["@function.method.call"] = { link = "@function.method" }

	-- Constructors
	highlights["@constructor"] = { link = "@function.method" }

	-- Parameters
	highlights["@parameter"] = { link = "Identifier" }
	highlights["@parameter.builtin"] = { link = "Identifier" }

	-- Keywords
	highlights["@keyword"] = { link = "Keyword" }
	highlights["@keyword.conditional"] = { link = "@keyword" }
	highlights["@keyword.conditional.ternary"] = { link = "Operator" }
	highlights["@keyword.coroutine"] = { link = "@keyword" }
	highlights["@keyword.debug"] = { link = "@keyword" }
	highlights["@keyword.directive"] = { link = "@keyword" }
	highlights["@keyword.directive.define"] = { link = "@keyword" }
	highlights["@keyword.exception"] = { link = "Exception" }
	highlights["@keyword.function"] = { link = "@keyword" }
	highlights["@keyword.import"] = { link = "@keyword" }
	highlights["@keyword.operator"] = { link = "@keyword" }
	highlights["@keyword.repeat"] = { link = "@keyword" }
	highlights["@keyword.return"] = { link = "@keyword" }
	highlights["@keyword.storage"] = { link = "@keyword" }

	-- Operators
	highlights["@operator"] = { link = "Operator" }

	-- Punctuation
	highlights["@punctuation.delimiter"] = { link = "Delimiter" }
	highlights["@punctuation.bracket"] = { fg = c.braces }
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
	highlights["@variable"] = { link = "Identifier" }
	highlights["@variable.builtin"] = { link = "@keyword" }
	highlights["@variable.member"] = { fg = c.field }
	highlights["@variable.parameter"] = { link = "@parameter" }

	-- Modules
	highlights["@module"] = { fg = c.fg }
	highlights["@module.builtin"] = { fg = c.fg }

	-- Labels
	highlights["@label"] = { link = "Label" }

	-- Tags (HTML/XML)
	highlights["@tag"] = { link = "Tag" }
	highlights["@tag.attribute"] = { fg = c.attribute }
	highlights["@tag.delimiter"] = { link = "@punctuation.bracket" }

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

	return highlights
end

return M
