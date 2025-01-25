local vim = vim
local Plug = vim.fn['plug#']

vim.g.maplocalleader = '\\'

vim.call('plug#begin')

-- Colors scheme
Plug ('polirritmico/monokai-nightasty.nvim')

-- Language plugins
--Plug ('edwinb/idris2-vim')
Plug ('neovim/nvim-lspconfig')
Plug ('MunifTanjim/nui.nvim')
Plug ('ShinKage/idris2-nvim')
Plug ('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && npx --yes yarn install'})
Plug ('neoclide/coc.nvim', {['do'] = 'yarn install --frozen-lockfile'})

-- Developer plugins
Plug ('nvim-tree/nvim-tree.lua')
Plug ('nvim-lua/plenary.nvim')
Plug ('nvim-telescope/telescope.nvim')
Plug ('startup-nvim/startup.nvim')
Plug ('vmchale/ats-vim')
Plug ('prettier/vim-prettier', { ['do'] = 'yarn install --frozen-lockfile --production', ['branch'] = 'release/0.x'})

vim.call('plug#end')

-- Colors Scheme configuration
vim.opt.background = "dark" -- default to dark or light style
vim.cmd.colorscheme("monokai-nightasty")

-- Startup config

require("startup").setup({theme = "startify"})

-- Set tab space
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

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

-- idris2 setup


local function save_hook(action)
  vim.cmd('silent write')
end

require('idris2').setup({code_action_post_hook = save_hook})


vim.cmd [[nnoremap <Leader>a <Cmd>lua require('idris2.code_action').add_clause();<CR>]]
vim.cmd [[nnoremap <Leader>c <Cmd>lua require('idris2.code_action').case_split()<CR>]]
vim.cmd [[nnoremap <Leader>mc <Cmd>lua require('idris2.code_action').make_case()<CR>]]
vim.cmd [[nnoremap <Leader>w <Cmd>lua require('idris2.code_action').make_with()<CR>]]
vim.cmd [[nnoremap <Leader>l <Cmd>lua require('idris2.code_action').make_lemma()<CR>]]
vim.cmd [[nnoremap <Leader>e <Cmd>lua require('idris2.code_action').expr_search()<CR>]]
vim.cmd [[nnoremap <Leader>r <Cmd>lua require('idris2.code_action').refine_hole()<CR>]]
vim.cmd [[nnoremap <Leader>g <Cmd>lua require('idris2.code_action').generate_def()<CR>]]
vim.cmd [[nnoremap <Leader>h <Cmd>lua require('idris2.code_action').expr_search_hints()<CR>]]
vim.cmd [[nnoremap <Leader>i <Cmd>lua require('idris2.code_action').intro()<CR>]]

vim.cmd [[nnoremap <Leader>s <Cmd>lua require('idris2.semantic').request()<CR>]]

vim.cmd [[nnoremap <Leader>os <Cmd>lua require('idris2.hover').open_split()<CR>]]
vim.cmd [[nnoremap <Leader>cs <Cmd>lua require('idris2.hover').close_split()<CR>]]

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
