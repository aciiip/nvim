return {
  "stevearc/conform.nvim",
  -- init = function()
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     pattern = "*",
  --     callback = function(args)
  --       require("conform").format({ bufnr = args.buf })
  --     end,
  --   })
  -- end,
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        php = { "php-cs-fixer" },
        ["blade.php"] = { "blade-formatter" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        vue = { "prettier" },
        markdown = { "markdownlint" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
      notify_on_error = true,
      formatters = {
        ["php-cs-fixer"] = {
          command = "php-cs-fixer",
          args = {
            "fix",
            "--rules=@PSR12",
            "$FILENAME",
          },
          stdin = false,
        },
      },
    })
  end,
}
