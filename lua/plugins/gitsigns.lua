-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    signs_staged = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
    on_attach = function(buffer)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
      end

      -- stylua: ignore start
      map("n", "<leader>gn", function() gs.nav_hunk("next") end, "[N]ext Hunk")
      map("n", "<leader>gp", function() gs.nav_hunk("prev") end, "[P]rev Hunk")
      map("n", "<leader>gl", function() gs.nav_hunk("last") end, "[L]ast Hunk")
      map("n", "<leader>gf", function() gs.nav_hunk("first") end, "[F]irst Hunk")
      -- map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
      -- map("n", "<leader>gb", gs.stage_buffer, "Stage Buffer")
      map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "[R]eset Hunk")
      map("n", "<leader>gR", gs.reset_buffer, "[R]eset Buffer")
      map("n", "<leader>gi", gs.preview_hunk_inline, "Preview Hunk [I]nline")
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "[B]lame Line")
      map("n", "<leader>gB", function() gs.blame() end, "Blame [B]uffer")
      map("n", "<leader>gd", gs.diffthis, "[D]iff This")
      map("n", "<leader>gD", function() gs.diffthis("~") end, "[D]iff This ~")
      -- map({ "o", "x" }, "gh", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      -- map({ "n", "v" }, "<leader>gt", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
    end,
  },
}
