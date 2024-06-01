require "nvchad.mappings"

local api = require "nvim-tree.api"
local map = vim.keymap.set

-- disable keymaps start
map({ "n", "v" }, "h", "")
map({ "n", "v" }, "j", "")
map({ "n", "v" }, "k", "")
map({ "n", "v" }, "l", "")

map({ "n", "v", "i" }, "<C-r>", "")
map({ "n", "v", "i" }, "<C-t>", "")
map({ "n", "v", "i" }, "<C-d>", "")
map({ "n", "v", "i" }, "<S-down>", "")
map({ "n", "v", "i" }, "<S-up>", "")
map({ "n", "v" }, "{", "")
map({ "n", "v" }, "}", "")
map({ "n", "v" }, "p", "")
map({ "n", "v" }, "P", "")
map({ "n", "v", "i", "c", "t" }, "<A-y>", "")
map({ "n", "v", "i", "c", "t" }, "<A-p>", "")
map({ "n", "v", "i", "c", "t" }, "<A-e>", "")

map({ "n" }, "<tab>", "")
map({ "n" }, "<S-tab>", "")
map({ "c" }, "<C-S-p>", "")
map({ "n", "v", "i" }, "<C-w>", "")

-- map({ "n" }, "s", "")
-- disable keymaps end

-- vscode like start
map({ "n", "v", "i" }, "<C-a>", "<esc><C-home><home><C-S-end>")
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><cmd>hi FoldColumn guibg=none<cr>")

