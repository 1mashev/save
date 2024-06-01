require "nvchad.options"

-- Wayland install if clipboard is not working
-- sudo apt install wl-clipboard

-- add yours here!
local o = vim.o
local w = vim.wo
local b = vim.bo

-- vim.o.keymodel = "startsel,stopsel"
o.keymodel = "startsel"
o.termguicolors = true
o.so = 5
o.selection = "exclusive"
w.wrap = false
o.virtualedit = "onemore"

-- vim.opt.matchparen = true

-- b.autoindent = true
-- b.expandtab = true
-- b.smartindent = true
-- b.modeline = false

-- w.winfixwidth = true

o.autochdir = false
-- o.lazyredraw = true -- отключает перерисовку экрана во время выполнения макросов
o.termguicolors = true
vim.g.editorconfig = true
-- vim.o.cursorlineopt = "both" -- to enable cursorline!

