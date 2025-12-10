---------------- Keymaps ----------------
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)

vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("i", "<S-Tab>", "<C-d>")

vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set({"n", "x"}, "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set({'n', 'v', 'x'}, "<C-Up>", "<C-w><Up>")
vim.keymap.set({'n', 'v', 'x'}, "<C-Down>", "<C-w><Down>")
vim.keymap.set({'n', 'v', 'x'}, "<C-Left>", "<C-w><Left>")
vim.keymap.set({'n', 'v', 'x'}, "<C-Right>", "<C-w><Right>")

--map <leader>c :w \| !compiler <C-r>%<CR><CR>
--map <leader>p :!opout <C-r>%<CR><CR>

----------------Set ----------------
vim.opt.nu = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.wrap = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.winborder = 'rounded'

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

---------------- Colorscheme ----------------
vim.cmd[[ colorscheme koehler ]]

-- Apply custom highlight groups for floating windows
vim.api.nvim_set_hl(0, "NormalFloat", {
    -- Link the floating window background to the default background color
    link = "Normal"
})
vim.api.nvim_set_hl(0, "FloatBorder", {
    -- Link the border color to a less distracting color from the theme,
    -- like the comment color or the secondary Pmenu color.
    link = "Comment"
    -- If 'Comment' is too dark, try 'Pmenu' or 'StatusLine' 
})
-- Define the selection line background and foreground
vim.api.nvim_set_hl(0, "TelescopeSelection", {
    -- Link the background to the Pop-up Menu selection background (e.g., PmenuSel)
    link = "PmenuSel"
})

---------------- LSP ----------------
vim.lsp.enable('c_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('python_ls')
vim.lsp.enable('rust_ls')

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })

            vim.keymap.set('i', '<C-Space>', function()
                vim.lsp.completion.get()
            end)

            vim.keymap.set('i', '<C-k>', function()
                vim.lsp.buf.signature_help()
            end)

            vim.keymap.set('n', '<leader>de', function()
                vim.diagnostic.open_float()
            end)

            vim.keymap.set('n', 'gd', function()
                vim.lsp.buf.definition()
            end)
        end
    end,
})

vim.diagnostic.config({
    signs = false,
})

---------------- Legacy ----------------

--autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

--map <leader>f :Goyo \| set linebreak<CR>

--map <leader>o :setlocal spell! spelllang=en_us<CR>

--call plug#begin()
--Plug 'rust-lang/rust.vim'
--Plug 'junegunn/goyo.vim'
--Plug 'nvim-lua/plenary.nvim'
--Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
--call plug#end()

--autocmd BufRead,BufNewFile *.tex set filetype=tex

--autocmd BufWritePre * %s/\s\+$//e

--map <leader><leader> :keepp /<++><CR>ca<
--imap <leader><leader> <Esc>:keepp /<++><CR>ca<

--autocmd FileType tex inoremap ;e \begin{equation}<Enter><Enter>\end{equation}<Enter><Enter><++><Esc>3kA<Tab>
--autocmd FileType tex inoremap ;$ $$<Space><++><Esc>T$hi
--autocmd FileType tex inoremap ;b \textbf{}<Space><++><Esc>T{i
--autocmd FileType tex inoremap ;i \textit{}<Space><++><Esc>T{i
--autocmd FileType tex inoremap ;r \ref{}<Space><++><Esc>T{i
--autocmd FileType tex inoremap ;c \cite{}<Space><++><Esc>T{i
--autocmd FileType tex inoremap ;f \begin{frame}<Enter>\frametitle{\large }<Enter><++><Enter>\end{frame}<Enter><Enter><++><Esc>4kt}a
--autocmd FileType tex inoremap ;l \begin{itemize}<Enter>\item <Enter>\item <++><Enter>\end{itemize}<Esc>2ka

--nnoremap <leader>fb <cmd>Telescope buffers<CR>
--nnoremap <leader>ff <cmd>Telescope find_files<CR>
