# Agents Guide for kickstart.nvim

## Commands
- **Format**: `:lua require('conform').format()` or `<leader>f` (uses stylua for Lua, ruff for Python, jq for JSON)
- **Lint**: Formatters run on save automatically (see conform.nvim config)
- **Check health**: `:checkhealth` - diagnose configuration issues
- **Plugin management**: `:Lazy` to view/install/update plugins
- **LSP**: Configured via mason.nvim - servers: lua_ls, gopls, pyright, ruff, rust_analyzer
- **Check config**: `nvim --headless -c "quit" 2>&1` - always run after editing config to check for errors

## Architecture
- **Single-file config**: init.lua contains entire configuration (intentionally monolithic for learning)
- **Plugin structure**: Custom plugins in `lua/custom/plugins/`, kickstart examples in `lua/kickstart/plugins/`
- **Plugin manager**: lazy.nvim for all plugin management
- **LSP**: nvim-lspconfig + mason.nvim for language servers
- **Formatting**: conform.nvim handles all formatting (auto-format on save)
- **Completion**: blink.cmp (upstream default) with LuaSnip for snippets

## Upstream Alignment
- **neo-tree**: Must NOT be lazy-loaded (no `cmd = 'Neotree'`) - upstream requires eager loading for netrw hijacking
- **blink.cmp**: Keep as default completion engine per upstream (do not remove or replace with nvim-cmp)

## Code Style (Lua)
- **Indentation**: 2 spaces (see .stylua.toml)
- **Line width**: 160 characters max
- **Quotes**: Auto-prefer single quotes
- **Function calls**: No parentheses when possible (stylua: `call_parentheses = "None"`)
- **Comments**: Use `--` for single line, `--[[  ]]` for blocks
- **Conventions**: Follow existing patterns in init.lua; use `vim.keymap.set()` for keymaps, `vim.opt` for options
- **ASCII only**: Never use nerd fonts and emojis, only ASCII
