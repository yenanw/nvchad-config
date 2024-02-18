local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

local opts = {
  sources = {
    -- lua stuff
    null_ls.builtins.formatting.stylua,

    -- javascript stuff
    null_ls.builtins.formatting.prettierd,

    -- shell stuff
    null_ls.builtins.formatting.shfmt,

    -- c stuff
    null_ls.builtins.formatting.clang_format,

    -- python stuff
    null_ls.builtins.formatting.black,
    null_ls.builtins.diagnostics.pylint,
  },
  -- enable auto formatting on save
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

return opts
