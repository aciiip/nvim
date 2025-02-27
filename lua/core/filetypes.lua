vim.filetype.add({
  -- Detect and assign filetype based on the extension of the filename
  extension = {
    env = "dotenv",
  },
  -- Detect and apply filetypes based on the entire filename
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
  },
  -- Detect and apply filetypes based on certain patterns of the filenames
  pattern = {
    [".*%.blade%.php"] = "blade",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
})
