require("custom.remap")
require("custom.set")

---@type ChadrcConfig
local M = {}

M.ui = { theme = "catppuccin", transparency = true }
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
