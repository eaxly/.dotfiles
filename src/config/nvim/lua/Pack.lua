-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/lua/Packer.lua
-- By: @ExtinctAxolotll

-- PackerInit {{{
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
end
-- }}}

vim.cmd([[packadd packer.nvim]])
vim.cmd([[autocmd BufWritePost PackerList.lua source <afile> | PackerCompile )]])

-- packer.nvim
return require("packer").startup({
    function(use)
        -- Packer can manage itself
        use{ "wbthomason/packer.nvim" }

        -- Completion
        use { "Shougo/vimproc.vim" }
        use {
            "neovim/nvim-lspconfig",
            config = function()
                require("plugins.lsp")
            end,
        }

        use {
            'ms-jpq/coq_nvim',
            branch = 'coq',
            config = function()
                require("plugins.coq")
            end,
        } -- main one
        use { 'ms-jpq/coq.artifacts', branch= 'artifacts'} -- 9000+ Snippets

        -- Git related plugins
        use {
            "lewis6991/gitsigns.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require("plugins.others").gitsigns()
            end,
        }
        use {
            "kdheepak/lazygit.nvim",
            cmd = { "LazyGit", "LazyGitConfig", "LazyGitFilter" },
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require("plugins.others").lazygit()
            end,
        }

        -- Functionality

        use { "tpope/vim-surround" }
        use {
            "RRethy/nvim-align",
            module = "align",
        }

        -- TODO(axolotl): add some keyindings for nvim-align
        -- fuzzy finder
        use {
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
            cmd = "Telescope",
            module = "telescope",

        }

        use{
            "lambdalisue/suda.vim",
            config = function()
                require("plugins.others").suda()
            end,
        }
        use{ "lambdalisue/pastefix.vim" }
        use{ "dstein64/vim-startuptime", cmd = { "StartupTime" } }
        use{
            setup = function()
                vim.g.kommentary_create_default_mappings = false
            end,
            "b3nj5m1n/kommentary",
        }

        use{
            "folke/which-key.nvim",
            config = function()
                require("plugins.whichkey")
                require("mappings")
            end,
        }

        use{ "simnalamburt/vim-mundo" }

        --[[ use({
            "kyazdani42/nvim-tree.lua",
            config = function()
                require("plugins.filetree")
            end
        }) ]] -- waiting until nvim-tree does correctly manage cwd
        -- until then, let's try lir.nvim

        use{
            "tamago324/lir.nvim",
            requires = {
                "nvim-lua/plenary.nvim",

                -- lir plugins
                "tamago324/lir-git-status.nvim",
            },
            config = function()
                require("plugins.lir")
            end,
        }

        use{ "folke/trouble.nvim" }

        -- === User Interface ===
        use {
            'karb94/neoscroll.nvim',
            config = function()
                require("plugins.neoscroll")
            end,
        }

        use{
            'rktjmp/lush.nvim',
            cmd = { "Lushify", "LushRunTutorial", "LushRunQuickstart" },
            module = "lush",
        }
        use {
            "folke/twilight.nvim",
            cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
            module = "twilight",
        }
        use {
            "Pocco81/TrueZen.nvim",
            config = function()
                require("true-zen").setup({
                    integrations = {
                        twilight = true,
                        lualine = true
                    }
                })
            end,
            cmd = { "TZAtaraxis", "TZFocus", "TZMinimalist" },
        }
        use{
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("plugins.others").blankline()
            end,
        }

        -- COLORSCHEME
        --[[ use("EdenEast/nightfox.nvim")
        use("marko-cerovac/material.nvim")
        use("sainnhe/everforest")
        use("sainnhe/gruvbox-material")
        use("folke/tokyonight.nvim")
        use({ 'rose-pine/neovim', as = 'rose-pine' }) ]]
        use{ "Pocco81/Catppuccino.nvim" }

        -- lines
        use {
            "hoob3rt/lualine.nvim",
            config = function()
                require("plugins.statusline")
            end,
        }
        use { "romgrk/barbar.nvim"}

        use { "nvim-treesitter/nvim-treesitter",
            config = function()
                require("plugins.treesitter")
            end,
            run = { ':TSUpdate'}
        }

        use { "kyazdani42/nvim-web-devicons" }
        use {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("plugins.others").colorizer()
            end,
        }

        use{
            "editorconfig/editorconfig-vim",
            cmd = { "EditorConfigEnable", "EditorConfigReload" },
        }

        use{
            "glepnir/dashboard-nvim",
            config = function()
                require("plugins.dashboard")
            end,
        }
    end,
    -- make packer float (i believe i can flyyyyyyy )
    config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
-- vim:foldmethod=marker
