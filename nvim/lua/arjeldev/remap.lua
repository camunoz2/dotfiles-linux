-- Global
vim.g.mapleader = " "
vim.keymap.set("n", "<C-q>", vim.cmd.Ex)

-- Move selected lines up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")     -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")     -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- move line down(v)


-- Better vertical navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Better clipboard copy
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Keep search terms on the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Disble Q
vim.keymap.set("n", "Q", "<nop>")

-- Zen mode
vim.keymap.set("n", "<A-z>", ":ZenMode<CR>")


-- Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Select All
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Enable Quick Format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Comments
vim.keymap.set({ "n", "v" }, "<space>/", ":CommentToggle<CR>")
