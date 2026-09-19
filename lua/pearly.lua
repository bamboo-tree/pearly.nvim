---@class Pearly
local Pearly = {}

local palette = {
    bg_1     = "#222222",
    bg_2     = "#111111",
    bg_3     = "#000000",

    fg_1     = "#BBBBBB",
    fg_2     = "#DDDDDD",
    fg_3     = "#FFFFFF",

    red      = "#C43040",
    green    = "#10F060",
    yellow   = "#EECC00",
    blue     = "#4020FF",
    purple   = "#EE20FF",
    aqua     = "#10F0F0",
    orange   = "#FF8020",
    gray     = "#777777",

    red_2    = "#A40000",
    green_2  = "#0B8900",
    yellow_2 = "#C29000",
    blue_2   = "#1F1FA0",
    purple_2 = "#700080",
    aqua_2   = "#08AEAE",
    orange_2 = "#A84000",
    gray_2   = "#444444",

}

local groups = {
    Normal               = { fg = palette.fg_1, bg = palette.bg_3 },
    NormalFloat          = { fg = palette.fg_1, bg = palette.bg_2 }, --- what is it?

    Cursor               = { reverse = true },
    CursorLine           = { bg = palette.bg_1 },
    CursorColumn         = { link = "CursorLine" },
    CursorLineNr         = { fg = palette.bg_3, bg = palette.yellow_2 },
    LineNr               = { fg = palette.yellow_2, bg = palette.bg_3 },

    Visual               = { bg = palette.blue_2 },
    Search               = { bg = palette.yellow, reverse = true },
    IncSearch            = { bg = palette.purple_2 },

    StatusLine           = { bg = palette.bg_1 },
    StatusLineNC         = { bg = palette.bg_2 },
    WinSeparator         = { bg = palette.bg_3 },

    Pmenu                = { fg = palette.fg_1, bg = palette.bg_1 },
    PmenuSel             = { fg = palette.fg_2, bg = palette.bg_2 },

    Directory            = { fg = palette.green_2 },
    Title                = { fg = palette.yellow },
    ErrorMsg             = { fg = palette.red, bg = palette.bg_3 },
    WarningMsg           = { fg = palette.yellow, bg = palette.bg_3 },
    ModeMsg              = { fg = palette.green_2 },
    MoreMsg              = { fg = palette.green_2 },
    Question             = { fg = palette.green_2 },

    Folded               = { bg = palette.bg_1 },
    FoldColumn           = { bg = palette.bg_1 },
    SignColumn           = { bg = palette.bg_3 },
    Comment              = { fg = palette.gray, italic = true },

    Constant             = { fg = palette.blue },
    String               = { fg = palette.green },
    Character            = { fg = palette.orange },
    Number               = { fg = palette.aqua },
    Boolean              = { fg = palette.purple },

    Identifier           = { fg = palette.aqua },
    Function             = { fg = palette.blue },

    Statement            = { fg = palette.purple_2 },
    Keyword              = { fg = palette.yellow },
    Operator             = { fg = palette.fg_3 },

    PreProc              = { fg = palette.fg_2, bg = palette.purple_2 },

    Type                 = { fg = palette.purple },
    Structure            = { bg = palette.green_2 },

    Special              = { fg = palette.purple },
    Delimiter            = { fg = palette.purple },

    Todo                 = { bg = palette.green_2 },
    Error                = { bg = palette.green_2 },

    NeoTreeFloatBorder   = { fg = palette.bg_1 },
    NeoTreeTitleBar      = { fg = palette.fg2, bg = palette.bg2 },
    NeoTreeDirectoryIcon = { fg = palette.yellow_2 },
    NeoTreeDirectoryName = { fg = palette.fg_1 },
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
