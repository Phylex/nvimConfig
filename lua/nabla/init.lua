local M = {}

M.styles_list = {'neon'}

---Change colorscheme option (vim.g.nabla_config.option)
---helper function for setting options
---It can't be changed directly by modifing that field due to a Neovim lua bug with global variables (nabla_config is a global variable)
---@param opt string: option name
---@param value any: new value
function M.set_options(opt, value)
    local cfg = vim.g.nabla_config
    cfg[opt] = value
    vim.g.nabla_config = cfg
end

---Toggle between onedark styles
-- function M.toggle()
--     local index = vim.g.nabla_config.toggle_style_index + 1
--     if index > #vim.g.nabla_config.toggle_style_list then index = 1 end
--     M.set_options('style', vim.g.nabla_config.toggle_style_list[index])
--     M.set_options('toggle_style_index', index)
--     if vim.g.nabla_config.style == 'light' then
--         vim.o.background = 'light'
--     else
--         vim.o.background = 'dark'
--     end
--     vim.api.nvim_command('colorscheme nabla')
-- end

local default_config = {
    -- Main options --
    style = 'neon',    -- choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,     -- don't set background
    term_colors = true,      -- if true enable the terminal
    ending_tildes = false,    -- show the end-of-buffer tildes
    cmp_itemkind_reverse = false,    -- reverse item kind highlights in cmp menu

    -- Changing Formats --
    code_style = {
        comments =  'italic',
        keywords =  'bold',
        functions = 'none',
        strings =   'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- center bar (c) transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Related --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl for diagnostics
        background = true,    -- use background color for virtual text
    },
}

---Apply the colorscheme (same as ':colorscheme nabla')
function M.colorscheme()
    -- remove the old colorscheme
    vim.cmd("hi clear")
    if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end

    -- set options of the colorscheme
    vim.o.termguicolors = true
    vim.g.colors_name = "nabla"

    -- set the background dark, as we do not currently support
    -- a light variant of the theme
    if vim.o.background == 'light' then
        vim.o.background = 'dark'
        -- currently we use the 'neon' style
        M.set_options('style', 'neon')
    end
    
    -- run the code in the other modules
    require('nabla.highlights').setup()
    require('nabla.terminal').setup()
end

---Setup onedark.nvim options, without applying colorscheme
---@param opts table: a table containing options
function M.setup(opts)
    if not vim.g.nabla_config or not vim.g.nabla_config.loaded then    -- if it's the first time setup() is called
        vim.g.nabla_config = vim.tbl_deep_extend('keep', vim.g.nabla_config or {}, default_config)
        M.set_options('loaded', true)
    end
    if opts then
        vim.g.nabla_config = vim.tbl_deep_extend('force', vim.g.nabla_config, opts)
    end
end

function M.load()
  vim.api.nvim_command('colorscheme nabla')
end

return M
