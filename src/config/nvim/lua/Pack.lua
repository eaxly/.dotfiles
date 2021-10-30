-- ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
-- ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
-- ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
--
-- File: ~/.config/nvim/lua/Packer.lua
-- By: @ExtinctAxolotll

local neoscroll_enable = false
-- packer.nvim
return require("packer").startup({
    function(use)
        -- Packer can manage itself
        use{ "wbthomason/packer.nvim" }

        -- Completion
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
        -- Functionality

        use { "tpope/vim-surround" }
        use {
            "RRethy/nvim-align",
            module = "align",
        }
        -- TODO(axolotl): add some keyindings for nvim-align

        use {
            "akinsho/toggleterm.nvim",
            config = function()
                require("plugins.term")
            end
        }

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
            "terrortylor/nvim-comment",
            config = function()
                require("plugins.comment")
            end,
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

        use{
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("plugins.trouble")
            end
        }
        -- === User Interface ===
        if neoscroll_enable then
            use {
                'karb94/neoscroll.nvim',
                config = function()
                    require("plugins.neoscroll")
                end,
            }
        end

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
                require("plugins.others").true_zen()
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
        use("EdenEast/nightfox.nvim")
        -- use("marko-cerovac/material.nvim")
        -- use("sainnhe/everforest")
        -- use("sainnhe/gruvbox-material")
        -- use("folke/tokyonight.nvim")
        -- use({ 'rose-pine/neovim', as = 'rose-pine' })
        -- use{ "Pocco81/Catppuccino.nvim" }

        -- lines
        use {
            "nvim-lualine/lualine.nvim",
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
        -- filetypes
        use {
            "elkowar/yuck.vim",
            ft = "yuck",
        }

        -- games
        use {
            "alec-gibson/nvim-tetris",
            cmd = "Tetris",
        }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if Packer_bootstrap then
            require('packer').sync()
        end
    end,
    -- make packer float (i believe i can flyyyyyyy )
    config = {
		display = {
			open_fn = function()
                return require("packer.util").float( {border = "rounded"} )
            end,
		},
	},
})
-- vim:foldmethod=marker
