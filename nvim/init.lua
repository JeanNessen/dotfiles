-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("Jeanl")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


function nvim_tree()
    return {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    }
end

function treesitter()
    return {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
    }
end

function vimTmux()
    return {
        'christoomey/vim-tmux-navigator',
        lazy = false,
    }
end

function zk()
    return {
        "mickael-menu/zk-nvim",
        config = function()
            require("zk").setup({
                -- See Setup section below
            })
        end
    }
end

function telescope()
	return {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		dependencies = { 'nvim-lua/plenary.nvim' }
	}
end

require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    "folke/which-key.nvim",
    nvim_tree(),
    treesitter(),
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    vimTmux(),
    "neovim/nvim-lspconfig",
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'simrat39/rust-tools.nvim',
    'nvim-lua/plenary.nvim',
    telescope(),
    zk(),
})

require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }



-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("zk").setup()
