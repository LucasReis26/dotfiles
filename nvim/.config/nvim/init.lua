vim.keymap.set('n','<c-l>',':wincmd l<CR>')
vim.keymap.set('n','<c-k>',':wincmd k<CR>')
vim.keymap.set('n','<c-j>',':wincmd j<CR>')
vim.keymap.set('n','<c-h>',':wincmd h<CR>')

require('config.lazy')
vim.o.number = true
vim.o.relativenumber = true
vim.o.cindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.guifont = "FiraCode_Nerd_Font:h14"
vim.cmd('syntax enable')

vim.keymap.set('n','<c-t>', ':split<cr><c-w>j:term<cr>:res 10<cr>i')
vim.keymap.set('t','<esc><esc>','<c-\\><c-n>')
vim.keymap.set('v','<leader>y','"+y')
vim.keymap.set('n','<leader>yy','"+yy')
vim.keymap.set('n','<leader>p','"+p')
vim.keymap.set('i','jj','<esc>')
vim.keymap.set('n','<leader>=','gg0vG$=')

vim.keymap.set('n','<esc>',function()
	if vim.v.hlsearch == 1 then
		vim.cmd('nohlsearch')
	end
end, {silent = true})

vim.api.nvim_create_autocmd("TermOpen",{
	pattern="*",
	callback = function()
		vim.keymap.set('t','<c-t>',[[exit<cr>]])
	end
})

vim.g.db_ui_env_variable_url = 'DATABASE_URL'


