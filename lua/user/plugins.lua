local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim", commit = "b134cba054e4398f6e3b389deedabb26916cee84" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" } -- Autopairs, integrates with both cmp and treesitter
  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }
  use { "JoosepAlviste/nvim-ts-context-commentstring"}
  use { "kyazdani42/nvim-web-devicons" }
  use { "kyazdani42/nvim-tree.lua", commit = "59e65d88db177ad1e6a8cffaafd4738420ad20b6" }
  use { "akinsho/bufferline.nvim", tag = "v4.4.0" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }
  use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }
  use { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" }
  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
  use { "lukas-reineke/indent-blankline.nvim", tag = "v3.3.2" }
  use { "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" }
  use { "folke/which-key.nvim", commit = "16ed12a8493628c377606da2ebac50d80736ed37" }
  use { "jamestthompson3/nvim-remote-containers", commit = "5c689be74f726806754d67de4eb21539c8efb620" }
  use { "tpope/vim-surround", commit = "aeb933272e72617f7c4d35e1f003be16836b948d" }
  use { "tpope/vim-repeat", commit = "8106e142dfdc278ff3eaaadd7b362ad7949d4357" }
  use { "cdelledonne/vim-cmake", tag = "v0.12.1" }
  use { "folke/trouble.nvim", tag = "v1.0.0" }
  use { "mg979/vim-visual-multi", tag = "v0.5.8" }
  use { "liuchengxu/vista.vim", commit = "33774aff5d8b224f24c2e4c6015c613c1a17bf74" }
  use {
  "junegunn/fzf",
  run = function()
  vim.fn["fzf#install"]()
  end,
  }
  use { "junegunn/fzf.vim" }
  use {
  "iamcco/markdown-preview.nvim",
  commit = "02cc3874738bc0f86e4b91f09b8a0ac88aef8e96",
  run = function()
  vim.fn["mkdp#util#install"]()
  end,
  }
  use { "nvim-pack/nvim-spectre", commit = "1d8b7a40677fd87da7648d246c4675c3612a7582" }
  
  -- Colorschemes
  use { "folke/tokyonight.nvim", commit = "66bfc2e8f754869c7b651f3f47a2ee56ae557764" }
  use { "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" }
  
  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
  
  -- snippets
  use { "L3MON4D3/LuaSnip", tag = "v1.2.1" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use
  
  -- LSP
  -- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "bfc5997e52fe9e20642704da050c415ea1d4775f" }
  use { "williamboman/mason-lspconfig.nvim", commit = "0eb7cfefbd3a87308c1875c05c3f3abac22d367c" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" }
  
  -- Telescope
  use { "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" }
  use { "nvim-telescope/telescope-fzf-native.nvim", commit = "580b6c48651cabb63455e97d7e131ed557b8c7e2" }
  
  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", tag = "v0.9.1" }
  
  -- Git
  use { "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" }
  
  -- DAP
  use { "mfussenegger/nvim-dap", commit = "6b12294a57001d994022df8acbe2ef7327d30587" }
  use { "rcarriga/nvim-dap-ui", commit = "1cd4764221c91686dcf4d6b62d7a7b2d112e0b13" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
