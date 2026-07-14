# Rust LSP + Autocompletion Design

Date: 2026-07-14

## Goal

Add working Rust language-server support and autocompletion to the Neovim
config, matching the quality of the existing C/Python/Verilog setups.

## Approach

Use the [`rustaceanvim`](https://github.com/mrcjkb/rustaceanvim) plugin, which
manages `rust-analyzer` and layers Rust-specific features (cargo runnables,
macro expansion, HIR/MIR views, better proc-macro handling) on top of the base
LSP experience.

Scope is **LSP + completion only** — no debugging (nvim-dap / codelldb) in this
change. Debugging can be added later; rustaceanvim auto-wires into DAP once it
is present.

## Prerequisites (manual, one-time)

Install the language server. The system already has Fedora's `cargo`/`rustc`
(1.96.1) but no `rust-analyzer` and no `rustup`:

```
sudo dnf install rust-analyzer
```

rustaceanvim discovers `rust-analyzer` automatically on `PATH`.

## Changes to `init.lua`

Add a plugin spec inside the existing `require('lazy').setup({ ... })` block:

```lua
{
  'mrcjkb/rustaceanvim',
  version = '^6',
  lazy = false, -- plugin manages its own filetype loading
  init = function()
    vim.g.rustaceanvim = {
      server = {
        -- reuse blink.cmp completion capabilities, same as the other servers
        capabilities = require('blink.cmp').get_lsp_capabilities(),
        default_settings = {
          ['rust-analyzer'] = {
            check = { command = 'clippy' }, -- lint with clippy on save
          },
        },
      },
    }
  end,
},
```

## What deliberately does NOT change

- **Keymaps** — the global `LspAttach` autocmd (`gd`, `gr`, `K`, hover,
  inlay-hint toggle, etc.) fires for the Rust client automatically, so existing
  LSP keybindings work in Rust with no additions.
- **Completion** — `blink.cmp` already drives the `lsp` source; capabilities
  are wired in via the `init` block above.
- **Treesitter** — the `rust` grammar is already in `ensure_installed`.
- **`vim.lsp.enable` / `merge_blink_capabilities` list** — rustaceanvim owns
  the Rust LSP lifecycle entirely, so `rust_analyzer` is intentionally NOT
  added there. Doing so would start a second, conflicting client.

## Rationale

rustaceanvim is configured through the `vim.g.rustaceanvim` global rather than a
`setup()` call, so configuration lives in the plugin's `init` function (which
runs before the plugin loads). Requiring `blink.cmp` there forces it to load
early, but the config already loads blink at startup via the `nvim-lspconfig`
config block, so this is not a regression.

`check = { command = 'clippy' }` is included as a sensible default (clippy ships
with the Fedora toolchain). It can be dropped in favour of plain `cargo check`.

## Verification

1. Open a `.rs` file inside a cargo project.
2. `:checkhealth rustaceanvim` — reports `rust-analyzer` found.
3. `:LspInfo` (or `:che`) shows `rust-analyzer` attached to the buffer.
4. Autocompletion appears while typing; `K` shows hover; `gd` goes to
   definition; diagnostics/clippy lints surface after save.
