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

    local phpcs = lint.linters.phpcs
    phpcs.args = {
      "-q",
      "--standard=PSR12",
      "--report=json",
      "-",
    }

    lint.linters_by_ft = {
      -- javascript = { "eslint_d" },
      -- typescript = { "eslint_d" },
      -- javascriptreact = { "eslint_d" },
      -- typescriptreact = { "eslint_d" },
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
