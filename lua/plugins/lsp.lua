local lspconf = require("lspconfig")

-- LSP setup:
--
-- yarn global add typescript-language-server
-- GO111MODULE=on go get golang.org/x/tools/gopls@latest
-- curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz \
--   | gunzip -c - > ~/.local/bin/rust-analyzer
-- chmod +x ~/.local/bin/rust-analyzer
-- yarn global add bash-language-server
-- gem install solargraph && solargraph bundle
-- yarn global add pyright
-- # dartls is built into dart as --lsp
-- yarn global add yaml-language-server
-- yarn global add vls
-- yarn global add graphql-language-service-cli graphql
-- brew install ccls || pacman -S ccls
--
-- Lua setup is more involved:
--
-- mkdir -p ~/.local/share && cd ~/.local/share
-- git clone --depth=1 https://github.com/sumneko/lua-language-server
-- cd lua-language-server && git submodule update --init --recursive
-- cd 3rd/luamake && ninja -f compile/ninja/<macos or linux>.ninja
-- cd ../.. && ./3rd/luamake/luamake rebuild
--
-- reference: https://www.chrisatmachine.com/Neovim/28-neovim-lua-development/

local M = {}

USER = vim.fn.expand("$USER")

M.config = function()
  local on_attach = function(client, bufnr)
    require("lsp_signature").on_attach(client)

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- FIXME: this fails on vim.scheduler callback?
    -- local function buf_set_option(...)
    --   vim.api.nvim_set_option(bufnr, ...)
    -- end
    -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- mappings
    local opts = { noremap = true, silent = true }
    -- jump to definition
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    -- jump to definition
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    -- open code actions
    buf_set_keymap("n", "ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    -- open code actions for the selected visual range
    buf_set_keymap(
      "x",
      "ca",
      "<Cmd>lua vim.lsp.buf.range_code_action()<CR>",
      opts
    )

    -- conditional autocmd on server_capabilities
    if client.resolved_capabilities.document_highlight then
      vim.api.nvim_exec(
        [[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=#3B4252
        hi LspReferenceText cterm=bold ctermbg=red guibg=#3B4252
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=#3B4252
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
        false
      )
    end
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()

  -- code actions
  capabilities.textDocument.codeAction = {
    dynamicRegistration = true,
    codeActionLiteralSupport = {
      codeActionKind = {
        valueSet = (function()
          local res = vim.tbl_values(vim.lsp.protocol.CodeActionKind)
          table.sort(res)
          return res
        end)(),
      },
    },
  }

  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- LSPs
  local servers = {
    "bashls",
    "ccls",
    "dartls",
    "gopls",
    "pyright",
    "rust_analyzer",
    "solargraph",
    "tsserver",
    "vuels",
    "yamlls",
  }

  for _, lsp in ipairs(servers) do
    lspconf[lsp].setup({ capabilities = capabilities, on_attach = on_attach })
  end

  lspconf["ccls"].setup({
    init_options = {
      compilationDatabaseDirectory = "_build",
    },
    on_attach = on_attach,
  })

  lspconf["graphql"].setup({
    on_attach = on_attach,
    filetypes = { "graphql", "gql" },
  })

  -- Lua LSP
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
    with_text = true,
    preset = "codicons",
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = "",
    },
  })
end

return M
