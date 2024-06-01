local api = require "nvim-tree.api"

local function my_on_attach(bufnr)
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  local function create_file_and_open(file)
    api.fs.create(file)
    api.node.open.edit(file)
  end

  vim.keymap.set("n", "<f4>", "<C-w>w", opts "Focus Editor")
  vim.keymap.set("n", "<f6>", "<C-w>w", opts "Focus Editor")
  vim.keymap.set("n", "<esc>", "<C-w>w", opts "Focus Editor")
  vim.keymap.set("n", "<C-f>", "<C-w>w", opts "Focus Editor")
  vim.keymap.set(
    "n",
    "<f12>",
    "<C-w>w<esc><cmd>lua require('nvchad.term').toggle({ pos = 'sp', id = 'htoggleTerm' })<cr>",
    opts "Focus Editor"
  )
  vim.keymap.set("n", "<C-e>", "<cmd>Telescope find_files<cr>", opts "Focus Editor")
  vim.keymap.set("n", "<delete>", api.fs.trash, opts "Delete in Trash")
  vim.keymap.set("n", "d", api.fs.trash, opts "Delete in Trash")
  vim.keymap.set("n", "<C-r>", api.tree.reload, opts "Delete in Trash")
  vim.keymap.set("n", "<right>", api.node.open.preview, opts "Open folder or edit file")
  vim.keymap.set("n", "<left>", api.node.navigate.parent_close, opts "Open folder or edit file")
  vim.keymap.set("n", "<C-left>", api.tree.collapse_all, opts "Collapse all files")
  vim.keymap.set("n", "<C-c>", api.fs.copy.node, opts "Copy fs")
  vim.keymap.set("n", "<C-v>", api.fs.paste, opts "Paste fs")
  vim.keymap.set("n", "<C-x>", api.fs.cut, opts "Cup fs")
  vim.keymap.set("n", "<f2>", api.fs.rename_sub, opts "Rename file")
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
  vim.keymap.set("n", "<C-t>", create_file_and_open, opts "Create File And Open")
end

require("nvim-tree").setup {
  on_attach = my_on_attach,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = { "README.*", "LICENSE", "lazy-lock.*", ".git" },
  },
  ui = {
    confirm = {
      remove = true,
      trash = false,
      default_yes = false,
    },
  },
  view = {
    -- hide_root_folder = true,
    side = "right",
    width = 35,
  },
  renderer = {
    -- root_folder_label = ":~:s?$?/..?",
    -- "none" | "icon" | "name" | "all"
    -- highlight_git = "all",
    highlight_opened_files = "name",
    -- highlight_modified = "all",
    -- highlight_bookmarks = "all",
    -- highlight_diagnostics = "all",
    -- highlight_clipboard = "all",
    -- examples
    -- highlight_clipboard = { "none", "icon", "name", "all" },
    -- highlight_git = "all",
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  },

  -------------Need---------------
  sync_root_with_cwd = false,
  respect_buf_cwd = false,
  update_focused_file = {
    enable = false,
    update_root = false,
  },
  --------------------------------
}
