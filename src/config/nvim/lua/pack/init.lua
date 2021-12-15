local present, packer = pcall(require, "pack.cfg")
if present then
  packer = require("packer")
else
  error("packer not found")
end

local use = packer.use
packer.reset()

-- packer.nvim
return packer.startup(function()
  use({
    "wbthomason/packer.nvim", -- Packer manages itself hehe
  })

  -- Impatient: Improve starup time and enable profiling
  use({
    "lewis6991/impatient.nvim",
  })

  -- nvim-lsoconfig: why are you even asking?!
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp")
    end,
  })
  -- nvim mapper: use telescope to search mappings
  use({
    "lazytanuki/nvim-mapper",
    config = function()
      require("plugins.others").mapper()
    end,
    before = "telescope.nvim",
  })

  -- coq: pretty good, but cmp is betta (except for path completion)
  use({
    "ms-jpq/coq_nvim",
    branch = "coq",
    config = function()
      require("plugins.coq")
    end,
    run = "<cmd>COQdeps<cr>",
    before = "nvim-lspconfig",
    disable = true,
  })

  -- thirdparties
  use({
    "ms-jpq/coq.thirdparty",
    config = function()
      require("plugins.coq_3p")
    end,
    after = "coq_nvim",
    disable = true,
  })

  -- nvim cmp: completion plugin
  use({
    "hrsh7th/nvim-cmp",
    -- plugins
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-calc",
    },
    config = function()
      require("plugins.cmp")
    end,
  })

  -- lspkind: show completion kind
  use({
    "onsails/lspkind-nvim",
  })

  -- nvim-autopairs: extremly good autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.autopairs")
    end,
  })

  -- luasnip: snippets
  use({
    "L3MON4D3/LuaSnip",
    config = function()
      require("plugins.others").snip()
    end,
    before = { "nvim-cmp" },
    after = { "cmp_luasnip", "friendly-snippets" },
  })

  -- friendly-snippets: snippet collection
  use({
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  })

  -- lsp_signature: show the signature
  use({
    "ray-x/lsp_signature.nvim",
    config = function()
      require("plugins.others").signature()
    end,
    after = { "nvim-lspconfig" },
  })

  -- lspsaga: supercharge the lsp
  use({
    "tami5/lspsaga.nvim",
    config = function()
      require("plugins.lspsaga")
    end,
    after = "nvim-lspconfig",
  })

  -- gitsigns: show signs for git in the signcolumn
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.others").gitsigns()
    end,
  })

  -- surround: edit surroundings
  use({
    "tpope/vim-surround",
  })

  -- align: align text
  use({
    "RRethy/nvim-align",
    module = "align",
  }) -- TODO(axolotl): add some keyindings for nvim-align

  -- toggleterm: supercharge the terminal
  use({
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugins.term")
    end,
  })

  -- telescope: can do basically everything
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
    config = function()
      require("plugins.telescope")
    end,
  })

  -- barbar: tabline, nothing to do with vikings
  use({
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugins.barbar")
    end,
  })

  -- suda: just edit sudo files (no sudo -e :DDDD)
  use({
    "lambdalisue/suda.vim",
    config = function()
      require("plugins.others").suda()
    end,
  })

  -- repeat: explains itself, repeats stuff
  use({
    "tpope/vim-repeat",
  })
  -- startup time: measure startup time
  -- kinda not useful anymore? (impatient.profile?)
  use({
    "dstein64/vim-startuptime",
    cmd = { "StartupTime" },
  })

  -- Comment.nvim: TJ approved commenting plugin :D
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.commenting")
    end,
  })

  -- glow: markdown preview in da nvim
  use({
    "ellisonleao/glow.nvim",
    config = function()
      require("plugins.others").glow()
    end,
    module = "glow",
    cmd = { "Glow", "GlowInstall" },
  })
  -- use({
  --     "folke/which-key.nvim",
  --     config = function()
  --         require("plugins.whichkey")
  --     end,
  --     disable = true,
  -- })

  -- mundo: undo tree
  -- TODO: remove? I am not really using this
  use({
    "simnalamburt/vim-mundo",
    config = function()
      require("plugins.others").mundo()
    end,
    cmd = { "MundoHide", "MundoShow", "MundoToggle" },
  })

  -- nvim-tree: file tree
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins.filetree")
    end,
    requires = { "airblade/vim-rooter" },
  })

  -- trouble: show lsp diagnostics in one place
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugins.trouble")
    end,
  })

  -- focus:
  use({
    "beauwilliams/focus.nvim",
    config = function()
      require("plugins.others").focus()
    end,
    event = "VimEnter",
  })

  -- neoscroll: very cool scrolling animations
  use({
    "karb94/neoscroll.nvim",
    config = function()
      require("plugins.neoscroll")
    end,
    event = "WinScrolled",
    disable = false,
  })

  -- TODO: not using this so remove in next cleanup
  use({
    "rktjmp/lush.nvim",
    cmd = { "Lushify", "LushRunTutorial", "LushRunQuickstart" },
    module = "lush",
  })

  -- twilight: focus on the code
  use({
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    module = "twilight",
  })

  -- zen: be the the calmest person ever when code isn't working
  use({
    "Pocco81/TrueZen.nvim",
    config = function()
      require("plugins.others").true_zen()
    end,
    cmd = { "TZAtaraxis", "TZFocus", "TZMinimalist" },
  })

  -- indent_blankline: show indent lines
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.others").blankline()
    end,
  })

  -- the colorscheme
  use({
    -- "__[nvim_color_url]__",
    "~/dev/frk/neovim",
    as = "__[nvim_color_name]__",
  })

  -- lualine: a statusline so easy to configure, it's alsmost boring
  -- take a look at galaxyline?
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.statusline")
    end,
  })

  -- treesitter: use this if you exist or i will dropkick you
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.treesitter")
    end,
    run = { ":TSUpdate" },
  })

  -- treesitter playground: the playground for treesitter
  use({
    "nvim-treesitter/playground",
  })

  -- colorizer: a colorizer that colorizes colors to show up in neovim
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugins.others").colorizer()
    end,
  })

  -- editorconfig: no idea why this is here
  use({
    "editorconfig/editorconfig-vim",
    cmd = { "EditorConfigEnable", "EditorConfigReload" },
  })

  -- alpha: dashboard on steroids
  use({
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugins.alpha")
    end,
    event = "VimEnter",
  })

  -- neorg: notes for modern neovim
  use({
    "nvim-neorg/neorg",
    setup = vim.cmd("autocmd BufRead,BufNewFile *.norg setlocal filetype=norg"),
    after = { "nvim-treesitter" }, -- you may also specify telescope
    ft = "norg",
    config = function()
      require("plugins.neorg")
    end,
  })

  -- yuck: 🤢 <- this is a compliment
  use({
    "elkowar/yuck.vim",
    ft = "yuck",
  })

  -- jsonc: jsonc support
  use({
    "neoclide/jsonc.vim",
    ft = "jsonc",
  })
end)
-- vim:foldmethod=marker
