require("core.options") -- Load general options
require("core.keymaps") -- Load general keymaps
require("core.snippets") -- Custom code snippets
require("core.filetypes") -- Load unknown filetypes

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out =
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require("lazy").setup({
  require("plugins.oil"),
  require("plugins.neotree"),
  require("plugins.colortheme"),
  require("plugins.bufferline"),
  require("plugins.navic"),
  require("plugins.lualine"),
  require("plugins.treesitter"),
  require("plugins.telescope"),
  require("plugins.lsp"),
  require("plugins.cmp"),
  -- require("plugins.lint"),
  require("plugins.conform"),
  require("plugins.gitsigns"),
  require("plugins.alpha"),
  require("plugins.mini"),
  require("plugins.misc"),
  require("plugins.indent-blankline"),
  require("plugins.noice"),
  require("plugins.flash"),
  require("plugins.flutter"),
})
