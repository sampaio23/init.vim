vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use 'mbbill/undotree'

    use 'tpope/vim-fugitive'

    use {
        'stevearc/oil.nvim',
        requires = { { 'nvim-tree/nvim-web-devicons' } }
    }

    use {
        'folke/todo-comments.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
end)
