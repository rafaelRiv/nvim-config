local vim = vim
local Plug = vim.fn['plug#']

vim.g.maplocalleader = '\\'

vim.call('plug#begin')

-- Colors scheme
Plug ('polirritmico/monokai-nightasty.nvim')

-- Language plugins
Plug ('edwinb/idris2-vim')
Plug ('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && npx --yes yarn install'})
-- Developer plugins
Plug ('nvim-tree/nvim-tree.lua')
Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim')

vim.call('plug#end')

-- Colors Scheme configuration
vim.opt.background = "dark" -- default to dark or light style
vim.cmd.colorscheme("monokai-nightasty")

-- Nvim tree configuration

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.api.nvim_set_keymap("n","t", ":NvimTreeToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<C-s>", ":MarkdownPreview<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<M-s>", ":MarkdownPreviewStop<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<M-p>", ":MarkdownPreviewToggle<cr>", { noremap = true })

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
