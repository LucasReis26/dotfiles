return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- Garante que o plugin carregue nos eventos certos
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = { 
      "c", "lua", "vim", "vimdoc", "query", 
      "markdown", "markdown_inline", "java", "cpp", "latex" 
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  },
  config = function(_, opts)
    -- Isso resolve o problema do LaTeX com o seu tree-sitter CLI 0.26.3
    require('nvim-treesitter.install').prefer_git = true
    
    -- Tenta carregar o módulo de configuração (compatível com v0.9 e v1.0)
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if status_ok then
      configs.setup(opts)
    end
  end,
}

