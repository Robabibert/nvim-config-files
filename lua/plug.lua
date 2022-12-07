--[[ plug.lua ]]
local ensure_packer = function()
  local fn = vim.fn
  local install_path = '/root/.local/share/nvim/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end


local packer_bootstrap = ensure_packer()
return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim' -- colorscheme
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'xiyaowong/nvim-transparent' -- enable transparency
    use 'simrat39/symbols-outline.nvim' -- enable symbols tab
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' } -- good folding
    use "max397574/better-escape.nvim" -- faster jj / kshadowk
    --use 'jose-elias-alvarez/null-ls.nvim' -- Use Vale as a prose linter
    use 'williamboman/mason-lspconfig.nvim' -- closes gaps with mason
    use 'tanvirtin/monokai.nvim' -- Color scheme
    use { 'kyazdani42/nvim-tree.lua', -- Filesystem navigation
        requires = 'kyazdani42/nvim-web-devicons' } -- Filesystem icons
    use { 'nvim-lualine/lualine.nvim', -- Statusline
        requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use {
        "windwp/nvim-autopairs", -- Autocomplete (), {}, []
        config = function() require("nvim-autopairs").setup {} end
    }
    use 'lewis6991/impatient.nvim' -- Makes neovim faster
    use 'tpope/vim-surround' -- Add "", '', (),
    use 'j-hui/fidget.nvim' -- sho status of nvim-lsp progress
    use {
        'goolord/alpha-nvim',
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    }
    
  use 'princejoogie/tailwind-highlight.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'RRethy/vim-illuminate' -- Highlight other uses of word under cursor
    use "lukas-reineke/indent-blankline.nvim" -- ident lines
    use 'numToStr/Comment.nvim' -- Enable comments
    use 'folke/trouble.nvim' -- Summarizes issues
    use 'folke/todo-comments.nvim' -- Todo comments
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- Make telescope faster
    use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
    use 'nvim-telescope/telescope-media-files.nvim' -- image files preview in telescope
    use 'numToStr/FTerm.nvim' -- Terminal in Lu-a
    use 'BurntSushi/ripgrep' -- Telescope grep
    use 'sharkdp/fd' -- Finder
    use 'neovim/nvim-lspconfig' -- Collection of common configurations for the Nvim LSP client
    use 'simrat39/rust-tools.nvim' -- rust-analyzer hints and more!
    use 'saecki/crates.nvim' -- Help managing crates dependencies
    use 'hrsh7th/vim-vsnip' -- Snippet engine
    use 'nvim-lua/popup.nvim' -- Poup for telescope
    use 'nvim-treesitter/nvim-treesitter' -- better syntax
    use 'm-demare/hlargs.nvim' -- Highlight argument definitions and usages
    use 'williamboman/mason.nvim' -- Manage LSPs and DAPs
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
use {'mfussenegger/nvim-dap'}
use {'nvim-telescope/telescope-dap.nvim'}
use {'mfussenegger/nvim-dap-python'}
use {'theHamsta/nvim-dap-virtual-text'}
use {'Pocco81/DAPInstall.nvim'}
    use {'neoclide/coc.nvim', branch = 'release'}
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} } -- debugger ui
    use {
        "folke/which-key.nvim",
        config = function()
          require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
        end
      }
    use {"kylechui/nvim-surround"}

    use{"iamcco/markdown-preview.nvim"}

    if packer_bootstrap then
        require('packer').sync()
    end
end)
