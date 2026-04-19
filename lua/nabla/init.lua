-- Entrypoint for the nabla colorscheme.
-- Dark-only. Single palette (no style selector).

local M = {}

local default_config = {
    transparent = false,
    term_colors = true,
    ending_tildes = false,
    cmp_itemkind_reverse = false,

    code_style = {
        comments  = 'italic',
        keywords  = 'bold',
        functions = 'none',
        strings   = 'none',
        variables = 'none',
    },

    lualine = {
        transparent = false,
    },

    colors = {},     -- user override: merged into palette at setup()
    highlights = {}, -- user override: applied after default highlights

    diagnostics = {
        darker = true,
        undercurl = true,
        background = true,
    },
}

---Change a colorscheme option at runtime.
---@param opt string
---@param value any
function M.set_options(opt, value)
    local cfg = vim.g.nabla_config
    cfg[opt] = value
    vim.g.nabla_config = cfg
end

---Apply the colorscheme (same as ':colorscheme nabla').
function M.colorscheme()
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end

    vim.o.termguicolors = true
    vim.g.colors_name = "nabla"

    -- Dark-only theme; force dark regardless of background setting.
    vim.o.background = 'dark'

    require('nabla.highlights').setup()
    require('nabla.terminal').setup()
end

---Initialize options without applying the colorscheme.
---@param opts table|nil
function M.setup(opts)
    if not vim.g.nabla_config or not vim.g.nabla_config.loaded then
        vim.g.nabla_config = vim.tbl_deep_extend('keep', vim.g.nabla_config or {}, default_config)
        M.set_options('loaded', true)
    end
    if opts then
        vim.g.nabla_config = vim.tbl_deep_extend('force', vim.g.nabla_config, opts)
    end
end

---Resolve the effective palette: base palette with user overrides merged in.
---@return table
function M.palette()
    local base = require('nabla.palette')
    local overrides = (vim.g.nabla_config and vim.g.nabla_config.colors) or {}
    return vim.tbl_deep_extend('force', base, overrides)
end

---Convenience loader.
function M.load()
    vim.api.nvim_command('colorscheme nabla')
end

return M
