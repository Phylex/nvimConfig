local c = require('nabla').palette()
local cfg = vim.g.nabla_config or {}
local lualine_cfg = (cfg.lualine or {})
local section_c_bg = lualine_cfg.transparent and 'NONE' or c.bg.soft

local nabla = {
    inactive = {
        a = { fg = c.fg.dim,  bg = c.bg.base,   gui = 'bold' },
        b = { fg = c.fg.dim,  bg = c.bg.base },
        c = { fg = c.fg.dim,  bg = section_c_bg },
    },
    normal = {
        a = { fg = c.bg.base, bg = c.green.base, gui = 'bold' },
        b = { fg = c.fg.base, bg = c.bg.surface },
        c = { fg = c.fg.base, bg = section_c_bg },
    },
    visual  = { a = { fg = c.bg.base, bg = c.purple.light, gui = 'bold' } },
    replace = { a = { fg = c.bg.base, bg = c.red.base,     gui = 'bold' } },
    insert  = { a = { fg = c.bg.base, bg = c.blue.base,    gui = 'bold' } },
    command = { a = { fg = c.bg.base, bg = c.yellow.base,  gui = 'bold' } },
    terminal = { a = { fg = c.bg.base, bg = c.cyan.base,   gui = 'bold' } },
}

return nabla
