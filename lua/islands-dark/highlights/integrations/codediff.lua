local M = {}

--- Get CodeDiff highlight groups
--- @param c theme.Colors Color palette
--- @return theme.Highlights
function M.get(c)
	return {
		CodeDiffLineInsert = { link = "DiffAdd" },
		CodeDiffLineDelete = { link = "DiffDelete" },
		CodeDiffCharInsert = { bg = c.git_add, fg = c.base3 },
		CodeDiffCharDelete = { bg = c.git_delete, fg = c.base3 },
		CodeDiffLineMove = { link = "DiffChange" },
		CodeDiffCharMove = { bg = c.visual },
		CodeDiffMoveFrom = { fg = c.git_change },
		CodeDiffMoveTo = { fg = c.git_change },
		CodeDiffFiller = { fg = c.border },

		ExplorerDirectorySmall = { link = "Comment" },
		NeoTreeIndentMarker = { link = "Comment" },
		CodeDiffExplorerSelected = { link = "Visual" },
		CodeDiffExplorerTreeGroup = { link = "Directory" },
		CodeDiffExplorerStatFiles = { link = "Number" },
		CodeDiffExplorerStatInsertions = { link = "Added" },
		CodeDiffExplorerStatDeletions = { link = "Removed" },
		CodeDiffExplorerStatBinary = { link = "NonText" },

		CodeDiffStatusAdded = { link = "DiagnosticOk" },
		CodeDiffStatusModified = { link = "DiagnosticWarn" },
		CodeDiffStatusDeleted = { link = "DiagnosticError" },
		CodeDiffStatusRenamed = { link = "DiagnosticInfo" },
		CodeDiffStatusUntracked = { link = "DiagnosticInfo" },
		CodeDiffStatusConflict = { link = "DiagnosticError" },

		CodeDiffConflictSign = { link = "DiagnosticSignWarn" },
		CodeDiffConflictSignResolved = { link = "Comment" },
		CodeDiffConflictSignAccepted = { link = "DiagnosticSignOk" },
		CodeDiffConflictSignRejected = { link = "DiagnosticSignError" },

		CodeDiffHelpHeader = { link = "Title" },
		CodeDiffHelpSection = { link = "Statement" },
		CodeDiffHelpKey = { link = "Special" },
		CodeDiffHelpSep = { link = "NonText" },
		CodeDiffHelpDesc = { link = "Normal" },
		CodeDiffHistoryTitle = { link = "FloatTitle" },
		CodeDiffWelcomeLogo = { link = "Function" },
		CodeDiffWelcomeKey = { link = "Special" },
	}
end

return M
