local cmp = require'cmp'

local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 25
local MAX_KIND_WIDTH = 14

local get_ws = function (max, len)
    return (" "):rep(max - len)
end

local format = function(_, item)
    local content = item.abbr
    -- local kind_symbol = symbols[item.kind]
    -- item.kind = kind_symbol .. get_ws(MAX_KIND_WIDTH, #kind_symbol)

    if #content > MAX_LABEL_WIDTH then
        item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
    else
        item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
    end

    return item
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp',
            max_item_count = 5
        },
        { name = 'vsnip' }, -- For vsnip users.
    }, {
            { name = 'buffer' },
        }),
    formatting = {
        format = format,
    }
})
--
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' ,
            max_item_count = 5}
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = cmp.config.sources({
--        { name = 'path', 
--            max_item_count = 5,
--        }
--    }, {
--            { name = 'cmdline' ,
--                max_item_count = 5,
--            }
--        })
--})
