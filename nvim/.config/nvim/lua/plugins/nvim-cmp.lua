return {
  -- O motor de completamento
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- Fonte para o LSP (essencial para Java/C)
      "hrsh7th/cmp-buffer",       -- Fonte para palavras no arquivo atual
      "hrsh7th/cmp-path",         -- Fonte para caminhos de arquivos
      "L3MON4D3/LuaSnip",         -- Engine de snippets
      "saadparwaiz1/cmp_luasnip", -- Integração do Luasnip com o cmp
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- Prioridade para o Java/C da faculdade
          { name = "luasnip" }, 
        }, {
          { name = "buffer" },
          { name = "path" },
        })
      })
    end,
  },
}
