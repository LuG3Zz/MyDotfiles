---@type ChadrcConfig
local M = {}
M.ui = { theme = "onedark" }
M.ui.transparency = false
M.ui.nvdash = {
  load_on_startup = true,
  header = {
    "██▓     █    ██   ▄████  ▄▄▄       ██▀███   ",
    "▓██▒     ██  ▓██▒ ██▒ ▀█▒▒████▄    ▓██ ▒ ██▒",
    "▒██░    ▓██  ▒██░▒██░▄▄▄░▒██  ▀█▄  ▓██ ░▄█ ▒",
    "▒██░    ▓▓█  ░██░░▓█  ██▓░██▄▄▄▄██ ▒██▀▀█▄  ",
    "░██████▒▒▒█████▓ ░▒▓███▀▒ ▓█   ▓██▒░██▓ ▒██▒",
    "░ ▒░▓  ░░▒▓▒ ▒ ▒  ░▒   ▒  ▒▒   ▓▒█░░ ▒▓ ░▒▓░",
    "░ ░ ▒  ░░░▒░ ░ ░   ░   ░   ▒   ▒▒ ░  ░▒ ░ ▒░",
    "  ░ ░    ░░░ ░ ░ ░ ░   ░   ░   ▒     ░░   ░ ",
    "    ░  ░   ░           ░       ░  ░   ░     ",
    "                                            ",
  },
}
M.ui.cheatsheet = { theme = "simple" }
M.ui.statusline = { theme = "vscode_colored" }
M.ui.cmp = { style = "default" }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
