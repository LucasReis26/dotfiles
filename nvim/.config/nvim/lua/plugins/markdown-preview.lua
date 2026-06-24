return{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  init = function()
    -- 1. Criamos a função em Vimscript para o Neovim separar os argumentos
    vim.cmd([[
      function! OpenZenFlatpak(url)
        call jobstart(['flatpak', 'run', 'app.zen_browser.zen', a:url])
      endfunction
    ]])
    
    -- 2. Dizemos ao plugin para ignorar o navegador padrão e usar a nossa função
    vim.g.mkdp_browserfunc = 'OpenZenFlatpak'
vim.g.mkdp_refresh_slow = 1
  end,
}
