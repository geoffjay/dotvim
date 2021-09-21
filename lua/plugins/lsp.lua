local lspconf = require("lspconfig")

function on_attach(client)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }
  -- Jump to definition
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- Jump to definition
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- Open code actions
  buf_set_keymap("n", "ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- Open code actions for the selected visual range
  buf_set_keymap("x", "ca", "<Cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
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
lspconf["solargraph"].setup({ on_attach = on_attach })

-- yarn global add pyright
lspconf["pyright"].setup({ on_attach = on_attach })

-- built into dart as --lsp, so that needs to be installed
lspconf["dartls"].setup({ on_attach = on_attach })

-- yarn global add yaml-language-server
lspconf["yamlls"].setup({ on_attach = on_attach })

-- yarn global add graphql-language-service-cli graphql
lspconf["graphql"].setup({
  on_attach = on_attach,
  filetypes = { "graphql", "gql" },
})

-- yarn global add vls
lspconf["vuels"].setup({ on_attach = on_attach })

-- see here: https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/
-- mkdir -p ~/.local/share && cd ~/.local/share
-- git clone --depth=1 https://github.com/sumneko/lua-language-server
-- cd lua-language-server && git submodule update --init --recursive
-- cd 3rd/luamake && ninja -f compile/ninja/<macos or linux>.ninja
-- cd ../.. && ./3rd/luamake/luamake rebuild
USER = vim.fn.expand("$USER")

local sumneko_root_path = ""
local sumneko_binary = ""

if vim.fn.has("mac") == 1 then
  sumneko_root_path = "/Users/" .. USER .. "/.local/share/lua-language-server"
  sumneko_binary = "/Users/"
    .. USER
    .. "/.local/share/lua-language-server/bin/macOS/lua-language-server"
elseif vim.fn.has("unix") == 1 then
  sumneko_root_path = "/home/" .. USER .. "/.local/share/lua-language-server"
  sumneko_binary = "/home/"
    .. USER
    .. "/.local/share/lua-language-server/bin/Linux/lua-language-server"
else
  print("Unsupported system for sumneko")
end

lspconf["sumneko_lua"].setup({
  on_attach = on_attach,
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
})

require("lspkind").init({
  symbol_map = {
    Enum = "",
    Constant = "",
    Struct = "",
  },
})
