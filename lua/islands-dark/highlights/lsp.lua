local M = {}

--- Setup LSP semantic token highlights
--- @param c theme.Colors Color palette
--- @return table Highlight groups for LSP semantic tokens
function M.get(c)
	return {
		-- Namespaces and modules
		["@lsp.type.namespace"] = { link = "@type" },
		["@lsp.type.module"] = { link = "@lsp.type.namespace" },

		-- Types
		["@lsp.type.type"] = { link = "@type" },
		["@lsp.type.class"] = { link = "@lsp.type.type" },
		["@lsp.type.enum"] = { link = "@lsp.type.type" },
		["@lsp.type.interface"] = { link = "@lsp.type.type" },
		["@lsp.type.struct"] = { link = "@lsp.type.type" },
		["@lsp.type.typeParameter"] = { link = "@lsp.type.type" },

		-- Functions and methods
		["@lsp.type.function"] = { link = "@function" },
		["@lsp.type.method"] = { link = "@lsp.type.function" },
		["@lsp.type.macro"] = { link = "Macro" },
		["@lsp.type.decorator"] = { link = "PreProc" },

		-- Variables
		["@lsp.type.variable"] = { link = "@variable" },
		["@lsp.type.parameter"] = { link = "@lsp.type.variable" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.field"] = { link = "@variable.member" },
		["@lsp.type.enumMember"] = { fg = c.enum_member },

		-- Keywords
		["@lsp.type.keyword"] = { link = "@keyword" },

		-- Comments
		["@lsp.type.comment"] = { link = "@comment" },

		-- Modifiers
		["@lsp.mod.constant"] = { link = "@constant" },
		["@lsp.mod.readonly"] = { link = "@lsp.mod.constant" },
		["@lsp.mod.static"] = { link = "@lsp.type.function" },
		["@lsp.mod.deprecated"] = { fg = c.deprecated },
		["@lsp.mod.defaultLibrary"] = { link = "@lsp.mod.keyword" },

		-- Specific language semantic tokens
		["@lsp.typemod.variable.readonly"] = { link = "@lsp.mod.constant" },
		["@lsp.typemod.variable.constant"] = { link = "@lsp.mod.constant" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@keyword" },
		["@lsp.typemod.method.defaultLibrary"] = { link = "@lsp.type.method" },
		["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.type.definition"] = { link = "@type.definition" },
		["@lsp.typemod.class.declaration"] = { link = "@lsp.typemod.type.definition" },
		["@lsp.typemod.interface.declaration"] = { link = "@lsp.typemod.type.definition" },

		-- Go-specific LSP semantic tokens
		["@lsp.type.namespace.go"] = { fg = c.metadata },

		--- Typescript/JS-specific LSP semantic tokens
		["@lsp.typemod.variable.readonly.typescript"] = { link = "@constant.typescript" },
		["@lsp.typemod.variable.readonly.typescriptreact"] = { link = "@constant.typescript" },
		["@lsp.typemod.variable.readonly.javascript"] = { link = "@constant.typescript" },
		["@lsp.mod.readonly.typescript"] = {},
		["@lsp.mod.readonly.typescriptreact"] = {},
		["@lsp.mod.readonly.javascript"] = {},
		["@lsp.type.property.javascript"] = {},
		["@tag.builtin.tsx"] = { link = "@tag" },
		["@tag.delimiter.tsx"] = { link = "@tag" },

		-- Proto
		["@lsp.type.property.proto"] = { link = "@property.proto" },
		["@lsp.type.struct.proto"] = { link = "@type.proto" },
		["@lsp.type.enum.proto"] = { link = "@type.proto" },
		["@lsp.type.namespace.proto"] = { link = "@type.proto" },
	}
end

return M
