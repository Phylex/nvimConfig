-- ANSI terminal colors for :terminal buffers.

local M = {}

function M.setup()
    local cfg = vim.g.nabla_config
    if not cfg.term_colors then return end

    local c = require('nabla').palette()

    vim.g.terminal_color_0  = c.bg.base     -- black
    vim.g.terminal_color_1  = c.red.base    -- red
    vim.g.terminal_color_2  = c.green.base  -- green
    vim.g.terminal_color_3  = c.yellow.base -- yellow
    vim.g.terminal_color_4  = c.blue.base   -- blue
    vim.g.terminal_color_5  = c.purple.base -- magenta
    vim.g.terminal_color_6  = c.cyan.base   -- cyan
    vim.g.terminal_color_7  = c.fg.base     -- white
    vim.g.terminal_color_8  = c.fg.dim      -- bright black
    vim.g.terminal_color_9  = c.red.light   -- bright red
    vim.g.terminal_color_10 = c.green.light -- bright green
    vim.g.terminal_color_11 = c.yellow.light -- bright yellow
    vim.g.terminal_color_12 = c.blue.light  -- bright blue
    vim.g.terminal_color_13 = c.purple.light -- bright magenta
    vim.g.terminal_color_14 = c.cyan.light  -- bright cyan
    vim.g.terminal_color_15 = c.fg.muted    -- bright white
end

return M
