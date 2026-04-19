-- Highlight groups for the nabla colorscheme.
-- Uses vim.api.nvim_set_hl directly. Covers editor UI, diagnostics,
-- treesitter @-captures, LSP semantic tokens (@lsp.type.*),
-- legacy Vim syntax groups (fallback), and groups for currently-installed plugins.

local M = {}

---Translate an `fmt = "bold,italic,..."` string into the boolean keys
---that vim.api.nvim_set_hl expects.
---@param spec table
---@return table
local function normalize(spec)
    local out = {}
    for k, v in pairs(spec) do
        if k == "fmt" then
            if type(v) == "string" then
                for token in string.gmatch(v, "[^,]+") do
                    local key = token:match("^%s*(.-)%s*$")
                    if key == "bold" then out.bold = true
                    elseif key == "italic" then out.italic = true
                    elseif key == "underline" then out.underline = true
                    elseif key == "undercurl" then out.undercurl = true
                    elseif key == "strikethrough" then out.strikethrough = true
                    elseif key == "reverse" then out.reverse = true
                    elseif key == "standout" then out.standout = true
                    elseif key == "nocombine" then out.nocombine = true
                    -- "none" is ignored (means "no format")
                    end
                end
            end
        elseif k == "fg" or k == "bg" or k == "sp" then
            if v ~= nil and v ~= "none" then out[k] = v end
        else
            out[k] = v
        end
    end
    return out
end

---Apply a table of {group_name = spec} mappings.
---@param groups table
local function apply(groups)
    for name, spec in pairs(groups) do
        vim.api.nvim_set_hl(0, name, normalize(spec))
    end
end

