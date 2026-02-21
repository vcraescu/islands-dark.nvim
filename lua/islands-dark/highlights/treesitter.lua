-- Treesitter highlights for Islands Dark theme

local M = {}

--- Setup Treesitter highlights
--- @param c table Color palette
--- @param config table User configuration
--- @param util table Utility functions
--- @return table Highlight groups for Treesitter syntax elements
function M.setup(c, config, util)
	local highlights = {}

	-- Comments
	local comment_style = util.get_style(config, "comments")
	highlights["@comment"] = { fg = c.comment, bold = comment_style.bold, italic = comment_style.italic }
	highlights["@comment.documentation"] = { fg = c.doc_comment }
	highlights["@comment.error"] = { fg = c.error }
	highlights["@comment.warning"] = { fg = c.warning }
	highlights["@comment.note"] = { fg = c.info }
	highlights["@comment.todo"] = { fg = c.todo, bold = true }

	-- Constants
	local constant_style = util.get_style(config, "constants")
	highlights["@constant"] = { fg = c.constant, bold = constant_style.bold, italic = constant_style.italic }
	highlights["@constant.builtin"] = { fg = c.keyword }
	highlights["@constant.macro"] = { fg = c.constant }

	-- Strings
	local string_style = util.get_style(config, "strings")
	highlights["@string"] = { fg = c.string, bold = string_style.bold, italic = string_style.italic }
	highlights["@string.documentation"] = { fg = c.doc_comment }
	highlights["@string.escape"] = { fg = c.escape }
	highlights["@string.regexp"] = { fg = c.regex }
	highlights["@string.special"] = { fg = c.escape }
	highlights["@string.special.symbol"] = { fg = c.constant }
	highlights["@string.special.url"] = { fg = c.hyperlink }

	-- Characters
	highlights["@character"] = { fg = c.string }
	highlights["@character.special"] = { fg = c.escape }

	-- Numbers
	highlights["@number"] = { fg = c.number }
	highlights["@number.float"] = { fg = c.number }

	-- Booleans
	highlights["@boolean"] = { fg = c.keyword }

	-- Functions
	local function_style = util.get_style(config, "functions")
	highlights["@function"] = { fg = c.func, bold = function_style.bold, italic = function_style.italic }
	highlights["@function.builtin"] = { fg = c.func, bold = function_style.bold, italic = function_style.italic }
	highlights["@function.call"] = { fg = c.func, bold = function_style.bold, italic = function_style.italic }
	highlights["@function.macro"] = { fg = c.metadata }
	highlights["@function.method"] = { fg = c.method }
	highlights["@function.method.call"] = { fg = c.method }

	-- Constructors
	highlights["@constructor"] = { fg = c.method }

	-- Parameters
	highlights["@parameter"] = { fg = c.parameter }
	highlights["@parameter.builtin"] = { fg = c.parameter }

	-- Keywords
	local keyword_style = util.get_style(config, "keywords")
	highlights["@keyword"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights["@keyword.conditional"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights["@keyword.conditional.ternary"] = { fg = c.operator }
	highlights["@keyword.coroutine"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights["@keyword.debug"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights["@keyword.directive"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights["@keyword.directive.define"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights["@keyword.exception"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights["@keyword.function"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights["@keyword.import"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights["@keyword.operator"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights["@keyword.repeat"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights["@keyword.return"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }
	highlights["@keyword.storage"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }

	-- Operators
	highlights["@operator"] = { fg = c.operator }

	-- Punctuation
	highlights["@punctuation.delimiter"] = { fg = c.punctuation }
	highlights["@punctuation.bracket"] = { fg = c.braces }
	highlights["@punctuation.special"] = { fg = c.punctuation }

	-- Types
	highlights["@type"] = { fg = c.type }
	highlights["@type.builtin"] = { fg = c.keyword }
	highlights["@type.definition"] = { fg = c.type_definition }
	highlights["@type.qualifier"] = { fg = c.keyword, bold = keyword_style.bold, italic = keyword_style.italic }

	-- Attributes
	highlights["@attribute"] = { fg = c.metadata }
	highlights["@attribute.builtin"] = { fg = c.metadata }

	-- Properties
	highlights["@property"] = { fg = c.property }

	-- Variables
	local variable_style = util.get_style(config, "variables")
	highlights["@variable"] = { fg = c.variable, bold = variable_style.bold, italic = variable_style.italic }
	highlights["@variable.builtin"] = { fg = c.keyword }
	highlights["@variable.member"] = { fg = c.field }
	highlights["@variable.parameter"] = { fg = c.parameter }

	-- Modules
	highlights["@module"] = { fg = c.fg }
	highlights["@module.builtin"] = { fg = c.fg }

	-- Labels
	highlights["@label"] = { fg = c.label }

	-- Tags (HTML/XML)
	highlights["@tag"] = { fg = c.tag }
	highlights["@tag.attribute"] = { fg = c.attribute }
	highlights["@tag.delimiter"] = { fg = c.braces }

	-- Markup (Markdown, etc.)
	highlights["@markup.strong"] = { bold = true }
	highlights["@markup.italic"] = { italic = true }
	highlights["@markup.strikethrough"] = { strikethrough = true }
	highlights["@markup.underline"] = { underline = true }
	highlights["@markup.heading"] = { fg = c.constant, italic = true }
	highlights["@markup.quote"] = { fg = c.keyword }
	highlights["@markup.quote.markdown"] = { fg = c.string }
	highlights["@markup.math"] = { fg = c.number }
	highlights["@markup.link"] = { fg = c.hyperlink }
	highlights["@markup.link.label"] = { link = "@markup.link" }
	highlights["@markup.link.url"] = { fg = c.hyperlink, underline = true, italic = true }
	highlights["@markup.raw"] = { fg = c.string }
	highlights["@markup.raw.block"] = { fg = c.string, bg = c.injected_lang_bg }
	highlights["@label.markdown"] = { fg = c.constant }
	highlights["@markup.list"] = { fg = c.keyword }
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
	highlights["@function.builtin.bash"] = { fg = c.keyword }

	-- Go
	highlights["@type.builtin.go"] = { fg = c.keyword }
	highlights["@constant.builtin.go"] = { fg = c.keyword }
	highlights["@module.go"] = { fg = c.metadata }
	highlights["@namespace.go"] = { fg = c.metadata }

	-- TypeScript/JavaScript
	highlights["@constructor.typescript"] = { fg = c.fg }
	highlights["@constructor.tsx"] = { fg = c.fg }
	highlights["@type.parameter.typescript"] = { fg = c.type_parameter }
	highlights["@type.parameter.tsx"] = { fg = c.type_parameter }

	-- Lua
	highlights["@constructor.lua"] = { fg = c.braces }

	return highlights
end

return M
