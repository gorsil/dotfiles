call plug#begin()

" General
Plug 'w0rp/ale' " Async linting and style fixing
Plug 'tmhedberg/SimpylFold' " Folding

" Completion
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'habamax/vim-godot'
Plug 'rodjek/vim-puppet'

" Visuals
Plug 'bling/vim-airline' " Airline
Plug 'vim-airline/vim-airline-themes' " Airline themes
Plug 'zivyangll/git-blame.vim' " git blame
Plug 'airblade/vim-gitgutter' " Show git edits
Plug 'mhinz/vim-signify' " Show VCS edits
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'godlygeek/tabular' " Text aligning
Plug 'luochen1990/rainbow' " Rainbow brackets
Plug 'bronson/vim-trailing-whitespace'
Plug 'raimondi/delimitmate'

" Fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'sheerun/vim-polyglot'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'

" Python
Plug 'mitsuhiko/vim-jinja'
Plug 'mitsuhiko/vim-python-combined'

" Saltstack
Plug 'saltstack/salt-vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" Colorscheme
Plug 'sainnhe/sonokai'

call plug#end()

set wildmenu

highlight LineNr ctermfg=yellow ctermbg=darkgrey
highlight CursorLineNr ctermfg=yellow ctermbg=darkgrey

set ff=unix
set number
set relativenumber
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set foldlevelstart=10
set foldnestmax=3
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set mouse=
syntax enable
filetype plugin indent on

" Fabulousness settings
set termguicolors

let g:sonokai_style = "andromeda"
let g:sonokai_better_performance = 1
colorscheme sonokai

let g:airline_theme = "sonokai"
let g:airline#extensions#branch#enabled = 1

let g:rainbow_active = 1

" Switching windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" Search
set incsearch
set ignorecase
set smartcase
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" n movements
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" hjkl movements
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1

nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Toggle file tree viewer
nnoremap <C-n> :NvimTreeToggle<CR>

" Toggle Markdown (MD) preview
nmap <space>m <Plug>MarkdownPreviewToggle

let g:nvim_tree_group_empty = 1

" Ale settings
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'yaml': ['yamlfix'],
\    'go': ['gofmt', 'goimports'],
\    'python': ['autopep8'],
\}

let g:indentLine_enabled = 1
let g:indentLine_color_term=236

" Search highlighing
set hlsearch
map <silent> <leader><space> :set invhlsearch<cr>

" Fzf keybinds
nmap <space>/ :Ag<space>
nmap <space>. :Ag <C-r><C-w><cr>

lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {enable = true},
  incremental_selection = {enable = true},
}

  -- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  -- window = {
  --   -- completion = cmp.config.window.bordered(),
  --   -- documentation = cmp.config.window.bordered(),
  -- },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }, {
    { name = 'buffer' },
  })
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()
require'lspconfig'.pylsp.setup{capabilities = capabilities}
require'lspconfig'.gopls.setup{capabilities = capabilities}
require'lspconfig'.clangd.setup{capabilities = capabilities}
require'lspconfig'.denols.setup{capabilities = capabilities}
require'lspconfig'.ansiblels.setup{capabilities = capabilities}
require'lspconfig'.puppet.setup{capabilities = capabilities}
require'lspconfig'.gdscript.setup{capabilities = capabilities}

require("nvim-tree").setup()

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#363949 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#2b2d3a gui=nocombine]]

-- require("indent_blankline").setup {
--     char = "",
--     char_highlight_list = {
--         "IndentBlanklineIndent1",
--         "IndentBlanklineIndent2",
--     },
--     space_char_highlight_list = {
--         "IndentBlanklineIndent1",
--         "IndentBlanklineIndent2",
--     },
--     show_trailing_blankline_indent = false,
-- }
require("ibl").setup()

EOF

" " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
" " Manually trigger completion
" imap <silent> <c-p> <Plug>(completion_trigger)
"
" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
"
" " Avoid showing message extra message when using completion
" set shortmess+=c

" Allow russian for vim controls
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

autocmd FileType java setlocal expandtab shiftwidth=4 tabstop=8
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 formatoptions+=croq softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType python set colorcolumn=0
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
