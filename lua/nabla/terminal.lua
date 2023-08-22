-- Module to set the colors that corespond to the ansi terminal 

local M = {}
local cfg = vim.g.nabla_config
local c = require 'nabla.colors'

function M.setup()
    if not cfg.term_colors then return end
    vim.g.terminal_color_0 = c.bg0
    vim.g.terminal_color_1 = c.purple_8
    vim.g.terminal_color_2 = c.green_09
    vim.g.terminal_color_3 = c.yellow_3
    vim.g.terminal_color_4 = c.blue_09
    vim.g.terminal_color_5 = c.purple_11
    vim.g.terminal_color_6 = c.blue_13
    vim.g.terminal_color_7 = c.fg
    vim.g.terminal_color_8 = c.fg_3
    vim.g.terminal_color_9 = c.redpurple
    vim.g.terminal_color_10 = c.teal
    vim.g.terminal_color_11 = c.neonyellow2
    vim.g.terminal_color_12 = c.darkblue
    vim.g.terminal_color_13 = c.purple
    vim.g.terminal_color_14 = c.lightblue
    vim.g.terminal_color_15 = c.fg_4
end

return M