map({ "n", "v", "i", "t", "c" }, "<f4>", "<esc><cmd>:NvimTreeFocus<cr>")
map({ "n", "v", "i", "t", "c" }, "<A-x>", "<esc><cmd>:Lazy<cr>")
map({ "n", "v", "i", "t", "c" }, "<C-b>", "<esc><cmd>:NvimTreeToggle<cr>")
-- undo
map({ "n", "v" }, "<C-z>", "<esc>u<esc>")
map({ "i" }, "<C-z>", "<esc>ua")
-- redo
map({ "n", "v" }, "<C-y>", "<esc><C-r><esc>")
map({ "i" }, "<C-y>", "<esc><C-r>a")
-- exit
-- map({ "n", "v", "i", "c", "t" }, "<C-q>", "<esc>:qall!<cr>")
-- copy line
map({ "n" }, "<C-c>", "<esc>yy")
map({ "i" }, "<C-c>", "<esc>yya")
map({ "v" }, "<C-c>", "y`]<right>")
-- paste line
map({ "n" }, "<C-v>", "P`]<right>")
map({ "i" }, "<C-v>", "<esc>pa")
map({ "v" }, "<C-v>", "P`]<right>")
-- cut
map({ "n" }, "<C-x>", "dd")
map({ "v" }, "<C-x>", "d")
map({ "i" }, "<C-x>", "<esc>dda")
-- toggle comment
map({ "v" }, "<C-/>", "<S-left><ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
map({ "v" }, "<C-_>", "<S-left><ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>")
map({ "n", "i" }, "<C-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise.current()<cr>")
map({ "n", "i" }, "<C-_>", "<ESC><cmd>lua require('Comment.api').toggle.linewise.current()<cr>")
-- buffers "tabs"
map({ "n", "v", "i", "t", "c" }, "<C-pageup>", "<cmd>lua require('nvchad.tabufline').prev()<cr>")
map({ "n", "v", "i", "t", "c" }, "<C-pagedown>", "<cmd>lua require('nvchad.tabufline').next()<cr>")
map({ "n", "v", "i" }, "<C-w>", "<cmd>lua require('nvchad.tabufline').close_buffer()<cr>")
-- map({ "n", "v", "i", "t", "c" }, "<C-w>", "<cmd>:q<cr>")
map({ "n", "i", "v", "c", "t" }, "<A-1>", function()
  vim.api.nvim_set_current_buf(vim.t.bufs[1])
end)
map({ "n", "i", "v", "c", "t" }, "<A-2>", function()
  vim.api.nvim_set_current_buf(vim.t.bufs[2])
end)
map({ "n", "i", "v", "c", "t" }, "<A-3>", function()
  vim.api.nvim_set_current_buf(vim.t.bufs[3])
end)
map({ "n", "i", "v", "c", "t" }, "<A-4>", function()
  vim.api.nvim_set_current_buf(vim.t.bufs[4])
end)
map({ "n", "i", "v", "c", "t" }, "<A-5>", function()
  vim.api.nvim_set_current_buf(vim.t.bufs[5])
end)
map({ "n", "i", "v", "c", "t" }, "<A-6>", function()
  vim.api.nvim_set_current_buf(vim.t.bufs[6])
end)
map({ "n", "i", "v", "c", "t" }, "<A-7>", function()
  vim.api.nvim_set_current_buf(vim.t.bufs[7])
end)
map({ "n", "i", "v", "c", "t" }, "<A-8>", function()
  vim.api.nvim_set_current_buf(vim.t.bufs[8])
end)
map({ "n", "i", "v", "c", "t" }, "<A-9>", function()
  vim.api.nvim_set_current_buf(vim.t.bufs[9])
end)

map({ "n", "v", "i", "t", "c" }, "<C-S-pageup>", "<cmd>lua require('nvchad.tabufline').move_buf(-1)<cr>")
map({ "n", "v", "i", "t", "c" }, "<C-S-pagedown>", "<cmd>lua require('nvchad.tabufline').move_buf(1)<cr>")

-- command
-- map({ "n", "v", "i", "t" }, "<C-S-p>", "<esc>:")
-- map({ "n", "v", "i", "t" }, "<C-p>", "<esc>:")
map({ "c" }, "<C-S-p>", "<esc>")
map({ "c" }, "<C-p>", "<esc>")
-- move line/lines

map("n", "<M-up>", "<Plug>GoNSMUp")
map("n", "<M-down>", "<Plug>GoNSMDown")
map("i", "<M-up>", "<esc><Plug>GoNSMUp")
map("i", "<M-down>", "<esc><Plug>GoNSMDown")

map("v", "<M-up>", "<Plug>GoVSMUp")
map("v", "<M-down>", "<Plug>GoVSMDown")
map("v", "<M-left>", "<Plug>GoVSMLeft")
map("v", "<M-right>", "<Plug>GoVSMRight")
-- terminal
map(
  { "n", "v", "i", "t", "c" },
  "<f12>",
  "<esc><cmd>lua require('nvchad.term').toggle({ pos = 'sp', id = 'htoggleTerm' })<cr>"
)
-- telescope / find
map({ "n", "v", "i", "t", "c" }, "<C-f>", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
map({ "n", "v", "i", "t", "c" }, "<C-e>", "<cmd>Telescope find_files<cr>")
map({ "n", "v", "i", "t", "c" }, "<f5>", "<cmd>Telescope oldfiles<cr>")
-- map({ "n", "v", "i", "t", "c" }, "<C-e>", "<cmd>Telescope buffers<CR><cr>")

-- create file
local function hh(file)
  api.fs.create(file)
  api.node.open.edit(file)
end

map({ "n", "v", "i", "t", "c" }, "<C-t>", hh)
-- vscode like end

-- fix ctrl+backspace start
map({ "n" }, "<C-BS>", '"_db')
map({ "v" }, "<C-BS>", '"_c')
map({ "i" }, "<C-BS>", "<C-w>")
map({ "t" }, "<C-BS>", "<C-w>")
map({ "c" }, "<C-BS>", "<C-w>")

map({ "n" }, "<C-h>", '"_db')
map({ "v" }, "<C-h>", '"_c')
map({ "i" }, "<C-h>", "<C-w>")
map({ "c" }, "<C-h>", "<C-w>")
map({ "t" }, "<C-h>", "<C-w>")
-- fix ctrl+backspace end

-- fix insert mode start
-- map({ "i" }, "<C-right>", "<esc>ea")
-- fix insert mode end

-- fix visual mode start
map({ "v" }, "<BS>", '"_c')
map({ "v" }, "<tab>", '"_c<tab>')
map({ "v" }, "<CR>", '"_c<cr>')
map({ "v" }, "d", '"_d')
map({ "v" }, "c", '"_c')

map({ "n", "v", "i" }, "<S-down>", "<S-down>")

map({ "n", "v", "i" }, "<S-up>", "<S-up>")

-- dont like strat
map({ "v" }, "<C-S-end>", "<S-end>")
map({ "v" }, "<C-S-home>", "<S-home>")
-- dont like end

map({ "v" }, "<C-S-right>", "e")

map({ "v" }, "<up>", "<esc><up>")
map({ "v" }, "<down>", "<esc><down>")
map({ "v" }, "<left>", "<esc><left>")
map({ "v" }, "<right>", "<esc><right>")
map({ "v" }, "<home>", "<esc><home>")
map({ "v" }, "<end>", "<esc><end>")

map({ "v" }, "<C-up>", "<esc><C-up>")
map({ "v" }, "<C-down>", "<esc><C-down>")
map({ "v" }, "<C-left>", "<esc>b")
map({ "v" }, "<C-right>", "<esc>e")
map({ "v" }, "<C-home>", "<esc><C-home>")
map({ "v" }, "<C-end>", "<esc><C-end>")

-- fix enter some char start
-- map({ "v" }, "q", "cq")
-- map({ "v" }, "w", "cw")
-- map({ "v" }, "e", "ce")
-- map({ "v" }, "r", "ct")
-- map({ "v" }, "a", "ca")
-- map({ "v" }, "s", "cs")
-- map({ "v" }, "f", "cf")
-- map({ "v" }, "g", "cg")
-- map({ "v" }, "z", "cz")
-- map({ "v" }, "x", "cx")
-- map({ "v" }, "c", "cc")
-- map({ "v" }, "v", "cv")
-- map({ "v" }, "b", "cb")
-- map({ "v" }, "y", "cy")
-- map({ "v" }, "u", "cu")
-- map({ "v" }, "i", "ci")
-- map({ "v" }, "o", "co")
-- map({ "v" }, "p", "cp")
-- map({ "v" }, "h", "ch")
-- map({ "v" }, "j", "cj")
-- map({ "v" }, "k", "ck")
-- map({ "v" }, "l", "cl")
-- map({ "v" }, "n", "cn")
-- map({ "v" }, "m", "cm")
-- map({ "v" }, "1", "c1")
-- map({ "v" }, "2", "c2")
-- map({ "v" }, "3", "c3")
-- map({ "v" }, "4", "c4")
-- map({ "v" }, "5", "c5")
-- map({ "v" }, "6", "c6")
-- map({ "v" }, "7", "c7")
-- map({ "v" }, "8", "c8")
-- map({ "v" }, "9", "c9")
-- map({ "v" }, "0", "c0")
--
-- map({ "v" }, "Q", "cQ")
-- map({ "v" }, "W", "cW")
-- map({ "v" }, "E", "cE")
-- map({ "v" }, "T", "cT")
-- map({ "v" }, "A", "cA")
-- map({ "v" }, "S", "cS")
-- map({ "v" }, "F", "cF")
-- map({ "v" }, "G", "cG")
-- map({ "v" }, "Z", "cZ")
-- map({ "v" }, "X", "cX")
-- map({ "v" }, "C", "cC")
-- map({ "v" }, "V", "cV")
-- map({ "v" }, "B", "cB")
-- map({ "v" }, "Y", "cY")
-- map({ "v" }, "U", "cU")
-- map({ "v" }, "I", "cI")
-- map({ "v" }, "O", "cO")
-- map({ "v" }, "P", "cP")
-- map({ "v" }, "H", "cH")
-- map({ "v" }, "J", "cJ")
-- map({ "v" }, "K", "cK")
-- map({ "v" }, "L", "cL")
-- map({ "v" }, "N", "cN")
-- map({ "v" }, "M", "cM")
-- map({ "v" }, "!", "c!")
-- map({ "v" }, "@", "c@")
-- map({ "v" }, "#", "c#")
-- map({ "v" }, "$", "c$")
-- map({ "v" }, "%", "c%")
-- map({ "v" }, "^", "c^")
-- map({ "v" }, "&", "c&")
-- map({ "v" }, "*", "c*")
-- fix enter some char end

-- fix visual mode end

-- fix normal mode start
map({ "n" }, "r", "R")
map({ "n" }, "<delete>", '"_x')
map({ "n" }, "<C-space>", "a")
map({ "n" }, "<C-r>", "a")
map({ "n" }, "<end>", "$<right>")
map({ "n" }, "<cr>", "i<cr>")
map({ "n", "v" }, "u", "<home>")
map({ "n", "v" }, "o", "$")
map({ "n" }, "<C-left>", "b")
map({ "n" }, "<C-right>", "e")
map("n", "yo", "y$")
map("n", "yu", "y<home>")
map("n", "gii", "gi")

-- move 5 lines up/down start
map({ "n", "i" }, "<C-up>", "<up><up><up><up><up>")
map({ "n", "i" }, "<C-down>", "<down><down><down><down>")
map({ "n", "i" }, "<C-end>", "<end>")
map({ "n", "i" }, "<C-home>", "<home>")
map("v", "<C-S-up>", "<S-up><S-up><S-up><S-up><S-up>")
map("v", "<C-S-down>", "<S-down><S-down><S-down><S-down>")
-- move 5 lines up/down end

-- fix delete in normal mode start
map({ "n" }, "d", '"_d')
map({ "n" }, "c", '"_c')
map({ "n" }, "du", '"_d<home>')
map({ "n" }, "do", '"_d<end>')
map({ "n" }, "cu", '"_c<home>')
map({ "n" }, "co", '"_c<end>')
-- fix delete in normal mode end
-- fix normal mode end

-- folding start
map({ "n", "i", "v" }, "<C-home>", "zc")
map({ "n", "i", "v" }, "<C-end>", "zo")
map({ "n", "i", "v" }, "<C-home>", "zc")
map({ "n", "i", "v" }, "<C-end>", "zo")

map({ "i" }, "<C-home>", "<esc>zc")
map({ "i" }, "<C-end>", "<esc>zo")
map({ "i" }, "<C-home>", "<esc>zc")
map({ "i" }, "<C-end>", "<esc>zo")
-- map("v", "zi", "zc")
-- map("v", "zk", "zo")
-- map("v", "zj", "zc")
-- map("v", "zl", "zo")

-- map("i", "zi", "<esc>zc")
-- map("i", "zk", "<esc>zo")
-- map("i", "zj", "<esc>zc")
-- map("i", "zl", "<esc>zo")

map("n", "zu", "mzgg<home>vG<end>zc`z")
map("n", "zo", "zR")
-- folding end

map({ "n" }, "<C-del>", "diw")
map({ "i" }, "<C-del>", "<esc><right>diwi")
map({ "v" }, "<C-del>", '"_d')

map("t", "<C-x>", "")
map("t", "<C-x>", "<C-x>")

map("n", "<f6>", "<cmd>lua require('nvim-treesitter.incremental_selection').init_selection()<cr><S-right>")
map("i", "<f6>", "<esc><cmd>lua require('nvim-treesitter.incremental_selection').init_selection()<cr><S-right>")
map("v", "<f6>", "<cmd>lua require('nvim-treesitter.incremental_selection').node_incremental()<cr><S-right>")

-- Multi cursor start
map("n", "<C-d>", "<cmd>lua require('nvim-treesitter.incremental_selection').init_selection()<cr><S-right>")
map("i", "<C-d>", "<esc><cmd>lua require('nvim-treesitter.incremental_selection').init_selection()<cr><S-right>")
map("v", "<C-d>", "<Plug>(VM-Find-Subword-Under)")
-- Multi cursor end

map({ "n", "i" }, "<f2>", function()
  require "nvchad.lsp.renamer"()
end)

map({ "n", "i" }, "<C-k>", '"_S')
-- map("n", "<M-d>", '<cmd>lua require("base46").toggle_transparency()<cr>')
map("n", "wi", '<cmd>lua require("nvchad.tabufline").closeOtherBufs()<cr>')
map("n", "wj", '<cmd>lua require("nvchad.tabufline").closeBufs_at_direction("left")<cr>')
map("n", "wl", '<cmd>lua require("nvchad.tabufline").closeBufs_at_direction("right")<cr>')

map({ "n", "v", "i", "t", "c" }, "<M-->", "<cmd>!node ~/Scripts/zorin/alacrittyDecreaseOpacity.js<cr><cr>")
map({ "n", "v", "i", "t", "c" }, "<M-=>", "<cmd>!node ~/Scripts/zorin/alacrittyIncreaseOpacity.js<cr><cr>")
map({ "n", "v", "i", "t", "c" }, "<M-d>", "<cmd>!node ~/Scripts/zorin/alacrittyToggleOpacity.js<cr><cr>")
map({ "n", "v", "i", "t", "c" }, "<M-t>", "<cmd>!node ~/Scripts/zorin/alacrittyRandomTheme.js<cr><cr>")
map({ "n" }, "amt", "<cmd>!node ~/Scripts/zorin/alacrittyMainTheme.js<cr><cr>")

