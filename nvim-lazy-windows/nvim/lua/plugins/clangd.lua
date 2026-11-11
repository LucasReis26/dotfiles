return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
            "--query-driver=C:\\msys64\\ucrt64\\bin\\gcc.exe,C:\\msys64\\ucrt64\\bin\\*.exe,C:\\msys64\\mingw64\\bin\\gcc.exe,C:\\msys64\\mingw64\\bin\\*.exe",
          },
        },
      },
    },
  },
}