function M.setup()
    local c = require('nabla').palette()
    local cfg = vim.g.nabla_config
    local util = require('nabla.util')

    local transparent_bg = cfg.transparent and c.none or c.bg.base
    local float_bg       = cfg.transparent and c.none or c.bg.soft
    local sign_bg        = cfg.transparent and c.none or c.bg.base

    ------------------------------------------------------------------
    -- Editor UI
    ------------------------------------------------------------------
    apply {
        Normal              = { fg = c.fg.base, bg = transparent_bg },
        NormalFloat         = { fg = c.fg.base, bg = float_bg },
        FloatBorder         = { fg = c.fg.muted, bg = float_bg },
        FloatTitle          = { fg = c.blue.light, bg = float_bg, fmt = "bold" },
        Terminal            = { fg = c.fg.base, bg = transparent_bg },
        EndOfBuffer         = { fg = cfg.ending_tildes and c.bg.muted or c.bg.base, bg = transparent_bg },
        FoldColumn          = { fg = c.fg.dim, bg = transparent_bg },
        Folded              = { fg = c.fg.muted, bg = c.bg.soft },
        SignColumn          = { fg = c.fg.base, bg = sign_bg },
        ToolbarLine         = { fg = c.fg.base },
        ToolbarButton       = { fg = c.bg.base, bg = c.blue.soft, fmt = "bold" },
        Cursor              = { fmt = "reverse" },
        vCursor             = { fmt = "reverse" },
        iCursor             = { fmt = "reverse" },
        lCursor             = { fmt = "reverse" },
        CursorIM            = { fmt = "reverse" },
        CursorColumn        = { bg = c.bg.soft },
        CursorLine          = { bg = c.bg.soft },
        ColorColumn         = { bg = c.bg.soft },
        CursorLineNr        = { fg = c.fg.base, fmt = "bold" },
        LineNr              = { fg = c.fg.dim },
        Conceal             = { fg = c.fg.muted, bg = c.bg.soft },
        Directory           = { fg = c.blue.light },
        ErrorMsg            = { fg = c.red.base, fmt = "bold" },
        WarningMsg          = { fg = c.orange.base, fmt = "bold" },
        MoreMsg             = { fg = c.cyan.pale, fmt = "bold" },
        MsgArea             = { fg = c.fg.base, bg = transparent_bg },
        Question            = { fg = c.yellow.base },
        IncSearch           = { fg = c.bg.base, bg = c.orange.base },
        Search              = { fg = c.bg.base, bg = c.yellow.base },
        Substitute          = { fg = c.bg.base, bg = c.green.base },
        MatchParen          = { fg = c.purple.hot, bg = c.bg.surface, fmt = "bold" },
        NonText             = { fg = c.fg.dim },
        Whitespace          = { fg = c.fg.dim },
        SpecialKey          = { fg = c.fg.dim },
        Pmenu               = { fg = c.fg.base, bg = c.bg.soft },
        PmenuSbar           = { bg = c.bg.soft },
        PmenuSel            = { fg = c.bg.base, bg = c.blue.soft },
        PmenuThumb          = { bg = c.fg.dim },
        WildMenu            = { fg = c.bg.base, bg = c.blue.base },
        StatusLine          = { fg = c.fg.base, bg = c.bg.muted },
        StatusLineTerm      = { fg = c.fg.base, bg = c.bg.muted },
        StatusLineNC        = { fg = c.fg.dim, bg = c.bg.soft },
        StatusLineTermNC    = { fg = c.fg.dim, bg = c.bg.soft },
        TabLine             = { fg = c.fg.base, bg = c.bg.soft },
        TabLineFill         = { fg = c.fg.dim, bg = c.bg.soft },
        TabLineSel          = { fg = c.bg.base, bg = c.fg.base },
        WinSeparator        = { fg = c.bg.surface },
        VertSplit           = { fg = c.bg.surface },
        Visual              = { bg = c.bg.surface },
        VisualNOS           = { bg = c.bg.muted, fmt = "underline" },
        QuickFixLine        = { fg = c.blue.base, fmt = "underline" },
        Debug               = { fg = c.yellow.base },
        debugPC             = { fg = c.bg.base, bg = c.cyan.teal },
        debugBreakpoint     = { fg = c.bg.base, bg = c.red.base },
        Title               = { fg = c.blue.light, fmt = "bold" },
        SpellBad            = { sp = c.red.base, fmt = "undercurl" },
        SpellCap            = { sp = c.yellow.base, fmt = "undercurl" },
        SpellLocal          = { sp = c.blue.base, fmt = "undercurl" },
        SpellRare           = { sp = c.purple.pink, fmt = "undercurl" },
    }

    ------------------------------------------------------------------
    -- Diff
    ------------------------------------------------------------------
    apply {
        DiffAdd             = { bg = c.diff.add },
        DiffChange          = { bg = c.diff.change },
        DiffDelete          = { bg = c.diff.delete },
        DiffText            = { bg = c.diff.text },
        DiffAdded           = { fg = c.green.base },
        DiffRemoved         = { fg = c.red.base },
        DiffChanged         = { fg = c.blue.base },
        DiffFile            = { fg = c.blue.darker },
        DiffIndexLine       = { fg = c.fg.dim },
    }

    ------------------------------------------------------------------
    -- Legacy Vim syntax groups (fallback when treesitter/LSP inactive)
    ------------------------------------------------------------------
    apply {
        String         = { fg = c.yellow.sand, fmt = cfg.code_style.strings },
        Character      = { fg = c.orange.warm },
        Number         = { fg = c.orange.base },
        Float          = { fg = c.orange.base },
        Boolean        = { fg = c.orange.deep },
        Type           = { fg = c.purple.light },
        Structure      = { fg = c.purple.light },
        StorageClass   = { fg = c.purple.hot, fmt = cfg.code_style.keywords },
        Identifier     = { fg = c.fg.base, fmt = cfg.code_style.variables },
        Constant       = { fg = c.orange.base },
        PreProc        = { fg = c.purple.pink },
        PreCondit      = { fg = c.purple.pink },
        Include        = { fg = c.green.light },
        Keyword        = { fg = c.purple.hot, fmt = cfg.code_style.keywords },
        Define         = { fg = c.purple.pink },
        Typedef        = { fg = c.purple.light },
        Exception      = { fg = c.purple.pink, fmt = cfg.code_style.keywords },
        Conditional    = { fg = c.purple.hot, fmt = cfg.code_style.keywords },
        Repeat         = { fg = c.purple.hot, fmt = cfg.code_style.keywords },
        Statement      = { fg = c.purple.hot, fmt = cfg.code_style.keywords },
        Macro          = { fg = c.blue.soft, fmt = cfg.code_style.functions },
        Error          = { fg = c.red.base },
        Label          = { fg = c.purple.pink },
        Special        = { fg = c.cyan.pale },
        SpecialChar    = { fg = c.cyan.base },
        Function       = { fg = c.blue.base, fmt = cfg.code_style.functions },
        Operator       = { fg = c.yellow.sand },
        Tag            = { fg = c.blue.soft },
        Delimiter      = { fg = c.fg.muted },
        Comment        = { fg = c.fg.muted, fmt = cfg.code_style.comments },
        SpecialComment = { fg = c.fg.muted, fmt = cfg.code_style.comments },
        Todo           = { fg = c.yellow.base, bg = c.bg.soft, fmt = "bold," .. cfg.code_style.comments },
        Underlined     = { fmt = "underline" },
    }

    ------------------------------------------------------------------
    -- Treesitter @-captures
    ------------------------------------------------------------------
    apply {
        -- Variables / identifiers
        ["@variable"]                 = { fg = c.fg.base, fmt = cfg.code_style.variables },
        ["@variable.builtin"]         = { fg = c.orange.deep, fmt = cfg.code_style.variables },
        ["@variable.parameter"]       = { fg = c.blue.light },
        ["@variable.member"]          = { fg = c.green.olive },
        ["@variable.global"]          = { fg = c.red.light },

        -- Constants
        ["@constant"]                 = { fg = c.orange.base },
        ["@constant.builtin"]         = { fg = c.orange.deep },
        ["@constant.macro"]           = { fg = c.orange.deep },

        -- Strings / characters
        ["@string"]                   = { fg = c.yellow.sand, fmt = cfg.code_style.strings },
        ["@string.regex"]             = { fg = c.cyan.base, fmt = cfg.code_style.strings },
        ["@string.escape"]            = { fg = c.cyan.light, fmt = cfg.code_style.strings },
        ["@string.special"]           = { fg = c.cyan.pale },
        ["@character"]                = { fg = c.orange.warm },
        ["@character.special"]        = { fg = c.cyan.base },

        -- Numbers / booleans
        ["@number"]                   = { fg = c.orange.base },
        ["@number.float"]             = { fg = c.orange.base },
        ["@boolean"]                  = { fg = c.orange.deep },

        -- Functions / constructors
        ["@function"]                 = { fg = c.blue.base, fmt = cfg.code_style.functions },
        ["@function.builtin"]         = { fg = c.blue.soft, fmt = cfg.code_style.functions },
        ["@function.call"]            = { fg = c.blue.base, fmt = cfg.code_style.functions },
        ["@function.method"]          = { fg = c.blue.light, fmt = cfg.code_style.functions },
        ["@function.method.call"]     = { fg = c.blue.light, fmt = cfg.code_style.functions },
        ["@function.macro"]           = { fg = c.blue.darker, fmt = cfg.code_style.functions },
        ["@constructor"]              = { fg = c.green.base, fmt = "bold" },

        -- Keywords
        ["@keyword"]                  = { fg = c.purple.hot, fmt = cfg.code_style.keywords },
        ["@keyword.function"]         = { fg = c.purple.neon, fmt = cfg.code_style.keywords },
        ["@keyword.operator"]         = { fg = c.purple.hot, fmt = cfg.code_style.keywords },
        ["@keyword.return"]           = { fg = c.purple.pink, fmt = cfg.code_style.keywords },
        ["@keyword.conditional"]      = { fg = c.purple.hot, fmt = cfg.code_style.keywords },
        ["@keyword.repeat"]           = { fg = c.purple.hot, fmt = cfg.code_style.keywords },
        ["@keyword.import"]           = { fg = c.green.light, fmt = cfg.code_style.keywords },
        ["@keyword.exception"]        = { fg = c.purple.pink, fmt = cfg.code_style.keywords },
        ["@keyword.modifier"]         = { fg = c.purple.hot, fmt = cfg.code_style.keywords },
        ["@keyword.coroutine"]        = { fg = c.purple.pink, fmt = cfg.code_style.keywords },

        -- Types
        ["@type"]                     = { fg = c.purple.light },
        ["@type.builtin"]             = { fg = c.purple.soft },
        ["@type.qualifier"]           = { fg = c.purple.hot, fmt = cfg.code_style.keywords },
        ["@attribute"]                = { fg = c.cyan.base },
        ["@property"]                 = { fg = c.green.olive },
        ["@field"]                    = { fg = c.green.olive },

        -- Operators / punctuation
        ["@operator"]                 = { fg = c.yellow.sand },
        ["@punctuation.delimiter"]    = { fg = c.fg.muted },
        ["@punctuation.bracket"]      = { fg = c.fg.muted },
        ["@punctuation.special"]      = { fg = c.cyan.pale },

        -- Comments
        ["@comment"]                  = { fg = c.fg.muted, fmt = cfg.code_style.comments },
        ["@comment.error"]            = { fg = c.red.base, bg = c.bg.soft, fmt = "bold" },
        ["@comment.warning"]          = { fg = c.orange.base, bg = c.bg.soft, fmt = "bold" },
        ["@comment.todo"]             = { fg = c.yellow.base, bg = c.bg.soft, fmt = "bold" },
        ["@comment.note"]             = { fg = c.cyan.base, bg = c.bg.soft, fmt = "bold" },

        -- Tags (HTML/JSX/etc.)
        ["@tag"]                      = { fg = c.blue.soft },
        ["@tag.attribute"]            = { fg = c.green.olive },
        ["@tag.delimiter"]            = { fg = c.fg.muted },

        -- Markup (Markdown, doc strings)
        ["@markup.heading.1"]         = { fg = c.blue.light, fmt = "bold" },
        ["@markup.heading.2"]         = { fg = c.purple.light, fmt = "bold" },
        ["@markup.heading.3"]         = { fg = c.green.base, fmt = "bold" },
        ["@markup.heading.4"]         = { fg = c.yellow.base, fmt = "bold" },
        ["@markup.heading.5"]         = { fg = c.orange.base, fmt = "bold" },
        ["@markup.heading.6"]         = { fg = c.red.light, fmt = "bold" },
        ["@markup.link"]              = { fg = c.blue.base, fmt = "underline" },
        ["@markup.link.label"]        = { fg = c.blue.light },
        ["@markup.link.url"]          = { fg = c.blue.deep, fmt = "underline" },
        ["@markup.list"]              = { fg = c.cyan.base },
        ["@markup.list.checked"]      = { fg = c.green.base },
        ["@markup.list.unchecked"]    = { fg = c.fg.muted },
        ["@markup.strong"]            = { fmt = "bold" },
        ["@markup.italic"]            = { fmt = "italic" },
        ["@markup.strikethrough"]     = { fmt = "strikethrough" },
        ["@markup.underline"]         = { fmt = "underline" },
        ["@markup.raw"]               = { fg = c.yellow.sand },
        ["@markup.raw.block"]         = { fg = c.yellow.sand, bg = c.bg.soft },
        ["@markup.quote"]             = { fg = c.fg.muted, fmt = "italic" },
        ["@markup.math"]              = { fg = c.purple.pink },
        ["@markup.environment"]       = { fg = c.purple.pink },

        -- Diff captures
        ["@diff.plus"]                = { fg = c.green.base, bg = c.diff.add },
        ["@diff.minus"]               = { fg = c.red.base,   bg = c.diff.delete },
        ["@diff.delta"]               = { fg = c.blue.base,  bg = c.diff.change },

        -- Namespaces / modules
        ["@module"]                   = { fg = c.green.light },
        ["@namespace"]                = { fg = c.green.light },
        ["@label"]                    = { fg = c.purple.pink },

        -- None / error
        ["@none"]                     = { fg = c.fg.base },
        ["@error"]                    = { fg = c.red.base },
    }

    ------------------------------------------------------------------
    -- LSP semantic tokens (refine treesitter where the server provides them)
    ------------------------------------------------------------------
    apply {
        ["@lsp.type.namespace"]                    = { fg = c.green.light },
        ["@lsp.type.type"]                         = { fg = c.purple.light },
        ["@lsp.type.class"]                        = { fg = c.purple.light },
        ["@lsp.type.enum"]                         = { fg = c.purple.soft },
        ["@lsp.type.interface"]                    = { fg = c.purple.soft },
        ["@lsp.type.struct"]                       = { fg = c.purple.light },
        ["@lsp.type.typeParameter"]                = { fg = c.purple.soft },
        ["@lsp.type.parameter"]                    = { fg = c.blue.light },
        ["@lsp.type.variable"]                     = { fg = c.fg.base, fmt = cfg.code_style.variables },
        ["@lsp.type.property"]                     = { fg = c.green.olive },
        ["@lsp.type.enumMember"]                   = { fg = c.orange.base },
        ["@lsp.type.function"]                     = { fg = c.blue.base, fmt = cfg.code_style.functions },
        ["@lsp.type.method"]                       = { fg = c.blue.light, fmt = cfg.code_style.functions },
        ["@lsp.type.macro"]                        = { fg = c.blue.darker, fmt = cfg.code_style.functions },
        ["@lsp.type.keyword"]                      = { fg = c.purple.hot, fmt = cfg.code_style.keywords },
        ["@lsp.type.modifier"]                     = { fg = c.purple.hot, fmt = cfg.code_style.keywords },
        ["@lsp.type.comment"]                      = { fg = c.fg.muted, fmt = cfg.code_style.comments },
        ["@lsp.type.string"]                       = { fg = c.yellow.sand, fmt = cfg.code_style.strings },
        ["@lsp.type.number"]                       = { fg = c.orange.base },
        ["@lsp.type.regexp"]                       = { fg = c.cyan.base },
        ["@lsp.type.operator"]                     = { fg = c.yellow.sand },
        ["@lsp.type.decorator"]                    = { fg = c.blue.darker },
        ["@lsp.type.builtinType"]                  = { fg = c.purple.soft },
        ["@lsp.type.selfKeyword"]                  = { fg = c.orange.deep, fmt = cfg.code_style.variables },
        ["@lsp.type.selfTypeKeyword"]              = { fg = c.purple.soft },

        ["@lsp.typemod.function.defaultLibrary"]   = { fg = c.blue.soft, fmt = cfg.code_style.functions },
        ["@lsp.typemod.method.defaultLibrary"]     = { fg = c.blue.soft, fmt = cfg.code_style.functions },
        ["@lsp.typemod.variable.defaultLibrary"]   = { fg = c.orange.deep, fmt = cfg.code_style.variables },
        ["@lsp.typemod.variable.readonly"]         = { fg = c.orange.base, fmt = cfg.code_style.variables },
        ["@lsp.typemod.variable.static"]           = { fg = c.orange.base, fmt = cfg.code_style.variables },
        ["@lsp.typemod.property.readonly"]         = { fg = c.orange.base },
        ["@lsp.typemod.keyword.async"]             = { fg = c.purple.pink, fmt = cfg.code_style.keywords },
        ["@lsp.typemod.operator.injected"]         = { fg = c.yellow.sand },
        ["@lsp.typemod.string.injected"]           = { fg = c.yellow.sand },
        ["@lsp.typemod.variable.injected"]         = { fg = c.fg.base },
    }

    ------------------------------------------------------------------
    -- Diagnostics
    ------------------------------------------------------------------
    local diag_error = c.red.base
    local diag_warn  = c.orange.base
    local diag_info  = c.blue.light
    local diag_hint  = c.cyan.base

    local function vt_bg(fg)
        if not cfg.diagnostics.background then return c.none end
        return util.darken(fg, 0.12, c.bg.base)
    end
    local underline_fmt = cfg.diagnostics.undercurl and "undercurl" or "underline"

    apply {
        DiagnosticError                = { fg = diag_error },
        DiagnosticWarn                 = { fg = diag_warn },
        DiagnosticInfo                 = { fg = diag_info },
        DiagnosticHint                 = { fg = diag_hint },
        DiagnosticOk                   = { fg = c.green.base },
        DiagnosticVirtualTextError     = { fg = diag_error, bg = vt_bg(diag_error) },
        DiagnosticVirtualTextWarn      = { fg = diag_warn,  bg = vt_bg(diag_warn)  },
        DiagnosticVirtualTextInfo      = { fg = diag_info,  bg = vt_bg(diag_info)  },
        DiagnosticVirtualTextHint      = { fg = diag_hint,  bg = vt_bg(diag_hint)  },
        DiagnosticUnderlineError       = { sp = diag_error, fmt = underline_fmt },
        DiagnosticUnderlineWarn        = { sp = diag_warn,  fmt = underline_fmt },
        DiagnosticUnderlineInfo        = { sp = diag_info,  fmt = underline_fmt },
        DiagnosticUnderlineHint        = { sp = diag_hint,  fmt = underline_fmt },
        DiagnosticSignError            = { fg = diag_error, bg = sign_bg },
        DiagnosticSignWarn             = { fg = diag_warn,  bg = sign_bg },
        DiagnosticSignInfo             = { fg = diag_info,  bg = sign_bg },
        DiagnosticSignHint             = { fg = diag_hint,  bg = sign_bg },
        DiagnosticFloatingError        = { fg = diag_error, bg = float_bg },
        DiagnosticFloatingWarn         = { fg = diag_warn,  bg = float_bg },
        DiagnosticFloatingInfo         = { fg = diag_info,  bg = float_bg },
        DiagnosticFloatingHint         = { fg = diag_hint,  bg = float_bg },
        DiagnosticDeprecated           = { fg = c.fg.dim, fmt = "strikethrough" },
        DiagnosticUnnecessary          = { fg = c.fg.dim, fmt = "italic" },

        LspReferenceText               = { bg = c.bg.muted },
        LspReferenceRead               = { bg = c.bg.muted },
        LspReferenceWrite              = { bg = c.bg.muted },
        LspCodeLens                    = { fg = c.fg.muted, fmt = cfg.code_style.comments },
        LspCodeLensSeparator           = { fg = c.fg.dim },
        LspInlayHint                   = { fg = c.fg.dim, bg = c.bg.soft, fmt = "italic" },
    }

    ------------------------------------------------------------------
    -- gitsigns
    ------------------------------------------------------------------
    apply {
        GitSignsAdd                    = { fg = c.green.base },
        GitSignsChange                 = { fg = c.blue.base },
        GitSignsDelete                 = { fg = c.red.base },
        GitSignsAddNr                  = { fg = c.green.base },
        GitSignsChangeNr               = { fg = c.blue.base },
        GitSignsDeleteNr               = { fg = c.red.base },
        GitSignsAddLn                  = { bg = c.diff.add },
        GitSignsChangeLn               = { bg = c.diff.change },
        GitSignsDeleteLn               = { bg = c.diff.delete },
        GitSignsCurrentLineBlame       = { fg = c.fg.dim, fmt = "italic" },
    }

    ------------------------------------------------------------------
    -- telescope
    ------------------------------------------------------------------
    apply {
        TelescopeBorder                = { fg = c.fg.muted, bg = float_bg },
        TelescopeNormal                = { fg = c.fg.base,  bg = float_bg },
        TelescopePromptBorder          = { fg = c.blue.base, bg = float_bg },
        TelescopePromptNormal          = { fg = c.fg.base,  bg = float_bg },
        TelescopePromptTitle           = { fg = c.bg.base,  bg = c.blue.base, fmt = "bold" },
        TelescopeResultsTitle          = { fg = c.bg.base,  bg = c.green.base, fmt = "bold" },
        TelescopePreviewTitle          = { fg = c.bg.base,  bg = c.purple.pink, fmt = "bold" },
        TelescopeSelection             = { fg = c.fg.base,  bg = c.bg.surface },
        TelescopeSelectionCaret        = { fg = c.blue.light, bg = c.bg.surface },
        TelescopeMatching              = { fg = c.yellow.base, fmt = "bold" },
        TelescopeMultiSelection        = { fg = c.purple.light, bg = c.bg.surface },
    }

    ------------------------------------------------------------------
    -- nvim-cmp
    ------------------------------------------------------------------
    apply {
        CmpItemAbbr                    = { fg = c.fg.base },
        CmpItemAbbrDeprecated          = { fg = c.fg.dim, fmt = "strikethrough" },
        CmpItemAbbrMatch               = { fg = c.blue.light, fmt = "bold" },
        CmpItemAbbrMatchFuzzy          = { fg = c.blue.light, fmt = "bold" },
        CmpItemMenu                    = { fg = c.fg.muted, fmt = "italic" },
        CmpItemKindDefault             = { fg = c.fg.muted },
        CmpItemKindText                = { fg = c.fg.base },
        CmpItemKindMethod              = { fg = c.blue.light },
        CmpItemKindFunction            = { fg = c.blue.base },
        CmpItemKindConstructor         = { fg = c.green.base },
        CmpItemKindField               = { fg = c.green.olive },
        CmpItemKindVariable            = { fg = c.fg.base },
        CmpItemKindClass               = { fg = c.purple.light },
        CmpItemKindInterface           = { fg = c.purple.soft },
        CmpItemKindModule              = { fg = c.green.light },
        CmpItemKindProperty            = { fg = c.green.olive },
        CmpItemKindUnit                = { fg = c.orange.base },
        CmpItemKindValue               = { fg = c.orange.base },
        CmpItemKindEnum                = { fg = c.purple.soft },
        CmpItemKindKeyword             = { fg = c.purple.hot },
        CmpItemKindSnippet             = { fg = c.yellow.base },
        CmpItemKindColor               = { fg = c.cyan.pale },
        CmpItemKindFile                = { fg = c.fg.base },
        CmpItemKindReference           = { fg = c.fg.muted },
        CmpItemKindFolder              = { fg = c.blue.soft },
        CmpItemKindEnumMember          = { fg = c.orange.base },
        CmpItemKindConstant            = { fg = c.orange.base },
        CmpItemKindStruct              = { fg = c.purple.light },
        CmpItemKindEvent               = { fg = c.red.light },
        CmpItemKindOperator            = { fg = c.yellow.sand },
        CmpItemKindTypeParameter       = { fg = c.purple.soft },
    }

    ------------------------------------------------------------------
    -- lazy.nvim UI
    ------------------------------------------------------------------
    apply {
        LazyNormal                     = { fg = c.fg.base,   bg = float_bg },
        LazyButton                     = { fg = c.fg.base,   bg = c.bg.muted },
        LazyButtonActive               = { fg = c.bg.base,   bg = c.blue.soft, fmt = "bold" },
        LazySpecial                    = { fg = c.blue.light },
        LazyH1                         = { fg = c.bg.base,   bg = c.blue.soft, fmt = "bold" },
        LazyH2                         = { fg = c.blue.light, fmt = "bold" },
        LazyProp                       = { fg = c.fg.muted },
        LazyComment                    = { fg = c.fg.muted,  fmt = cfg.code_style.comments },
        LazyReasonPlugin               = { fg = c.green.base },
        LazyReasonCmd                  = { fg = c.blue.base },
        LazyReasonEvent                = { fg = c.yellow.base },
        LazyReasonKeys                 = { fg = c.purple.light },
        LazyReasonFt                   = { fg = c.cyan.base },
    }

    ------------------------------------------------------------------
    -- mason.nvim UI
    ------------------------------------------------------------------
    apply {
        MasonNormal                    = { fg = c.fg.base, bg = float_bg },
        MasonHeader                    = { fg = c.bg.base, bg = c.blue.soft,  fmt = "bold" },
        MasonHeaderSecondary           = { fg = c.bg.base, bg = c.purple.light, fmt = "bold" },
        MasonHighlight                 = { fg = c.blue.light },
        MasonHighlightBlock            = { fg = c.bg.base, bg = c.blue.soft },
        MasonHighlightBlockBold        = { fg = c.bg.base, bg = c.blue.soft, fmt = "bold" },
        MasonMuted                     = { fg = c.fg.muted },
        MasonMutedBlock                = { fg = c.fg.muted, bg = c.bg.muted },
        MasonError                     = { fg = c.red.base },
    }

    ------------------------------------------------------------------
    -- fidget.nvim
    ------------------------------------------------------------------
    apply {
        FidgetTitle                    = { fg = c.blue.light, fmt = "bold" },
        FidgetTask                     = { fg = c.fg.muted },
    }

    ------------------------------------------------------------------
    -- User highlight overrides
    ------------------------------------------------------------------
    if cfg.highlights and next(cfg.highlights) then
        apply(cfg.highlights)
    end
end

return M
