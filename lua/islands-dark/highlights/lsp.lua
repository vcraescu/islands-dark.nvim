local M = {}

--- Setup LSP semantic token highlights
--- @param c theme.Colors Color palette
--- @return table Highlight groups for LSP semantic tokens
function M.get(c)
	return {
		-- Namespaces and modules
		["@lsp.type.namespace"] = { link = "@label" },
		["@lsp.type.module"] = { link = "@lsp.type.namespace" },

		-- Types
		["@lsp.type.type"] = { link = "@type" },
		["@lsp.type.class"] = { link = "@lsp.type.type" },
		["@lsp.type.enum"] = { link = "@lsp.type.type" },
		["@lsp.type.interface"] = { link = "@lsp.type.type" },
		["@lsp.type.struct"] = { link = "@lsp.type.type" },
		["@lsp.type.typeParameter"] = { link = "@lsp.type.type" },

		-- Functions and methods
		["@lsp.type.function"] = {},
		["@lsp.type.method"] = {},
		["@lsp.type.macro"] = { link = "Macro" },
		["@lsp.type.decorator"] = { link = "PreProc" },

		-- Variables
		["@lsp.type.variable"] = { link = "@variable" },
		["@lsp.type.parameter"] = { link = "@lsp.type.variable" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.field"] = { link = "@variable.member" },
		["@lsp.type.enumMember"] = { link = "@property" },

		-- Keywords
		["@lsp.type.keyword"] = { link = "@keyword" },

		-- Comments
		["@lsp.type.comment"] = { link = "@comment" },

		-- Modifiers
		["@lsp.mod.constant"] = { link = "@constant" },
		["@lsp.mod.readonly"] = { link = "@lsp.mod.constant" },
		["@lsp.mod.static"] = { link = "@lsp.type.function" },
		["@lsp.mod.defaultLibrary"] = { link = "@lsp.mod.keyword" },

		-- Specific language semantic tokens
		["@lsp.typemod.variable.readonly"] = { link = "@lsp.mod.constant" },
		["@lsp.typemod.variable.constant"] = { link = "@lsp.mod.constant" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.type.definition"] = { link = "@type.definition" },
		["@lsp.typemod.class.declaration"] = { link = "@lsp.typemod.type.definition" },
		["@lsp.typemod.interface.declaration"] = { link = "@lsp.typemod.type.definition" },

		--- Typescript/JS-specific LSP semantic tokens
		["@lsp.typemod.variable.readonly.typescript"] = { link = "@constant.typescript" },
		["@lsp.typemod.variable.readonly.javascript"] = { link = "@constant.typescript" },
		["@lsp.typemod.variable.readonly.tsx"] = { link = "@constant.typescript" },
		["@lsp.typemod.variable.readonly.typescriptreact"] = { link = "@constant.typescript" },

		["@lsp.mod.readonly.typescript"] = {},
		["@lsp.mod.readonly.javascript"] = {},
		["@lsp.mod.readonly.tsx"] = {},
		["@lsp.mod.readonly.typescriptreact"] = {},

		["@lsp.type.property.javascript"] = {},

		["@lsp.typemod.variable.defaultLibrary.typescript"] = { link = "@variable.builtin.typescript" },
		["@lsp.typemod.variable.defaultLibrary.javascript"] = { link = "@variable.builtin.typescript" },
		["@lsp.typemod.variable.defaultLibrary.tsx"] = { link = "@variable.builtin.typescript" },
		["@lsp.typemod.variable.defaultLibrary.typescriptreact"] = { link = "@variable.builtin.typescript" },

		["@lsp.type.type.typescript"] = { link = "@type.typescript" },
		["@lsp.type.type.javascript"] = { link = "@type.typescript" },
		["@lsp.type.type.tsx"] = { link = "@type.typescript" },
		["@lsp.type.type.typescriptreact"] = { link = "@type.typescript" },

		["@lsp.type.interface.typescript"] = { link = "@type.typescript" },
		["@lsp.type.interface.javascript"] = { link = "@type.typescript" },
		["@lsp.type.interface.tsx"] = { link = "@type.typescript" },
		["@lsp.type.interface.typescriptreact"] = { link = "@type.typescript" },

		["@lsp.type.class.typescript"] = { link = "@type.typescript" },
		["@lsp.type.class.javascript"] = { link = "@type.typescript" },
		["@lsp.type.class.tsx"] = { link = "@type.typescript" },
		["@lsp.type.class.typescriptreact"] = { link = "@type.typescript" },

		["@lsp.typemod.function.defaultLibrary.typescript"] = { link = "@function" },
		["@lsp.typemod.function.defaultLibrary.javascript"] = { link = "@function" },
		["@lsp.typemod.function.defaultLibrary.tsx"] = { link = "@function" },
		["@lsp.typemod.function.defaultLibrary.typescriptreact"] = { link = "@function" },

		["@lsp.typemod.type.defaultLibrary.typescript"] = { link = "@type.typescript" },
		["@lsp.typemod.type.defaultLibrary.javascript"] = { link = "@type.typescript" },
		["@lsp.typemod.type.defaultLibrary.tsx"] = { link = "@type.typescript" },
		["@lsp.typemod.type.defaultLibrary.typescriptreact"] = { link = "@type.typescript" },

		-- Proto
		["@lsp.type.property.proto"] = { link = "@property.proto" },
		["@lsp.type.struct.proto"] = { link = "@type.proto" },
		["@lsp.type.enum.proto"] = { link = "@type.proto" },
		["@lsp.type.namespace.proto"] = { link = "@variable.member.proto" },
		["@lsp.type.interface.proto"] = { link = "@type.proto" },
		["@lsp.type.decorator.proto"] = { link = "@identifier" },
		["@lsp.typemod.type.defaultLibrary.proto"] = { link = "@type.proto" },
		["@lsp.type.type.proto"] = { link = "@type.proto" },

		-- Lua
		["@lsp.type.class.lua"] = { link = "@variable.lua" },
	}
end

return M
