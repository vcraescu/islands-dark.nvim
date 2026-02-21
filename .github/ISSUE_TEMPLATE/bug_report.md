---
name: Bug report
about: Create a report to help us improve Islands Dark
title: '[BUG] '
labels: bug
assignees: ''
---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Open file '...'
2. Set configuration '...'
3. Observe '...'
4. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Environment (please complete the following information):**
 - OS: [e.g. macOS, Linux, Windows]
 - Terminal: [e.g. iTerm2, Alacritty, WezTerm]
 - Neovim version: [output of `nvim --version`]
 - Islands Dark version: [commit hash or tag]
 - Plugin manager: [e.g. lazy.nvim, packer.nvim, vim-plug]

**Configuration**
Please provide your Islands Dark configuration:
```lua
require("islands-dark").setup({
  -- Your configuration here
})
```

**Additional context**
Add any other context about the problem here.

**Checklist**
- [ ] I have updated to the latest version of Islands Dark
- [ ] I have checked that `vim.opt.termguicolors = true` is set
- [ ] I have verified my terminal supports true color
- [ ] I have searched existing issues for duplicates
