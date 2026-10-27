--- @meta

--- User options for `setup()`
--- @class theme.Opts
--- @field transparent? boolean Use transparent background
--- @field terminal_colors? boolean Set terminal ANSI colors
--- @field styles? theme.Styles Style customization
--- @field overrides? fun(colors: theme.Colors): theme.Highlights Returns highlight overrides
--- @field on_highlights? fun(highlights: theme.Highlights, colors: theme.Colors) Modifies highlights in place

--- @alias theme.Highlights table<string, vim.api.keyset.highlight>
--- @alias theme.StyleType "comments" | "keywords" | "functions" | "variables"
--- @alias theme.Styles table<theme.StyleType, vim.api.keyset.highlight>
--- @alias theme.StyleFn fun(hl: vim.api.keyset.highlight): vim.api.keyset.highlight
--- @alias theme.StyleFns table<theme.StyleType, theme.StyleFn>
