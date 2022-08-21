local fn = vim.fn

local command = vim.api.nvim_command

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
    print('Installing packer close and reopen Neovim...')
    command('packadd packer.nvim')
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

packer.startup(function()
    use 'wbthomason/packer.nvim'
    
    use 'folke/tokyonight.nvim'
    
    use 'nvim-treesitter/nvim-treesitter'
    
    use 'williamboman/nvim-lsp-installer'

    use 'akinsho/bufferline.nvim'   
    
    use 'jose-elias-alvarez/null-ls.nvim'
    
    use 'hrsh7th/cmp-nvim-lsp'
    
    use 'hrsh7th/cmp-buffer'
    
    use 'hrsh7th/cmp-path'
    
    use 'ahmedkhalf/project.nvim' 

    use 'hrsh7th/cmp-cmdline'
    
    use 'hrsh7th/nvim-cmp'
    
    use 'goolord/alpha-nvim'
    
    use 'saadparwaiz1/cmp_luasnip'
    
    use 'L3MON4D3/LuaSnip'

    use 'andweeb/presence.nvim'

    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

    use {"akinsho/toggleterm.nvim", tag = 'v2.*'}

    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
      'filipdutescu/renamer.nvim',
      branch = 'master',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      }
    }

    use {
    'abecodes/tabout.nvim',
      config = function()
      require('tabout').setup {
      tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
      backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
      act_as_tab = true, -- shift content if tab out is not possible
      act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
      default_shift_tab = '<C-d>', -- reverse shift default action,
      enable_backwards = true, -- well ...
      completion = true, -- if the tabkey is used in a completion pum
      tabouts = {
        {open = "'", close = "'"},
        {open = '"', close = '"'},
        {open = '`', close = '`'},
        {open = '(', close = ')'},
        {open = '[', close = ']'},
        {open = '{', close = '}'}
      },
      ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
      exclude = {} -- tabout will ignore these filetypes
  }
    end,
	  wants = {'nvim-treesitter'}, -- or require if not used so far
	  after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
  }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end

    use 'folke/which-key.nvim'

end)

local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end 

if status_ok then 
  vim.cmd("colorscheme tokyonight")
end

lualine.setup {
  options = {
    theme = 'tokyonight'
  }
} 

require('./packages')
