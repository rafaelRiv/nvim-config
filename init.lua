local vim = vim
local Plug = vim.fn['plug#']

vim.g.maplocalleader = '\\'

vim.call('plug#begin')

-- Colors scheme
Plug ('polirritmico/monokai-nightasty.nvim')

-- Language plugins
Plug ('edwinb/idris2-vim')
Plug ('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && npx --yes yarn install'})
Plug ('neoclide/coc.nvim', {['do'] = 'yarn install --frozen-lockfile'})

-- Developer plugins
Plug ('nvim-tree/nvim-tree.lua')
Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim')
Plug ('startup-nvim/startup.nvim')

vim.call('plug#end')

-- Colors Scheme configuration
vim.opt.background = "dark" -- default to dark or light style
vim.cmd.colorscheme("monokai-nightasty")

-- Startup config

require("startup").setup({theme = "startify"})

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


-- Key mapping

local builtin = require('telescope.builtin')

vim.api.nvim_set_keymap("n","t", ":NvimTreeToggle<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<C-s>", ":MarkdownPreview<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<M-s>", ":MarkdownPreviewStop<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<M-p>", ":MarkdownPreviewToggle<cr>", { noremap = true })


vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
