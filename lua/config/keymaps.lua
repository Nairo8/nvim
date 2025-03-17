local utils = require("utils")
local keymap = utils.keymap

-- Save
keymap("n", "<C-s>", "<cmd>w<cr>", {desc = "Save"})

-- Move Lines
keymap("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move lines", silent = true })
keymap("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", { desc = "Move lines", silent = true })
keymap("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move lines", silent = true })
keymap("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move lines", silent = true })
keymap("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", { desc = "Move lines", silent = true })
keymap("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move lines", silent = true })

--Navigation in insert mode
keymap("i", "<C-k>", "<up>", { desc = "Move Cursor Up" })
keymap("i", "<C-j>", "<down>", { desc = "Move Cursor Down" })
keymap("i", "<C-h>", "<left>", { desc = "Move Cursor Left" })
keymap("i", "<C-l>", "<right>", { desc = "Move Cursor Right" })

-- Move to window using the <ctrl> hjkl keymap
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keymap
keymap("n", "<C-Up>", "<cmd>resize +4<cr>", { desc = "Increase window height" })
keymap("n", "<C-Down>", "<cmd>resize -4<cr>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -4<cr>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +4<cr>", { desc = "Increase window width" })

-- Split or swap windows
keymap("n", "<leader>wh", "<C-w>s", { desc = "Split horizontally" })
keymap("n", "<leader>wv", "<C-w>v", { desc = "Split vertically" })
keymap("n", "<leader>ws", "<C-w>x", { desc = "Swap windows" })

-- Better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Clear search
keymap("n", "<C-/>", "<cmd>nohlsearch<cr>", {desc = "Clear search"})

-- Keep clipboard after paste
keymap("x", "<leader>p", [["_dP]], {desc = "Keep paste"})

keymap("n", "<leader>qw", "<C-w>q", {desc = "Quit window"})
keymap("n", "<leader>qq", "<cmd>bprevious<bar>bdelete#<cr>", {desc = "Quit buffer"})
keymap("n", "<leader>qa", "<cmd>qa<cr>", {desc = "Quit all"})

-- Center cursor when scrolling page
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up and Center Page" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down and Center Page" })

-- Move between buffers
keymap("n", "]b", function()
  vim.cmd("bnext")
end, {desc = "Next Buffer"})
keymap("n", "[b", function()
  vim.cmd("bprevious")
end, {desc = "Previous Buffer"})
-- Keep search term in the middle of screen
keymap("n", "n", "nzzzv", { desc = "Next Search Item" })
keymap("n", "N", "Nzzzv", { desc = "Previous Search Item" })

keymap("i", "<C-BS>", "<C-W>", {silent = true})
keymap("n", "<leader>tt", utils.toggle_transparency, { desc = "Toggle transparency" })
