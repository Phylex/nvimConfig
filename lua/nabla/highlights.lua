-- This file defines the highlights for different languages and environments
-- It uses the colors from the colors file (this is the one that defines the
-- colors used in the colorscheme and this file says how the colors are
-- applied in the various situations

local c = require('nabla.colors')
local cfg = vim.g.nabla_config
local util = require("nabla.util")

print(c)

local M = {}
--- Dictionary containing the highlighting rules for the different
--- Languages
local hl = {langs = {}, plugins = {}}

local function vim_highlights(highlights)
    for group_name, group_settings in pairs(highlights) do
        vim.api.nvim_command(string.format("highlight %s guifg=%s guibg=%s guisp=%s gui=%s", group_name,
            group_settings.fg or "none",
            group_settings.bg or "none",
            group_settings.sp or "none",
            group_settings.fmt or "none"))
    end
end


hl.common = {
    Normal =                    {fg = c.fg, bg = cfg.transparent and c.none or c.bg0},
    Terminal =                  {fg = c.fg, bg = cfg.transparent and c.none or c.bg0},
    EndOfBuffer =               {fg = cfg.ending_tildes and c.bg2 or c.bg0, bg = cfg.transparent and c.none or c.bg0},
    FoldColumn =                {fg = c.fg, bg = cfg.transparent and c.none or c.bg1},
    Folded =                    {fg = c.fg, bg = cfg.transparent and c.none or c.bg1},
    SignColumn =                {fg = c.fg, bg = cfg.transparent and c.none or c.bg0},
    ToolbarLine =               {fg = c.fg},
    Cursor =                    {fmt = "reverse"},
    vCursor =                   {fmt = "reverse"},
    iCursor =                   {fmt = "reverse"},
    lCursor =                   {fmt = "reverse"},
    CursorIM =                  {fmt = "reverse"},
    CursorColumn =              {bg = c.bg1},
    CursorLine =                {bg = c.bg1},
    ColorColumn =               {bg = c.bg1},
    Comment =                   {fg = c.fg_2},
    CursorLineNr =              {fg = c.fg},
    LineNr =                    {fg = c.fg_4},
    Conceal =                   {fg = c.fg, bg = c.bg1},
    DiffAdd =                   {fg = c.none, bg = c.diff_add},
    DiffChange =                {fg = c.none, bg = c.diff_change},
    DiffDelete =                {fg = c.none, bg = c.diff_delete},
    DiffText =                  {fg = c.none, bg= c.diff_text},
    DiffAdded =                 {fg = c.blue_green_6},
    DiffRemoved =               {fg = c.purple_6},
    DiffFile =                  {fg = c.blue_06},
    DiffIndexLine =             {fg = c.grey},
    Directory =                 {fg = c.blue_01},
    ErrorMsg =                  {fg = c.purple_8, fmt = "bold"},
    WarningMsg =                {fg = c.yellow_6, fmt = "bold"},
    MoreMsg =                   {fg = c.seaside_1, fmt = "bold"},
    IncSearch =                 {fg = c.bg0, bg = c.orange},
    Search =                    {fg = c.bg0, bg = c.bg_yellow},
    Substitute =                {fg = c.bg0, bg = c.green},
    MatchParen =                {fg = c.purple_7, bg = c.grey},
    NonText =                   {fg = c.grey},
    Whitespace =                {fg = c.grey},
    SpecialKey =                {fg = c.grey},
    Pmenu =                     {fg = c.fg, bg = c.bg1},
    PmenuSbar =                 {fg = c.none, bg = c.bg1},
    PmenuSel =                  {fg = c.bg0, bg = c.bg_blue},
    WildMenu =                  {fg = c.bg0, bg = c.blue},
    PmenuThumb =                {fg = c.none, bg = c.grey},
    Question =                  {fg = c.yellow_1},
    SpellBad =                  {fg = c.purple_6, fmt = "underline", sp = c.red},
    SpellCap =                  {fg = c.yellow_1, fmt = "underline", sp = c.yellow},
    SpellLocal =                {fg = c.blue_09, fmt = "underline", sp = c.blue},
    SpellRare =                 {fg = c.purple_9, fmt = "underline", sp = c.purple},
    StatusLine =                {fg = c.fg, bg = c.bg2},
    StatusLineTerm =            {fg = c.fg, bg = c.bg2},
    StatusLineNC =              {fg = c.grey, bg = c.bg1},
    StatusLineTermNC =          {fg = c.grey, bg = c.bg1},
    TabLine =                   {fg = c.fg, bg = c.bg1},
    TabLineFill =               {fg = c.grey, bg = c.bg1},
    TabLineSel =                {fg = c.bg0, bg = c.fg},
    VertSplit =                 {fg = c.fg},
    Visual =                    {bg = c.bg3},
    VisualNOS =                 {fg = c.none, bg = c.bg2, fmt = "underline"},
    QuickFixLine =              {fg = c.blue_09, fmt = "underline"},
    Debug =                     {fg = c.yellow_1},
    debugPC =                   {fg = c.bg0, bg = c.teal},
    debugBreakpoint =           {fg = c.bg0, bg = c.red},
    ToolbarButton =             {fg = c.bg0, bg = c.bg_blue},
    FloatBorder =               {fg = c.fg, bg = c.bg1},
    NormalFloat =               {fg = c.fg, bg = c.bg1},
}

hl.syntax = {
    String =                            {fg = c.fg_5, fmt = cfg.code_style.strings},
    Character =                         {fg = c.blue_04},
    Number =                            {fg = c.yellow_6},
    Float =                             {fg = c.yellow_5},
    Boolean =                           {fg = c.yellow_4},
    Type =                              {fg = c.blue_16},
    Structure =                         {fg = c.green_01},
    StorageClass =                      {fg = c.fg},
    Identifier =                        {fg = c.fg, fmt = cfg.code_style.variables},
    Constant =                          {fg = c.fg},
    PreProc =                           {fg = c.fg},
    PreCondit =                         {fg = c.fg},
    Include =                           {fg = c.green_02},
    Keyword =                           {fg = c.fg, fmt = cfg.code_style.keywords},
    Define =                            {fg = c.fg},
    Typedef =                           {fg = c.fg},
    Exception =                         {fg = c.fg},
    Conditional =                       {fg = c.fg, fmt = cfg.code_style.keywords},
    Repeat =                            {fg = c.fg, fmt = cfg.code_style.keywords},
    Statement =                         {fg = c.fg},
    Macro =                             {fg = c.fg},
    Error =                             {fg = c.fg},
    Label =                             {fg = c.fg},
    Special =                           {fg = c.fg},
    SpecialChar =                       {fg = c.fg},
    Function =                          {fg = c.blue_08, fmt = cfg.code_style.functions},
    Operator =                          {fg = c.fg},
    Title =                             {fg = c.fg},
    Tag =                               {fg = c.fg},
    Delimiter =                         {fg = c.fg},
    Comment =                           {fg = c.fg_2, fmt = cfg.code_style.comments},
    SpecialComment =                    {fg = c.fg, fmt = cfg.code_style.comments},
    Todo =                              {fg = c.fg, fmt = cfg.code_style.comments}
}

-- This is the section where the treesitter and the lsp tokens
-- are highlighted. This is guarded by the relevant api checks
if vim.api.nvim_call_function("has", { "nvim-0.8" }) == 1 then
    hl.treesitter = {
        -- highlights for specific data types 
        ["@variable"] =                 {fg = c.blue_18},
        ["@variable.builtin"] =         {fg = c.tropical_beach_1},
        ["@label"] =                    {fg = c.fg},
        ["@macro"] =                    {fg = c.fg},
        ["@annotation"] =               {fg = c.fg},
        ["@constant"] =                 {fg = c.yellow_3},
        ["@constant.builtin"] =         {fg = c.yellow_2},
        ["@constant.macro"] =           {fg = c.yellow_1},
        ["@comment"] =                  hl.syntax.Comment,
        ["@constructor"] =              {fg = c.green_10, fmt = "bold"},
        ["@error"] =                    {fg = c.fg},
        ["@exception"] =                {fg = c.purple_6},
        ["@storageclass"] =             {fg = c.purple_12},
        ["@type.builtin"] =             {fg = c.green_11},
        ["@operator"] =                 {fg = c.seaside_4},
        ["@property"] =                 {fg = c.fg},
        
        -- builtin type highlights
        ["@type"] =                     hl.syntax.Type,
        ["@string"] =                   hl.syntax.String,
        ["@field"] =                    {fg = c.green_04},
        ["@string.regex"] =             {fg = c.fg, fmt = cfg.code_style.strings},
        ["@string.escape"] =            {fg = c.fg, fmt = cfg.code_style.strings},
        ["@attribute"] =                {fg = c.blue_13},
        ["@boolean"] =                  hl.syntax.Boolean,
        ["@number"] =                   hl.syntax.Number,
        ["@float"] =                    hl.syntax.Float,
        ["@character"] =                hl.syntax.Chatacter,
        ["@none"] =                     {fg = c.fg},

        -- colors for functions
        ["@decorator"] =                {fg = c.blue_05},
        ["@function"] =                 hl.syntax.Function,
        ["@function.builtin"] =         {fg = c.blue_04, fmt = cfg.code_style.functions},
        ["@function.macro"] =           {fg = c.blue_02, fmt = cfg.code_style.functions},
        ["@method"] =                   {fg = c.blue_11},
        ["@parameter"] =                {fg = c.blue_01},
        ["@parameter.reference"] =      {fg = c.fg},

        -- colors for keywords
        ["@repeat"] =                   {fg = c.purple_12, fmt = cfg.code_style.keywords},
        ["@keyword"] =                  {fg = c.purple_9, fmt = cfg.code_style.keywords},
        ["@conditional"] =              {fg = c.purple_12,   fmt = cfg.code_style.keywords},
        ["@keyword.function"] =         {fg = c.purple_11, fmt = cfg.code_style.functions},
        ["@keyword.operator"] =         {fg = c.fg, fmt = cfg.code_style.keywords},
        
        -- colors for namespace related 
        ["@include"] =                  hl.syntax.Include,
        ["@namespace"] =                {fg = c.green_04},
        ["@symbol"] =                   {fg = c.fg},
        
        -- tag related stuff
        ["@tag"] =                      {fg = c.fg},
        ["@tag.delimiter"] =            {fg = c.fg},
        
        -- punctuation related stuff
        ["@punctuation.delimiter"] =    {fg = c.fg},
        ["@punctuation.bracket"] =      {fg = c.fg},
        ["@punctuation.special"] =      {fg = c.seaside_3},

        -- text based highlights
        ["@text"] =                     {fg = c.fg},
        ["@text.strong"] =              {fg = c.blue_01, fmt = 'bold'},
        ["@text.emphasis"] =            {fg = c.blue_17, fmt = 'italic'},
        ["@text.underline"] =           {fg = c.green_10, fmt = 'underline'},
        ["@text.strike"] =              {fg = c.purple_8, fmt = 'strikethrough'},
        ["@text.title"] =               {fg = c.blue_12, fmt = 'bold'},
        ["@text.literal"] =             {fg = c.yellow_6},
        ["@text.uri"] =                 {fg = c.blue_04, fmt = 'underline'},
        ["@text.todo"] =                {fg = c.yellow_1, fmt = cfg.code_style.comments},
        ["@text.math"] =                {fg = c.purple_9},
        ["@text.reference"] =           {fg = c.fg},
        ["@text.enviroment"] =          {fg = c.fg},
        ["@text.enviroment.name"] =     {fg = c.fg},
        ["@note"] =                     {fg = c.blue_12},
        ["@warning"] =                  {fg = c.yellow_6},
        ["@danger"] =                   {fg = c.purple_08},
    }
    if vim.api.nvim_call_function("has", { "nvim-0.9" }) == 1 then
        hl.lsp = {
            ["@lsp.type.generic"] =                             hl.treesitter["@text"],
            ["@lsp.typemod.generic"] =                          hl.treesitter["@text"],
            ["@lsp.typemod.generic.attribute"] =                {fg = c.blue_13},
            ["@lsp.typemod.attributeBracket"] =                 {fg = c.seaside_3},
            
            ["@lsp.type.type"] =                                hl.treesitter["@type"],
            ["@lsp.type.typeParameter"] =                       hl.treesitter["@type"],

            ["@lsp.type.enum"] =                                hl.treesitter["@type"],
            ["@lsp.typemod.enum"] =                             hl.treesitter["@type"],

            ["@lsp.type.enumMember"] =                          {fg = c.blue_14},
            ["@lsp.typemod.enumMember"] =                       {fg = c.blue_14},

            ["@lsp.type.struct"] =                              hl.syntax.Structure,
            ["@lsp.typemod.struct"] =                           hl.syntax.Structure,

            ["@lsp.type.property"] =                            hl.treesitter["@field"],
            ["@lsp.typemod.property"] =                         hl.treesitter["@field"],
            ["@lsp.typemod.property.declaration"] =             {fg = c.green_07},

            -- Function highlights
            ["@lsp.type.function"] =                            hl.treesitter["@function"],
            ["@lsp.typemod.function.defaultLibrary"] =          hl.treesitter["@function"],

            ["@lsp.type.method"] =                              hl.treesitter["@method"],
            ["@lsp.typemod.method"] =                           hl.treesitter["@method"],
            ["@lsp.typemod.method.defaultLibrary"] =            hl.treesitter["@function"],
            
            ["@lsp.type.decorator"] =                           hl.treesitter["@decorator"],
            ["@lsp.typemod.decorator"] =                        hl.treesitter["@decorator"],
            
            ["@lsp.type.interface"] =                           {fg = c.blue_02},
            ["@lsp.typemod.interface"] =                        {fg = c.blue_02},
            
            ["@lsp.type.macro"] =                               hl.treesitter["@function.macro"],
            ["@lsp.typemod.macro"] =                            hl.treesitter["@function.macro"],

            ["@lsp.type.parameter"] =                           hl.treesitter["@parameter"],
            ["@lsp.typemod.parameter"] =                        hl.treesitter["@parameter"],

            ["@lsp.type.namespace"] =                           hl.treesitter["@namespace"],
            ["@lsp.typemod.namespace"] =                        hl.treesitter["@namespace"],
            ["@lsp.typemod.namespace.defaultLibrary"] =         {fg = c.green_03},
            
            ["@lsp.type.class"] =                               {fg = c.green_07},
            ["@lsp.type.comment"] =                             hl.treesitter["@comment"],
            ["@lsp.type.keyword"] =                             hl.treesitter["@keyword"],
            ["@lsp.type.selfKeyword"] =                         hl.treesitter["@variable.builtin"],
            ["@lsp.typemod.selfKeyword"] =                      hl.treesitter["@variable.builtin"],
            ["@lsp.type.number"] =                              hl.treesitter["@number"],
            ["@lsp.type.property"] =                            hl.treesitter["@property"],
            ["@lsp.type.variable"] =                            hl.treesitter["@variable"],
            ["@lsp.typemod.derive"] =                           {fg = c.blue_02},
            
            ["@lsp.typemod.operator.injected"] =                hl.treesitter["@operator"],
            ["@lsp.typemod.string.injected"] =                  hl.treesitter["@string"],
            ["@lsp.typemod.variable.defaultLibrary"] =          hl.treesitter["@variable.builtin"],
            ["@lsp.typemod.variable.injected"] =                hl.treesitter["@variable"],
            ["@lsp.type.builtinType"] =                         hl.treesitter["@type.builtin"],
        }
    end
else
    hl.treesitter = {
        TSAnnotation =              {fg = c.fg},
        TSAttribute =               {fg = c.fg},
        TSBoolean =                 {fg = c.fg},
        TSCharacter =               {fg = c.fg},
        TSComment =                 {fg = c.fg, fmt = cfg.code_style.comments},
        TSConditional =             {fg = c.fg, fmt = cfg.code_style.keywords},
        TSConstant =                {fg = c.fg},
        TSConstBuiltin =            {fg = c.fg},
        TSConstMacro =              {fg = c.fg},
        TSConstructor =             {fg = c.fg, fmt = "bold"},
        TSError =                   {fg = c.fg},
        TSException =               {fg = c.fg},
        TSField =                   {fg = c.fg},
        TSFloat =                   {fg = c.fg},
        TSFunction =                {fg = c.fg, fmt = cfg.code_style.functions},
        TSFuncBuiltin =             {fg = c.fg, fmt = cfg.code_style.functions},
        TSFuncMacro =               {fg = c.fg, fmt = cfg.code_style.functions},
        TSInclude =                 {fg = c.fg},
        TSKeyword =                 {fg = c.fg, fmt = cfg.code_style.keywords},
        TSKeywordFunction =         {fg = c.fg, fmt = cfg.code_style.functions},
        TSKeywordOperator =         {fg = c.fg, fmt = cfg.code_style.keywords},
        TSLabel =                   {fg = c.fg},
        TSMethod =                  {fg = c.fg},
        TSNamespace =               {fg = c.fg},
        TSNone =                    {fg = c.fg},
        TSNumber =                  {fg = c.fg},
        TSOperator =                {fg = c.fg},
        TSParameter =               {fg = c.fg},
        TSParameterReference =      {fg = c.fg},
        TSProperty =                {fg = c.fg},
        TSPunctDelimiter =          {fg = c.fg},
        TSPunctBracket =            {fg = c.fg},
        TSPunctSpecial =            {fg = c.fg},
        TSRepeat =                  {fg = c.fg, fmt = cfg.code_style.keywords},
        TSString =                  {fg = c.fg, fmt = cfg.code_style.strings},
        TSStringRegex =             {fg = c.fg, fmt = cfg.code_style.strings},
        TSStringEscape =            {fg = c.fg, fmt = cfg.code_style.strings},
        TSSymbol =                  {fg = c.fg},
        TSTag =                     {fg = c.fg},
        TSTagDelimiter =            {fg = c.fg},
        TSText =                    {fg = c.fg},
        TSStrong =                  {fg = c.fg, fmt = 'bold'},
        TSEmphasis =                {fg = c.fg, fmt = 'italic'},
        TSUnderline =               {fg = c.fg, fmt = 'underline'},
        TSStrike =                  {fg = c.fg, fmt = 'strikethrough'},
        TSTitle =                   {fg = c.fg, fmt = 'bold'},
        TSLiteral =                 {fg = c.fg},
        TSURI =                     {fg = c.fg, fmt = 'underline'},
        TSMath =                    {fg = c.fg},
        TSTextReference =           {fg = c.fg},
        TSEnviroment =              {fg = c.fg},
        TSEnviromentName =          {fg = c.fg},
        TSNote =                    {fg = c.fg},
        TSWarning =                 {fg = c.fg},
        TSDanger =                  {fg = c.fg},
        TSType =                    {fg = c.fg},
        TSTypeBuiltin =             {fg = c.fg},
        TSVariable =                {fg = c.fg, fmt = cfg.code_style.variables},
        TSVariableBuiltin =         {fg = c.fg, fmt = cfg.code_style.variables},
    }
end



local diagnostics_error_color = cfg.diagnostics.darker and c.fg or c.fg
local diagnostics_hint_color =  cfg.diagnostics.darker and c.fg or c.fg
local diagnostics_warn_color =  cfg.diagnostics.darker and c.fg or c.fg
local diagnostics_info_color =  cfg.diagnostics.darker and c.fg or c.fg
hl.plugins.lsp = {
    LspCxxHlGroupEnumConstant =     {fg = c.fg},
    LspCxxHlGroupMemberVariable =   {fg = c.fg},
    LspCxxHlGroupNamespace =        {fg = c.fg},
    LspCxxHlSkippedRegion =         {fg = c.fg},
    LspCxxHlSkippedRegionBeginEnd = {fg = c.fg},
    DiagnosticError =               {fg = c.purple_4},
    DiagnosticHint =                {fg = c.bg_4},
    DiagnosticInfo =                {fg = c.fg},
    DiagnosticWarn =                {fg = c.fg},
    DiagnosticVirtualTextError =    { bg = cfg.diagnostics.background and util.darken(diagnostics_error_color, 0.1, c.bg0) or c.none, fg = diagnostics_error_color },
    DiagnosticVirtualTextWarn =     { bg = cfg.diagnostics.background and util.darken(diagnostics_warn_color, 0.1, c.bg0) or c.none, fg = diagnostics_warn_color },
    DiagnosticVirtualTextInfo =     { bg = cfg.diagnostics.background and util.darken(diagnostics_info_color, 0.1, c.bg0) or c.none, fg = diagnostics_info_color },
    DiagnosticVirtualTextHint =     { bg = cfg.diagnostics.background and util.darken(diagnostics_hint_color, 0.1, c.bg0) or c.none, fg = diagnostics_hint_color },
    DiagnosticUnderlineError =      {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.fg},
    DiagnosticUnderlineHint =       {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.fg},
    DiagnosticUnderlineInfo =       {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.fg},
    DiagnosticUnderlineWarn =       {fmt = cfg.diagnostics.undercurl and "undercurl" or "underline", sp = c.fg},
    LspReferenceText =              { bg = c.bg2 },
    LspReferenceWrite =             { bg = c.bg2 },
    LspReferenceRead =              { bg = c.bg2 },
    LspCodeLens =                   { fg = c.fg, fmt = cfg.code_style.comments },
    LspCodeLensSeparator =          { fg = c.fg },
}

hl.plugins.lsp.LspDiagnosticsDefaultError = hl.plugins.lsp.DiagnosticError
hl.plugins.lsp.LspDiagnosticsDefaultHint = hl.plugins.lsp.DiagnosticHint
hl.plugins.lsp.LspDiagnosticsDefaultInformation = hl.plugins.lsp.DiagnosticInfo
hl.plugins.lsp.LspDiagnosticsDefaultWarning = hl.plugins.lsp.DiagnosticWarn
hl.plugins.lsp.LspDiagnosticsUnderlineError = hl.plugins.lsp.DiagnosticUnderlineError
hl.plugins.lsp.LspDiagnosticsUnderlineHint = hl.plugins.lsp.DiagnosticUnderlineHint
hl.plugins.lsp.LspDiagnosticsUnderlineInformation = hl.plugins.lsp.DiagnosticUnderlineInfo
hl.plugins.lsp.LspDiagnosticsUnderlineWarning = hl.plugins.lsp.DiagnosticUnderlineWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextError = hl.plugins.lsp.DiagnosticVirtualTextError
hl.plugins.lsp.LspDiagnosticsVirtualTextWarning = hl.plugins.lsp.DiagnosticVirtualTextWarn
hl.plugins.lsp.LspDiagnosticsVirtualTextInformation = hl.plugins.lsp.DiagnosticVirtualTextInfo
hl.plugins.lsp.LspDiagnosticsVirtualTextHint = hl.plugins.lsp.DiagnosticVirtualTextHint

hl.plugins.ale = {
    ALEErrorSign = hl.plugins.lsp.DiagnosticError,
    ALEInfoSign = hl.plugins.lsp.DiagnosticInfo,
    ALEWarningSign = hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.barbar = {
    BufferCurrent =                 { fmt = "bold" },
    BufferCurrentMod =              { fg = c.fg, fmt = "bold,italic" },
    BufferCurrentSign =             { fg = c.fg },
    BufferInactiveMod =             { fg = c.fg, bg = c.bg1, fmt = "italic" },
    BufferVisible =                 { fg = c.fg, bg = c.bg0 },
    BufferVisibleMod =              { fg = c.fg, bg = c.bg0, fmt = "italic" },
    BufferVisibleIndex =            { fg = c.fg, bg = c.bg0 },
    BufferVisibleSign =             { fg = c.fg, bg = c.bg0 },
    BufferVisibleTarget =           { fg = c.fg, bg = c.bg0 },
}

hl.plugins.cmp = {
    CmpItemAbbr =                   {fg = c.fg},
    CmpItemAbbrDeprecated =         {fg = c.fg, fmt = "strikethrough" },
    CmpItemAbbrMatch =              {fg = c.fg},
    CmpItemAbbrMatchFuzzy =         {fg = c.fg, fmt = "underline" },
    CmpItemMenu =                   {fg = c.fg},
    CmpItemKind =                   {fg = c.fg, fmt = cfg.cmp_itemkind_reverse and "reverse" },
}

hl.plugins.coc = {
    CocErrorSign =                  hl.plugins.lsp.DiagnosticError,
    CocHintSign =                   hl.plugins.lsp.DiagnosticHint,
    CocInfoSign =                   hl.plugins.lsp.DiagnosticInfo,
    CocWarningSign =                hl.plugins.lsp.DiagnosticWarn,
}

hl.plugins.whichkey = {
    WhichKey =                      {fg = c.fg},
    WhichKeyDesc =                  {fg = c.fg},
    WhichKeyGroup =                 {fg = c.fg},
    WhichKeySeperator =             {fg = c.fg},
}

hl.plugins.gitgutter = {
    GitGutterAdd =                  {fg = c.fg},
    GitGutterChange =               {fg = c.fg},
    GitGutterDelete =               {fg = c.fg},
}

hl.plugins.hop = {
    HopNextKey =                    {fg = c.fg, fmt = "bold"},
    HopNextKey1 =                   {fg = c.fg, fmt = "bold"},
    HopNextKey2 =                   {fg = util.darken(c.fg, 0.7)},
    HopUnmatched =                  {fg = c.fg},
}

-- comment
hl.plugins.diffview = {
    DiffviewFilePanelTitle =        {fg = c.fg, fmt = "bold"},
    DiffviewFilePanelCounter =      {fg = c.fg, fmt = "bold"},
    DiffviewFilePanelFileName =     {fg = c.fg},
    DiffviewNormal =                hl.common.Normal,
    DiffviewCursorLine =            hl.common.CursorLine,
    DiffviewVertSplit =             hl.common.VertSplit,
    DiffviewSignColumn =            hl.common.SignColumn,
    DiffviewStatusLine =            hl.common.StatusLine,
    DiffviewStatusLineNC =          hl.common.StatusLineNC,
    DiffviewEndOfBuffer =           hl.common.EndOfBuffer,
    DiffviewFilePanelRootPath =     {fg = c.fg},
    DiffviewFilePanelPath =         {fg = c.fg},
    DiffviewFilePanelInsertions =   {fg = c.fg},
    DiffviewFilePanelDeletions =    {fg = c.fg},
    DiffviewStatusAdded =           {fg = c.fg},
    DiffviewStatusUntracked =       {fg = c.fg},
    DiffviewStatusModified =        {fg = c.fg},
    DiffviewStatusRenamed =         {fg = c.fg},
    DiffviewStatusCopied =          {fg = c.fg},
    DiffviewStatusTypeChange =      {fg = c.fg},
    DiffviewStatusUnmerged =        {fg = c.fg},
    DiffviewStatusUnknown =         {fg = c.fg},
    DiffviewStatusDeleted =         {fg = c.fg},
    DiffviewStatusBroken =          {fg = c.fg},
}

hl.plugins.gitsigns = {
    GitSignsAdd =                   {fg = c.fg},
    GitSignsAddLn =                 {fg = c.fg},
    GitSignsAddNr =                 {fg = c.fg},
    GitSignsChange =                {fg = c.fg},
    GitSignsChangeLn =              {fg = c.fg},
    GitSignsChangeNr =              {fg = c.fg},
    GitSignsDelete =                {fg = c.fg},
    GitSignsDeleteLn =              {fg = c.fg},
    GitSignsDeleteNr =              {fg = c.fg},
}

hl.plugins.neo_tree = {
    NeoTreeNormal =                 {fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NeoTreeNormalNC =               {fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NeoTreeVertSplit =              {fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
    NeoTreeWinSeparator =           {fg = c.bg1, bg = cfg.transparent and c.none or c.bg1 },
    NeoTreeEndOfBuffer =            {fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
    NeoTreeRootName =               {fg = c.fg, fmt = "bold" },
    NeoTreeGitAdded =               {fg = c.fg},
    NeoTreeGitDeleted =             {fg = c.fg},
    NeoTreeGitModified =            {fg = c.fg},
    NeoTreeGitConflict =            {fg = c.fg, fmt = "bold,italic" },
    NeoTreeGitUntracked =           {fg = c.fg, fmt = "italic" },
    NeoTreeIndentMarker =           {fg = c.fg},
    NeoTreeSymbolicLinkTarget =     {fg = c.fg},
}

hl.plugins.neotest = {
    NeotestAdapterName =        { fg = c.fg, fmt = "bold" },
    NeotestDir =                {fg = c.fg},
    NeotestExpandMarker =       {fg = c.fg},
    NeotestFailed =             {fg = c.fg},
    NeotestFile =               {fg = c.fg},
    NeotestFocused =            {fmt = "bold,italic" },
    NeotestIndent =             {fg = c.fg},
    NeotestMarked =             {fg = c.orange, fmt = "bold" },
    NeotestNamespace =          {fg = c.fg},
    NeotestPassed =             {fg = c.fg},
    NeotestRunning =            {fg = c.fg},
    NeotestWinSelect =          {fg = c.fg, fmt = "bold" },
    NeotestSkipped =            {fg = c.fg},
    NeotestTarget =             {fg = c.fg},
    NeotestTest =               {fg = c.fg},
    NeotestUnknown =            {fg = c.fg},
}

hl.plugins.nvim_tree = {
    NvimTreeNormal =            {fg = c.fg, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeVertSplit =         {fg = c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeEndOfBuffer =       {fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
    NvimTreeRootFolder =        {fg = c.fg, fmt = "bold" },
    NvimTreeGitDirty =          {fg = c.fg},
    NvimTreeGitNew =            {fg = c.fg},
    NvimTreeGitDeleted =        {fg = c.fg},
    NvimTreeSpecialFile =       {fg = c.fg, fmt = "underline" },
    NvimTreeIndentMarker =      {fg = c.fg},
    NvimTreeImageFile =         {fg = c.fg },
    NvimTreeSymlink =           {fg = c.fg},
    NvimTreeFolderName =        {fg = c.fg},
}
hl.plugins.telescope = {
    TelescopeBorder =           {fg = c.blue_02},
    TelescopePromptBorder =     {fg = c.blue_13},
    TelescopeResultsBorder =    {fg = c.blue_10},
    TelescopePreviewBorder =    {fg = c.green_10},
    TelescopeMatching =         {fg = c.purple_7, fmt = "bold" },
    TelescopePromptPrefix =     {fg = c.fg},
    TelescopeSelection =        {bg = c.bg2},
    TelescopeSelectionCaret =   {fg = c.purple_8},
}

hl.plugins.dashboard = {
    DashboardShortCut =         {fg = c.fg},
    DashboardHeader =           {fg = c.fg},
    DashboardCenter =           {fg = c.fg},
    DashboardFooter =           {fg = c.fg, fmt = "italic"}
}

hl.plugins.outline = {
    FocusedSymbol =             {fg = c.fg, bg = c.bg2, fmt = "bold" },
    AerialLine =                {fg = c.fg, bg = c.bg2, fmt = "bold" },
}

hl.plugins.navic = {
    NavicText =                 {fg = c.fg},
    NavicSeparator =            {fg = c.fg},
}

hl.plugins.ts_rainbow = {
    rainbowcol1 =               {fg = c.fg},
    rainbowcol2 =               {fg = c.fg},
    rainbowcol3 =               {fg = c.fg},
    rainbowcol4 =               {fg = c.fg},
    rainbowcol5 =               {fg = c.fg},
    rainbowcol6 =               {fg = c.fg},
    rainbowcol7 =               {fg = c.fg},
}

hl.plugins.indent_blankline = {
    IndentBlankLineIndent1 =    {fg = c.fg},
    IndentBlankLineIndent2 =    {fg = c.fg},
    IndentBlankLineIndent3 =    {fg = c.fg},
    IndentBlankLineIndent4 =    {fg = c.fg},
    IndentBlankLineIndent5 =    {fg = c.fg},
    IndentBlankLineIndent6 =    {fg = c.fg},
    IndentBlankLineContext =    {fg = c.fg, bg = c.bg3, bold = true },
}

hl.plugins.mini = {
    MiniCompletionActiveParameter = { fmt = "underline" },
    MiniCursorword =            {fmt = "underline" },
    MiniCursorwordCurrent =     {fmt = "underline" },
    MiniIndentscopeSymbol =     {fg = c.fg },
    MiniIndentscopePrefix =     {fmt = "nocombine" }, -- Make it invisible
    MiniJump =                  {fg = c.fg, fmt = "underline", sp = c.purple },
    MiniJump2dSpot =            {fg = c.fg, fmt = "bold,nocombine" },
    MiniStarterCurrent =        {fmt = "nocombine" },
    MiniStarterFooter =         {fg = c.fg, fmt = "italic" },
    MiniStarterHeader =         {fg = c.fg},
    MiniStarterInactive =       {fg = c.fg, fmt = cfg.code_style.comments },
    MiniStarterItem =           {fg = c.fg, bg = cfg.transparent and c.none or c.bg0 },
    MiniStarterItemBullet =     {fg = c.fg },
    MiniStarterItemPrefix =     {fg = c.fg },
    MiniStarterSection =        {fg = c.fg},
    MiniStarterQuery =          {fg = c.fg },
    MiniStatuslineDevinfo =     {fg = c.fg, bg = c.bg2 },
    MiniStatuslineFileinfo =    {fg = c.fg, bg = c.bg2 },
    MiniStatuslineFilename =    {fg = c.fg, bg = c.bg1 },
    MiniStatuslineInactive =    {fg = c.fg, bg = c.bg0 },
    MiniStatuslineModeCommand = {fg = c.bg0, bg = c.fg, fmt = "bold" },
    MiniStatuslineModeInsert =  {fg = c.bg0, bg = c.fg, fmt = "bold" },
    MiniStatuslineModeNormal =  {fg = c.bg0, bg = c.fg, fmt = "bold" },
    MiniStatuslineModeOther =   {fg = c.bg0, bg = c.fg, fmt = "bold" },
    MiniStatuslineModeReplace = {fg = c.bg0, bg = c.fg, fmt = "bold" },
    MiniStatuslineModeVisual =  {fg = c.bg0, bg = c.fg, fmt = "bold" },

    MiniSurround = { fg = c.bg0, bg = c.orange },

    MiniTablineCurrent =        {fmt = "bold" },
    MiniTablineFill =           {fg = c.fg, bg = c.bg1 },
    MiniTablineHidden =         {fg = c.fg, bg = c.bg1 },
    MiniTablineModifiedCurrent ={fg = c.fg, fmt = "bold,italic" },
    MiniTablineModifiedHidden = {fg = c.fg, bg = c.bg1, fmt = "italic" },
    MiniTablineModifiedVisible ={fg = c.fg, bg = c.bg0, fmt = "italic" },
    MiniTablineTabpagesection = {fg = c.fg, bg = c.fg },
    MiniTablineVisible =        {fg = c.fg, bg = c.bg0 },

    MiniTestEmphasis =          {fmt = "bold" },
    MiniTestFail =              {fg = c.fg, fmt = "bold" },
    MiniTestPass =              {fg = c.fg, fmt = "bold" },

    MiniTrailspace =            {bg = c.fg },
}

hl.langs.c = {
    cInclude =                  {fg = c.fg},
    cStorageClass =             {fg = c.fg},
    cTypedef =                  {fg = c.fg},
    cDefine =                   {fg = c.fg},
    cTSInclude =                {fg = c.fg},
    cTSConstant =               {fg = c.fg},
    cTSConstMacro =             {fg = c.fg},
    cTSOperator =               {fg = c.fg},
}

hl.langs.cpp = {
    cppStatement =              { fg = c.purple, fmt = "bold" },
    cppTSInclude =              {fg = c.fg},
    cppTSConstant =             {fg = c.fg},
    cppTSConstMacro =           {fg = c.fg},
    cppTSOperator =             {fg = c.fg},
}

hl.langs.markdown = {
    markdownBlockquote =        {fg = c.fg_3},
    markdownBold =              {fg = c.fg, fmt = "bold"},
    markdownBoldDelimiter =     {fg = c.fg},
    markdownCode =              {fg = c.fg},
    markdownCodeBlock =         {fg = c.fg},
    markdownCodeDelimiter =     {fg = c.fg},
    markdownH1 =                {fg = c.blue_08, fmt = "bold"},
    markdownH2 =                {fg = c.blue_09, fmt = "bold"},
    markdownH3 =                {fg = c.blue_11, fmt = "bold"},
    markdownH4 =                {fg = c.blue_13, fmt = "bold"},
    markdownH5 =                {fg = c.blue_14, fmt = "bold"},
    markdownH6 =                {fg = c.blue_16, fmt = "bold"},
    markdownHeadingDelimiter =  {fg = c.purple_11},
    markdownHeadingRule =       {fg = c.purple_10},
    markdownId =                {fg = c.fg},
    markdownIdDeclaration =     {fg = c.fg},
    markdownItalic =            {fg = c.fg, fmt = "italic"},
    markdownItalicDelimiter =   {fg = c.fg, fmt = "italic"},
    markdownLinkDelimiter =     {fg = c.blue_04},
    markdownLinkText =          {fg = c.blue_02, fmt = "underline"},
    markdownLinkTextDelimiter = {fg = c.blue_04},
    markdownListMarker =        {fg = c.blue_14},
    markdownOrderedListMarker = {fg = c.blue_16},
    markdownRule =              {fg = c.green_08},
    markdownUrl =               {fg = c.fg_4 },
    markdownUrlDelimiter =      {fg = c.blue_07},
    markdownUrlTitleDelimiter = {fg = c.blue_07},
}

hl.langs.php = {
    phpFunctions =              {fg = c.fg, fmt = cfg.code_style.functions},
    phpMethods =                {fg = c.fg},
    phpStructure =              {fg = c.fg},
    phpOperator =               {fg = c.fg},
    phpMemberSelector =         {fg = c.fg},
    phpVarSelector =            {fg = c.fg, fmt = cfg.code_style.variables},
    phpIdentifier =             {fg = c.fg, fmt = cfg.code_style.variables},
    phpBoolean =                {fg = c.fg},
    phpNumber =                 {fg = c.fg},
    phpHereDoc =                {fg = c.fg},
    phpNowDoc =                 {fg = c.fg},
    phpSCKeyword =              {fg = c.fg, fmt = cfg.code_style.keywords},
    phpFCKeyword =              {fg = c.fg, fmt = cfg.code_style.keywords},
    phpRegion =                 {fg = c.fg},
}

hl.langs.scala = {
    scalaNameDefinition =       {fg = c.fg},
    scalaInterpolationBoundary ={fg = c.fg},
    scalaInterpolation =        {fg = c.fg},
    scalaTypeOperator =         {fg = c.fg},
    scalaOperator =             {fg = c.fg},
    scalaKeywordModifier =      {fg = c.fg, fmt = cfg.code_style.keywords},
}

hl.langs.tex = {
    latexTSInclude =            {fg = c.fg},
    latexTSFuncMacro =          {fg = c.fg, fmt = cfg.code_style.functions},
    latexTSEnvironment =        { fg = c.fg, fmt = "bold" },
    latexTSEnvironmentName =    {fg = c.fg},
    texCmdEnv =                 {fg = c.fg},
    texEnvArgName =             {fg = c.fg},
    latexTSTitle =              {fg = c.fg},
    latexTSType =               {fg = c.fg},
    latexTSMath   =             {fg = c.fg},
    texMathZoneX  =             {fg = c.fg},
    texMathZoneXX =             {fg = c.fg},
    texMathDelimZone =          {fg = c.fg},
    texMathDelim =              {fg = c.fg},
    texMathOper =               {fg = c.fg},
    texCmd =                    {fg = c.fg},
    texCmdPart =                {fg = c.fg},
    texCmdPackage =             {fg = c.fg},
    texPgfType =                {fg = c.fg},
}

hl.langs.vim = {
    vimOption =                 {fg = c.fg},
    vimSetEqual =               {fg = c.fg},
    vimMap =                    {fg = c.fg},
    vimMapModKey =              {fg = c.fg},
    vimNotation =               {fg = c.fg},
    vimMapLhs =                 {fg = c.fg},
    vimMapRhs =                 {fg = c.fg},
    vimVar =                    {fg = c.fg, fmt = cfg.code_style.variables},
    vimCommentTitle =           {fg = c.fg, fmt = cfg.code_style.comments},
}

-- This field defines how the lsp colors the different
-- types of symbols that are defined by the lsp
local lsp_kind_icons_color = {
    Default =                   c.fg,
    Array =                     c.fg,
    Boolean =                   c.fg,
    Class =                     c.fg,
    Color =                     c.fg,
    Constant =                  c.fg,
    Constructor =               c.fg,
    Enum =                      c.fg,
    EnumMember =                c.fg,
    Event =                     c.fg,
    Field =                     c.fg,
    File =                      c.fg,
    Folder =                    c.fg,
    Function =                  c.fg,
    Interface =                 c.fg,
    Key =                       c.fg,
    Keyword =                   c.fg,
    Method =                    c.fg,
    Module =                    c.fg,
    Namespace =                 c.fg,
    Null =                      c.fg,
    Number =                    c.fg,
    Object =                    c.fg,
    Operator =                  c.fg,
    Package =                   c.fg,
    Property =                  c.fg,
    Reference =                 c.fg,
    Snippet =                   c.fg,
    String =                    c.fg,
    Struct =                    c.fg,
    Text =                      c.fg,
    TypeParameter =             c.fg,
    Unit =                      c.fg,
    Value =                     c.fg,
    Variable =                  c.fg,
}

function M.setup()
    -- define cmp and aerial kind highlights with lsp_kind_icons_color
    -- set the colors for the things that the lsp defines
    for kind, color in pairs(lsp_kind_icons_color) do
        hl.plugins.cmp["CmpItemKind" .. kind] = { fg = color, fmt = cfg.cmp_itemkind_reverse and "reverse" }
        hl.plugins.outline["Aerial" .. kind .. "Icon"] = { fg = color }
        hl.plugins.navic["NavicIcons" .. kind] = { fg = color }
    end

    vim_highlights(hl.common)
    vim_highlights(hl.syntax)
    vim_highlights(hl.treesitter)
    if hl.lsp then
        vim_highlights(hl.lsp)
    end
    for _, group in pairs(hl.langs) do vim_highlights(group) end
    for _, group in pairs(hl.plugins) do vim_highlights(group) end

    -- user defined highlights: vim_highlights function cannot be used because it sets an attribute to none if not specified
    local function replace_color(prefix, color_name)
        if not color_name then return "" end
        if color_name:sub(1, 1) == '$' then
            local name = color_name:sub(2, -1)
            color_name = c[name]
            if not color_name then
                vim.schedule(function()
                    vim.notify('nabla.nvim: unknown color "' .. name .. '"', vim.log.levels.ERROR, { title = "nabla.nvim" })
                end)
                return ""
            end
        end
        return prefix .. "=" .. color_name
    end

    for group_name, group_settings in pairs(vim.g.nabla_config.highlights) do
        vim.api.nvim_command(string.format("highlight %s %s %s %s %s", group_name,
            replace_color("guifg", group_settings.fg),
            replace_color("guibg", group_settings.bg),
            replace_color("guisp", group_settings.sp),
            replace_color("gui", group_settings.fmt)))
    end
end

return M
