return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufWritePost" },
  init = function()
    local lint = require("lint")
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
  config = function()
    local lint = require("lint")

    lint.linters.phpcs.args = {
      "-q",
      "--standard=PSR12",
      "--report=json",
      "-",
    }
    -- lint.linters.phpcs.parser = function(output, bufnr)
    --   local decoded = vim.fn.json_decode(output)
    --   local diagnostics = {}
    --
    --   for _, file in pairs(decoded.files or {}) do
    --     for _, message in ipairs(file.messages) do
    --       table.insert(diagnostics, {
    --         bufnr = bufnr,
    --         lnum = message.line - 1,
    --         col = message.column - 1,
    --         end_col = message.column,
    --         severity = vim.diagnostic.severity.HINT,
    --         message = message.message,
    --         source = "phpcs",
    --       })
    --     end
    --   end
    --   return diagnostics
    -- end

    -- lint.linters.eslint_d.args = {
    --   '--no-warn-ignored',
    --   '--format',
    --   'json',
    --   '--stdin',
    --   '--stdin-filename',
    --   function()
    --     return vim.api.nvim_buf_get_name(0)
    --   end,
    -- }

    lint.linters_by_ft = {
      -- javascript = { "eslint_d" },
      -- typescript = { "eslint_d" },
      -- javascriptreact = { "eslint_d" },
      -- typescriptreact = { "eslint_d" },
      -- vue = { "eslint_d" },
      sh = { "shellcheck" },
      fish = { "fish" },
      json = { "jsonlint" },
      markdown = { "markdownlint" },
      php = { "php", "phpcs" },
      css = { "stylelint" },
      yaml = { "yamllint" },
    }
  end,
}
