local lspconf = require("lspconfig")

function on_attach(client)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
end

-- yarn global add typescript-language-server
lspconf["tsserver"].setup({ on_attach = on_attach })

-- GO111MODULE=on go get golang.org/x/tools/gopls@latest
lspconf["gopls"].setup({ on_attach = on_attach })

-- curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
-- chmod +x ~/.local/bin/rust-analyzer
lspconf["rust_analyzer"].setup({ on_attach = on_attach })

-- yarn global add bash-language-server
lspconf["bashls"].setup({ on_attach = on_attach })

-- gem install solargraph && solargraph bundle
lspconf["solargraph"].setup({})

-- yarn global add pyright
lspconf["pyright"].setup({})

-- yarn global add yaml-language-server
lspconf["yamlls"].setup({})

-- yarn global add graphql-language-service-cli graphql
lspconf["graphql"].setup({
  filetypes = { "graphql", "gql" },
})

-- yarn global add vls
lspconf["vuels"].setup({})

require("lspkind").init({
  symbol_map = {
    Enum = "",
    Constant = "",
    Struct = "",
  },
})
