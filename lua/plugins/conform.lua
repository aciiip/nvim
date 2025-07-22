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
        blade = { "blade-formatter" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        vue = { "prettier" },
        markdown = { "markdownlint" },
      },
      -- format_on_save = {
      --   lsp_fallback = true,
      --   async = false,
      --   timeout_ms = 2000,
      -- },
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
        -- ["blade-formatter"] = {
        --   command = "blade-formatter",
        --   args = {
        --     "--wrap-line-length", "999",
        --     "$FILENAME",
        --   },
        -- },
      },
    })

    vim.keymap.set("n", "<leader>cf", function()
      vim.lsp.buf.format({
        async = false,
      })

      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      })
    end, { desc = "[F]ormat Buffer" })

    vim.keymap.set("v", "<leader>cf", function()
      local start_row = vim.fn.getpos("v")[2] - 0
      local end_row = vim.fn.getpos(".")[2] - 0
      if start_row > end_row then
        start_row, end_row = end_row, start_row
      end

      local range = {
        start = { start_row, 0 },
        ["end"] = { end_row, 0 },
      }

      vim.lsp.buf.format({
        async = false,
        range = range,
      })

      require("conform").format({
        lsp_fallback = false,
        async = false,
        timeout_ms = 2000,
        range = range,
      })

      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
    end, { desc = "[F]ormat Selected" })
  end,
}
