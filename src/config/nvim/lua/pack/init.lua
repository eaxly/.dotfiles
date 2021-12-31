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

  -- nvim-lspconfig: why are you even asking?!
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lsp")
    end,
  })

  -- telescope: can do basically everything
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
    config = function()
      require("configs.telescope")
    end,
  })

  -- cheatsheet: cheatsheet goodness
  use({
    "sudormrfbin/cheatsheet.nvim",
    config = function ()
      require("configs.others").cheatsheet()
    end,
    requires = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    }
  })

  -- nvim cmp: completion plugin
  use({
    "hrsh7th/nvim-cmp",
    -- configs
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-calc",
    },
    config = function()
      require("configs.cmp")
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
      require("configs.autopairs")
    end,
    event = "InsertEnter",
  })

  -- luasnip: snippets
  use({
    "L3MON4D3/LuaSnip",
    config = function()
      require("configs.others").snip()
    end,
    before = { "nvim-cmp" },
    module = "luasnip",
    event = "InsertEnter",
  })

  -- friendly-snippets: snippet collection
  use({
    "rafamadriz/friendly-snippets",
    before = "nvim-cmp",
  })

  -- lsp_signature: show the signature
  use({
    "ray-x/lsp_signature.nvim",
    config = function()
      require("configs.others").signature()
    end,
    after = { "nvim-lspconfig" },
  })

  -- lspsaga: supercharge the lsp
  use({
    "tami5/lspsaga.nvim",
    config = function()
      require("configs.lspsaga")
    end,
    after = "nvim-lspconfig",
    event = "BufRead",
  })

  -- gitsigns: show signs for git in the signcolumn
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("configs.others").gitsigns()
    end,
    event = "BufRead",
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
      require("configs.term")
    end,
  })

  -- suda: just edit sudo files (no sudo -e :DDDD)
  use({
    "lambdalisue/suda.vim",
    config = function()
      require("configs.others").suda()
    end,
  })

  use({
    "lambdalisue/vim-manpager",
    cmd = "MANPAGER",
  })

  -- repeat: explains itself, repeats stuff
  use({
    "tpope/vim-repeat",
  })
  -- startup time: measure startup time
  -- kinda not useful anymore? (impatient.profile? nvm impatient doesn't work)
  use({
    "dstein64/vim-startuptime",
    cmd = { "StartupTime" },
  })

  -- Comment.nvim: TJ approved commenting plugin :D
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("configs.commenting")
    end,
  })

  -- glow: markdown preview in da nvim
  use({
    "ellisonleao/glow.nvim",
    config = function()
      require("configs.others").glow()
    end,
    module = "glow",
    cmd = { "Glow", "GlowInstall" },
  })

  -- mundo: undo tree
  -- TODO: remove? I am not really using this
  use({
    "simnalamburt/vim-mundo",
    config = function()
      require("configs.others").mundo()
    end,
    cmd = { "MundoHide", "MundoShow", "MundoToggle" },
  })

  -- nvim-tree: file tree
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("configs.filetree")
    end,
    requires = { "airblade/vim-rooter" },
  })

  -- trouble: show lsp diagnostics in one place
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("configs.trouble")
    end,
    module = "trouble",
  })

  -- focus:
  use({
    "beauwilliams/focus.nvim",
    config = function()
      require("configs.others").focus()
    end,
    event = "VimEnter",
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
      require("configs.others").true_zen()
    end,
    cmd = { "TZAtaraxis", "TZFocus", "TZMinimalist" },
  })

  -- indent_blankline: show indent lines
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("configs.others").blankline()
    end,
  })

  -- the colorscheme
  use({
    -- "__[nvim_color_url]__",
    "~/dev/frk/neovim",
    as = "__[nvim_color_name]__",
  })

  -- bufferline: bufferline plugin with style
  use({
    "akinsho/bufferline.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("configs.bufferline")
    end,
  })

  -- bufdelete: delete buffers
  use({
    "famiu/bufdelete.nvim"
  })

  -- lualine: a statusline so easy to configure, it's almost boring
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configs.statusline")
    end,
  })

  -- treesitter: use this if you exist or i will dropkick you
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("configs.treesitter")
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
      require("configs.others").colorizer()
    end,
    event = "BufRead",
  })

  -- editorconfig: self explains itself don't you think?
  use({
    "editorconfig/editorconfig-vim",
  })

  -- alpha: dashboard on steroids
  use({
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("configs.alpha")
    end,
  })

  -- neorg: notes for modern neovim
  use({
    "nvim-neorg/neorg",
    setup = vim.cmd("autocmd BufRead,BufNewFile *.norg setlocal filetype=norg"),
    after = { "nvim-treesitter" }, -- you may also specify telescope
    ft = "norg",
    config = function()
      require("configs.neorg")
    end,
    module = "neorg",
  })

  -- yuck: 🤢 <- this is a compliment
  use({
    setup = vim.cmd("autocmd BufRead,BufNewFile *.yuck setlocal filetype=yuck"),
    "elkowar/yuck.vim",
    ft = "yuck",
  })

  -- jsonc: jsonc support
  use({
    setup = vim.cmd("autocmd BufRead,BufNewFile *.jsonc setlocal filetype=jsonc"),
    "neoclide/jsonc.vim",
    ft = "jsonc",
  })

  -- parinfer: lisp like languages made easy
  use({
    after = "yuck.vim",
    "gpanders/nvim-parinfer",
  })
end)
-- vim:foldmethod=marker
