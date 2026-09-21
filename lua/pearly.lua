---@class Pearly
local Pearly = {}

local palette = {
    bg_1     = "#303030",
    bg_2     = "#202020",
    bg_3     = "#000000",

    fg_1     = "#909090",
    fg_2     = "#B0B0B0",
    fg_3     = "#F0F0F0",

    red      = "#F03020",
    green    = "#10F060",
    yellow   = "#E0F000",
    blue     = "#2060F0",
    purple   = "#F020E0",
    aqua     = "#20F0F0",
    orange   = "#F08020",
    gray     = "#707070",

    red_2    = "#C00000",
    green_2  = "#00B000",
    yellow_2 = "#D0A000",
    blue_2   = "#1010D0",
    purple_2 = "#A00080",
    aqua_2   = "#20B0B0",
    orange_2 = "#C05010",
    gray_2   = "#404040",
}

local groups = {
    -- any comment
    Comment                   = { fg = palette.fg_1, italic = true },
    -- any constant
    Constant                  = { fg = palette.purple_2 },
    -- a string constant: "this is a string"
    String                    = { fg = palette.green_2, italic = true },
    -- a character constant: 'c', '\n'
    Character                 = { fg = palette.orange_2 },
    -- a number constant: 234, 0xff
    Number                    = { fg = palette.aqua_2 },
    -- a floating point constant: 2.3e10
    Float                     = { fg = palette.aqua_2 },
    -- a boolean constant: TRUE, false
    Boolean                   = { fg = palette.purple },
    -- any variable name
    Identifier                = { fg = palette.fg_3 },
    -- function name (also: methods for classes)
    Function                  = { fg = palette.blue },
    -- any statement
    Statement                 = { fg = palette.green, bold = true },
    -- if, then, else, endif, switch, etc.
    Conditional               = { fg = palette.green },
    -- for, do, while, etc.
    Repeat                    = { fg = palette.orange },
    -- case, default, etc.
    Label                     = { fg = palette.yellow },
    -- "sizeof", "+", "*", etc.
    Operator                  = { fg = palette.yellow },
    -- any other keyword
    Keyword                   = { fg = palette.aqua_2 },
    -- try, catch, throw
    Exception                 = { fg = palette.red },
    -- generic Preprocessor
    PreProc                   = { fg = palette.aqua_2 },
    -- preprocessor #include
    Include                   = { fg = palette.aqua_2 },
    -- preprocessor #define
    Define                    = { fg = palette.aqua_2 },
    -- same as Define
    Macro                     = { fg = palette.green },
    -- preprocessor #if, #else, #endif, etc.
    PreCondit                 = { fg = palette.purple_2 },
    -- int, long, char, etc.
    Type                      = { fg = palette.fg_2 },
    -- static, register, volatile, etc.
    StorageClass              = { fg = palette.orange_2 },
    -- struct, union, enum, etc.
    Structure                 = { fg = palette.orange },
    -- a typedef
    Typedef                   = { fg = palette.blue },
    -- any special symbol
    Special                   = { fg = palette.purple },
    -- special character in a constant
    SpecialChar               = { fg = palette.green },
    -- you can use CTRL-] on this
    Tag                       = { reverse = true },
    -- character that needs attention
    Delimiter                 = { fg = palette.purple },
    -- special things inside a -- comment
    SpecialComment            = { fg = palette.green },
    -- debugging statements
    --    Debug
    -- text that stands out, HTML -- links
    --    Underlined
    -- text that is de-emphasized
    Dimmed                    = { fg = palette.bg_1 },
    -- left blank, hidden  hl-Ignore
    --    Ignore
    -- any erroneous construct
    Error                     = { fg = palette.fg_2, bg = palette.red_2 },
    -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Todo                      = { fg = palette.bg_3, bg = palette.aqua },
    -- added line in a diff
    Added                     = { fg = palette.green_2 },
    -- changed line in a diff
    Changed                   = { fg = palette.yellow_2 },
    -- removed line in a diff
    Removed                   = { fg = palette.red_2 },

    Normal                    = { fg = palette.fg_1, bg = palette.bg_3 },
    NormalFloat               = { fg = palette.fg_1, bg = palette.bg_2 }, --- what is it?

    Cursor                    = { fg = palette.green, bg = palette.bg_3 },
    CursorLine                = { bg = palette.bg_1 },
    CursorColumn              = { bg = palette.bg_1 },
    ColorColumn               = { bg = palette.bg_2 },
    CursorLineNr              = { fg = palette.bg_3, bg = palette.yellow_2 },
    LineNr                    = { fg = palette.yellow_2, bg = palette.bg_3 },

    Visual                    = { fg = palette.fg_3, bg = palette.purple_2 },
    Search                    = { fg = palette.fg_3, bg = palette.blue_2 },
    IncSearch                 = { fg = palette.bg_3, bg = palette.purple },

    StatusLine                = { bg = palette.bg_2 },
    StatusLineNC              = { bg = palette.bg_2 },
    WinSeparator              = { bg = palette.bg_3 },

    Pmenu                     = { fg = palette.fg_2, bg = palette.bg_2 },
    PmenuSel                  = { fg = palette.fg_3, bg = palette.yellow_2 },

    Directory                 = { fg = palette.green_2 },
    Title                     = { fg = palette.yellow },
    ErrorMsg                  = { fg = palette.red, bg = palette.bg_3 },
    WarningMsg                = { fg = palette.yellow, bg = palette.bg_3 },
    ModeMsg                   = { fg = palette.green_2 },
    MoreMsg                   = { fg = palette.green_2 },
    Question                  = { fg = palette.green_2 },

    Folded                    = { bg = palette.bg_1 },
    FoldColumn                = { bg = palette.bg_1 },
    SignColumn                = { bg = palette.bg_3 },

    TodoBgWARN                = { fg = palette.bg_2, bg = palette.yellow_2, bold = true },
    TodoBgHACK                = { fg = palette.bg_2, bg = palette.yellow_2, bold = true },
    TodoBgTODO                = { fg = palette.bg_2, bg = palette.aqua_2, bold = true },
    TodoBgNOTE                = { fg = palette.bg_2, bg = palette.aqua_2, bold = true },
    TodoBgTEST                = { fg = palette.bg_2, bg = palette.fg_2, bold = true },
    TodoBgPREF                = { fg = palette.bg_2, bg = palette.fg_2, bold = true },
    TodoBgFIX                 = { fg = palette.bg_2, bg = palette.red_2, bold = true },
    TodoFgWARN                = { fg = palette.yellow_2 },
    TodoFgHACK                = { fg = palette.yellow_2 },
    TodoFgTODO                = { fg = palette.aqua_2 },
    TodoFgNOTE                = { fg = palette.aqua_2 },
    TodoFgTEST                = { fg = palette.fg_2 },
    TodoFgPREF                = { fg = palette.fg_2 },
    TodoFgFIX                 = { fg = palette.red_2 },
    TodoSignWARN              = { fg = palette.yellow_2 },
    TodoSignHACK              = { fg = palette.yellow_2 },
    TodoSignTODO              = { fg = palette.aqua_2 },
    TodoSignNOTE              = { fg = palette.aqua_2 },
    TodoSignTEST              = { fg = palette.fg_2 },
    TodoSignPREF              = { fg = palette.fg_2 },
    TodoSignFIX               = { fg = palette.red_2 },

    -- TODO: fix NeoTree dimmed text
    NeoTreeFloatBorder        = { fg = palette.bg_1 },
    NeoTreeTitleBar           = { fg = palette.fg2, bg = palette.bg2 },
    NeoTreeDirectoryIcon      = { fg = palette.yellow_2 },
    NeoTreeDirectoryName      = { fg = palette.fg_1 },
    NeoTreeDimText            = { fg = palette.bg_1 },

    MiniStatuslineModeReplace = { fg = palette.orange, bg = palette.bg_1, bold = true },
    MiniStatuslineModeCommand = { fg = palette.aqua, bg = palette.bg_1, bold = true },
    MiniStatuslineModeVisual  = { fg = palette.purple, bg = palette.bg_1, bold = true },
    MiniStatuslineModeNormal  = { fg = palette.green, bg = palette.bg_1, bold = true },
    MiniStatuslineModeInsert  = { fg = palette.blue, bg = palette.bg_1, bold = true },
    MiniStatuslineModeOther   = { fg = palette.fg_2, bg = palette.bg_1, bold = true },

    MiniStatuslineInactive    = { fg = palette.fg_2, bg = palette.bg_2 },
    MiniStatuslineFilename    = { fg = palette.fg_2, bg = palette.bg_2 },
    MiniStatuslineFileinfo    = { fg = palette.yellow_2, bg = palette.bg_2 },
    MiniStatuslineDevinfo     = { fg = palette.aqua_2, bg = palette.bg_2 },

    MiniTrailspace            = { fg = palette.bg_3, bg = palette.red_2 },
}


--- Entry point function
Pearly.load = function()
    -- Verify nvim version
    if vim.version().minor < 8 then
        vim.notify_once("pearly.nvim: you must use neovim 0.8 or higher")
        return
    end

    -- Reset palette
    if vim.g.palette_name then
        vim.cmd.hi("clear")
    end
    vim.g.palette_name = "pearly"

    -- Add highlights
    for group, settings in pairs(groups) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end

return Pearly
