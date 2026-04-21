local M = {}

local function tohex(n) return n and string.format("#%06x", n) or nil end

local function palette_index()
    local p = require('nabla').palette()
    local idx = {}
    for family, shades in pairs(p) do
        if type(shades) == "table" then
            for key, hex in pairs(shades) do
                if type(hex) == "string" and hex:match("^#%x%x%x%x%x%x$") then
                    local norm = hex:lower()
                    idx[norm] = idx[norm] or (family .. "." .. key)
                end
            end
        end
    end
    return idx
end

local function resolve(name)
    local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
    if not (hl.fg or hl.bg or hl.bold or hl.italic or hl.underline or hl.undercurl or hl.strikethrough) and hl.link then
        return vim.api.nvim_get_hl(0, { name = hl.link, link = false })
    end
    return hl
end

local function with_name(hex, idx)
    local name = idx[hex:lower()]
    return name and (hex .. " (" .. name .. ")") or hex
end

local function describe(hl, idx)
    local parts = {}
    local fg = tohex(hl.fg); if fg then table.insert(parts, "fg=" .. with_name(fg, idx)) end
    local bg = tohex(hl.bg); if bg then table.insert(parts, "bg=" .. with_name(bg, idx)) end
    for _, attr in ipairs({ "bold", "italic", "underline", "undercurl", "strikethrough", "reverse" }) do
        if hl[attr] then table.insert(parts, attr) end
    end
    return #parts > 0 and table.concat(parts, " ") or "(no style)"
end

function M.inspect()
    local info = vim.inspect_pos()
    local idx = palette_index()
    local chunks = {}
    local function emit(line)
        for _, c in ipairs(line) do table.insert(chunks, c) end
        table.insert(chunks, { "\n" })
    end

    local function section(title, items, get_group)
        if #items == 0 then return end
        emit({ { title, "Title" } })
        local seen = {}
        for _, item in ipairs(items) do
            local group = get_group(item)
            if group and not seen[group] then
                seen[group] = true
                emit({
                    { "  ██  ", group },
                    { string.format("%-42s", group), "Normal" },
                    { describe(resolve(group), idx), "Comment" },
                })
            end
        end
    end

    section("Treesitter",          info.treesitter,      function(t) return t.hl_group_link end)
    section("LSP semantic tokens", info.semantic_tokens, function(t) return t.opts.hl_group_link end)
    section("Syntax",              info.syntax,          function(t) return t.hl_group_link end)

    if #chunks == 0 then
        vim.api.nvim_echo({ { "No highlight groups at cursor", "WarningMsg" } }, false, {})
    else
        vim.api.nvim_echo(chunks, true, {})
    end
end

vim.api.nvim_create_user_command("ColorInspect", M.inspect,
    { desc = "Show highlight groups + resolved colors under cursor" })

-- Short form: expand `:ci<CR>` to `:ColorInspect`. Only when the entire
-- command line is exactly "ci", so `:s/ci/...` etc. are unaffected.
vim.cmd([[cnoreabbrev <expr> ci (getcmdtype() == ':' && getcmdline() == 'ci') ? 'ColorInspect' : 'ci']])

return M
