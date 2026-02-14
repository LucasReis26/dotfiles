vim.keymap.set('n','<c-l>',':wincmd l<CR>')
vim.keymap.set('n','<c-k>',':wincmd k<CR>')
vim.keymap.set('n','<c-j>',':wincmd j<CR>')
vim.keymap.set('n','<c-h>',':wincmd h<CR>')
-- vim.opt.foldmethod = 'marker'

require('config.lazy')
require('commands.options')
require('commands.keymaps')
require('commands.notes')
require 'hex'.setup()
require('git').setup()
