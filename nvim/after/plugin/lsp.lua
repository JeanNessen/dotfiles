
--require 'lspconfig'.clangd.setup{}
---- Global mappings.
---- See `:help vim.diagnostic.*` for documentation on any of the below functions
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
--
---- Use LspAttach autocommand to only map the following keys
---- after the language server attaches to the current buffer
--vim.api.nvim_create_autocmd('LspAttach', {
--  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--  callback = function(ev)
--    -- Enable completion triggered by <c-x><c-o>
--    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
--
--    -- Buffer local mappings.
--    -- See `:help vim.lsp.*` for documentation on any of the below functions
--    local opts = { buffer = ev.buf }
--    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--    vim.keymap.set('n', '<space>wl', function()
--      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--    end, opts)
--    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--    vim.keymap.set('n', '<space>f', function()
--      vim.lsp.buf.format { async = true }
--    end, opts)
--  end,
--})

-- require'lspconfig'.rust_analyzer.setup{
--   settings = {
--     ['rust-analyzer'] = {
--       diagnostics = {
--         enable = false;
--       }
--     }
--   }
-- }

local function on_attach(client, buffer)
    -- This callback is called when the LSP is atttached/enabled for this buffer
    -- we could set keymaps related to LSP, etc here.
    local keymap_opts = { buffer = buffer }
    -- Code navigation and shortcuts
    vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.implementation, keymap_opts)
    vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
    vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, keymap_opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
    vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
    vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, keymap_opts)
    -- Set updatetime for CursorHold
    -- 300ms of no cursor movement to trigger CursorHold
    vim.opt.updatetime = 300

    -- Show diagnostic popup on cursor hover
    local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
        callback = function()
            vim.diagnostic.open_float(nil, { focusable = false })
        end,
        group = diag_float_grp,
    })

    -- Goto previous/next diagnostic warning/error
    vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, keymap_opts)
    vim.keymap.set("n", "g]", vim.diagnostic.goto_next, keymap_opts)
end

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}

--vim.diagnostic.config({
--    virtual_text = false,
--    signs = true,
--    update_in_insert = true,
--    underline = true,
--    severity_sort = false,
--    float = {
--        border = 'rounded',
--        source = 'always',
--        header = '',
--        prefix = '',
--    },
--})

local format_sync_grp = vim.api.nvim_create_augroup("Format", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format({ timeout_ms = 200 })
  end,
  group = format_sync_grp,
})

require("rust-tools").setup(opts)
