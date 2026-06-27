return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  init = function()
    vim.g.mkdp_refresh_slow = 1

    -- Detecta se o ambiente atual é o WSL
    if vim.fn.has("wsl") == 1 then
      -- Configuração para rodar pelo Zen Browser do Windows
      vim.cmd([[
        function! OpenZenWSL(url)
          " Se o Zen estiver no PATH do Windows, apenas 'zen.exe' funciona.
          " Caso contrário, insira o caminho completo do executável do Windows.
          " Exemplo: 'C:\Users\Lucas\AppData\Local\Programs\Zen Browser\zen.exe'
          let zen_windows_path = 'zen.exe'
          
          " Usamos o cmd.exe para delegar a abertura ao Windows
          call jobstart(['cmd.exe', '/c', 'start', '', zen_windows_path, a:url])
        endfunction
      ]])
      vim.g.mkdp_browserfunc = 'OpenZenWSL'
    else
      -- Configuração original para o Flatpak no Linux Mint
      vim.cmd([[
        function! OpenZenFlatpak(url)
          call jobstart(['flatpak', 'run', 'app.zen_browser.zen', a:url])
        endfunction
      ]])
      vim.g.mkdp_browserfunc = 'OpenZenFlatpak'
    end
  end,
}
