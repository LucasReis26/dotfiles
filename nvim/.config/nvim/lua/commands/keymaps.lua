vim.keymap.set('n','<c-t>', ':split<cr><c-w>j:term<cr>:res 10<cr>i')
vim.keymap.set('t','<esc><esc>','<c-\\><c-n>')
vim.keymap.set('v','<leader>y','"+y')
vim.keymap.set('n','<leader>yy','"+yy')
vim.keymap.set('n','<leader>p','"+p')
vim.keymap.set('i','jj','<esc>')
vim.keymap.set('n','<leader>l',':Lazy<cr>')
vim.keymap.set('n','<leader>=','gg0vG$=')
vim.keymap.set('n','<leader>nd',':NoiceDismiss<cr>')
vim.keymap.set('n','<leader>oo',':ObsidianOpen<cr>')

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
