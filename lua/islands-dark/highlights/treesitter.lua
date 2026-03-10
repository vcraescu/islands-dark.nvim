local M = {}

--- Get Treesitter highlights
--- @param c theme.Colors Color palette
--- @param config theme.Config Theme configuration
--- @return theme.Highlights
function M.get(c, config)
	local util = require("islands-dark.util")
	local styles = util.get_styles(config)

	return {
		["@annotation"] = { link = "PreProc" },
		["@attribute"] = { fg = c.attribute },
		["@character"] = { link = "Character" },
		["@character.special"] = { link = "SpecialChar" },
		["@comment"] = styles.comments({ link = "Comment" }),
		["@comment.attribute"] = styles.comments({ fg = c.comment_tag }),
		["@comment.documentation"] = { link = "@comment" },
		["@comment.error"] = styles.comments({ link = "Todo" }),
		["@comment.hint"] = styles.comments({ link = "Todo" }),
		["@comment.info"] = styles.comments({ link = "Todo" }),
		["@comment.note"] = styles.comments({ link = "Todo" }),
		["@comment.todo"] = styles.comments({ link = "Todo" }),
		["@comment.warning"] = styles.comments({ link = "Todo" }),
		["@constant"] = { link = "Constant" },
		["@constant.builtin"] = { fg = c.constant_builtin, nocombine = true },
		["@constructor"] = { fg = c.keyword },
		["@diff.delta"] = { link = "DiffChange" },
		["@diff.minus"] = { link = "DiffDelete" },
		["@diff.plus"] = { link = "DiffAdd" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = styles.functions({ fg = c.func_builtin }),
		["@function.call"] = styles.functions({ fg = c.func_call }),
		["@function.macro"] = { link = "Macro" },
		["@function.method"] = { link = "Function" },
		["@function.method.call"] = { link = "@function.call" },
		["@keyword.conditional.ternary"] = { link = "Operator" },
		["@keyword.directive"] = { link = "PreProc" },
		["@keyword.directive.define"] = { link = "Define" },
		["@label"] = { link = "Label" },
		["@markup"] = { fg = c.text },
		["@markup.heading"] = { link = "@markup" },
		["@markup.italic"] = { italic = true },
		["@markup.link"] = { fg = c.link },
		["@markup.link.url"] = { link = "Underlined" },
		["@markup.list"] = { fg = c.keyword },
		["@markup.list.checked"] = { fg = c.text },
		["@markup.list.unchecked"] = { fg = c.text },
		["@markup.math"] = { link = "Number" },
		["@markup.quote"] = { fg = c.string },
		["@markup.raw"] = { fg = c.string },
		["@markup.raw.block"] = { fg = c.string, bg = c.cyan1 },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.strong"] = { bold = true },
		["@markup.underline"] = { underline = true },
		["@module"] = { link = "Include" },
		["@module.builtin"] = { fg = c.keyword },
		["@number"] = { link = "Number" },
		["@operator"] = { link = "Operator" },
		["@parameter"] = { fg = c.parameter },
		["@property"] = { fg = c.property },
		["@punctuation"] = { link = "Delimiter" },
		["@punctuation.special"] = { fg = c.keyword },
		["@string"] = { link = "String" },
		["@string.documentation"] = { link = "SpecialComment" },
		["@string.escape"] = { fg = c.escape },
		["@string.regexp"] = { fg = c.regex },
		["@string.special"] = { link = "SpecialChar" },
		["@string.special.path"] = { fg = c.text },
		["@string.special.symbol"] = { fg = c.constant },
		["@string.special.url"] = { link = "Underlined" },
		["@tag"] = { link = "Tag" },
		["@tag.attribute"] = { fg = c.text },
		["@tag.builtin"] = { link = "Tag" },
		["@tag.delimiter"] = { link = "Tag" },
		["@type"] = { link = "Type" },
		["@type.builtin"] = { fg = c.type_builtin },
		["@type.definition"] = { link = "Typedef" },
		["@type.qualifier"] = { link = "Keyword" },
		["@variable"] = { link = "Identifier" },
		["@variable.builtin"] = { fg = c.variable_builtin },
		["@variable.member"] = { link = "@property" },

		-- Lua
		["@constant.lua"] = {},
		["@constructor.lua"] = { link = "@punctuation.bracket" },

		-- YAML
		["@property.yaml"] = { fg = c.keyword },

		-- Proto
		["@property.proto"] = { fg = c.text },

		-- Python
		["@variable.member.python"] = { fg = c.text },

		-- HTML
		["@constant.html"] = { link = "@tag" },
		["@markup.heading.1.html"] = { link = "@markup" },
		["@markup.heading.2.html"] = { link = "@markup" },
		["@markup.heading.3.html"] = { link = "@markup" },
		["@markup.heading.4.html"] = { link = "@markup" },
		["@markup.heading.5.html"] = { link = "@markup" },
		["@markup.heading.6.html"] = { link = "@markup" },
		["@markup.heading.html"] = { link = "@markup" },

		-- Go
		["@string.special.url.gomod"] = { fg = c.string },
		["@string.special.url.gosum"] = { fg = c.string },
		["@variable.member.go"] = { fg = c.variable },

		-- Markdown
		["@conceal.markdown_inline"] = { fg = c.keyword },
		["@label.markdown"] = { link = "@constant" },
		["@markup.heading.1.markdown"] = { link = "@constant" },
		["@markup.heading.2.markdown"] = { link = "@markup.heading.1.markdown" },
		["@markup.heading.3.markdown"] = { link = "@markup.heading.1.markdown" },
		["@markup.heading.4.markdown"] = { link = "@markup.heading.1.markdown" },
		["@markup.heading.5.markdown"] = { link = "@markup.heading.1.markdown" },
		["@markup.heading.6.markdown"] = { link = "@markup.heading.1.markdown" },

		-- Bash
		["@constant.bash"] = {},
		["@function.call.bash"] = { link = "@function.builtin" },

		-- PHP
		["@constructor.php"] = { link = "@function" },
		["@attribute.phpdoc"] = { link = "@comment.attribute" },
		["@type.phpdoc"] = styles.comments({ link = "@type.definition" }),
		["@keyword.phpdoc"] = styles.comments({ link = "@variable" }),
		["@variable.parameter.phpdoc"] = styles.comments({ link = "@variable" }),

		-- CSS
		["@attribute.css"] = { link = "@tag" },
		["@property.css"] = {},

		-- Typescript / Javascript
		["@keyword.jsdoc"] = { link = "@comment.attribute" },
		["@type.jsdoc"] = styles.comments({ link = "@type.definition" }),
		["@tag.tsx"] = { fg = c.special_tag },
	}
end

return M
