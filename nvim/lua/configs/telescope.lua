local actions = require "telescope.actions"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then
    return tail
  end
  return string.format("%s\t\t%s", tail, parent)
end

require("telescope").setup {
  pickers = {
    find_files = {
      path_display = filenameFirst,
      hidden = true,
      file_ignore_patterns = { "node_modules", ".git" },
    },
    oldfiles = {
      path_display = filenameFirst,
    },
  },
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-e>"] = actions.close,
        ["<C-q>"] = actions.close,
        ["<C-Q>"] = actions.close,
        ["<C-f>"] = actions.close,
        ["<f5>"] = actions.close,
        ["<C-h>"] = { "<c-s-w>", type = "command" },
        ["<C-BS>"] = { "<c-s-w>", type = "command" },
        ["<C-down>"] = actions.cycle_history_next,
        ["<C-up>"] = actions.cycle_history_prev,
      },
    },
  },
}
