---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- key binds for the trouble plugin so i can see the freaking diagnostics
    ["<leader>tc"] = { "<cmd> TroubleClose <cr>", "close trouble list" },
    ["<leader>td"] = { "<cmd> TroubleToggle document_diagnostics<cr>", "toggle trouble list in current document" },
    ["<leader>to"] = { "<cmd> Trouble <cr>", "open trouble list" },
    ["<leader>tt"] = { "<cmd> TroubleToggle <cr>", "toggle trouble list" },
    ["<leader>tw"] = { "<cmd> TroubleToggle workspace_diagnostics<cr>", "toggle trouble list in current workspace" },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

return M
