vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

local cmp = require "cmp"
local types = require "cmp.types"
local options_cmp = {
  mapping = {
    ["<C-r>"] = cmp.mapping.complete(),
    ["<down>"] = cmp.mapping.select_next_item { behavior = types.cmp.SelectBehavior.Select },
    ["<up>"] = cmp.mapping.select_prev_item { behavior = types.cmp.SelectBehavior.Select },
    ["<esc>"] = cmp.mapping.close(),
    ["<C-h>"] = cmp.mapping.close(),
    ["<C-bs>"] = cmp.mapping.close(),
    ["<C-up>"] = cmp.mapping.scroll_docs(4),
    ["<C-down>"] = cmp.mapping.scroll_docs(-4),
    ["<right>"] = cmp.mapping.confirm { select = true },
  },
  performance = {
    max_view_entries = 15,
  },
  preselect = types.cmp.PreselectMode.None,
  completion = {
    autocomplete = false,
    completeopt = "noselect",
  },
  experimental = {
    ghost_text = true,
  },
}

require("cmp").setup(options_cmp)

local ft = require "Comment.ft"
ft.set("pug", "//- %s")

vim.cmd "hi FoldColumn guibg=NONE"
vim.cmd "NoMatchParen"

local function lspSymbol(name, icon)
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = "", texthl = hl })
end

lspSymbol("Error", "") -- 󰅙
lspSymbol("Info", "") -- 󰋼
lspSymbol("Hint", "󰌵") -- 󰌵
lspSymbol("Warn", "") -- 

vim.diagnostic.config {
  virtual_text = {
    prefix = "",
  },
  signs = true, -- icons
  underline = false,
  update_in_insert = true,
  float = {
    border = "single",
  },
}

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#565c64", bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#565c64", bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#565c64", bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#565c64", bg = "none" })

-- /path/to/change_padding.sh 0 0
--

local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  command = ":silent !~/.config/alacritty/scripts/change_padding.sh 0 0",
})

autocmd("VimLeavePre", {
  command = ":silent !~/.config/alacritty/scripts/change_padding.sh 0 0",
})

