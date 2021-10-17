call plug#begin()

" General
Plug 'w0rp/ale' " Async linting and style fixing
Plug 'tmhedberg/SimpylFold' " Folding

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/completion-treesitter'

" Visuals
Plug 'bling/vim-airline' " Airline
Plug 'vim-airline/vim-airline-themes' " Airline themes
Plug 'zivyangll/git-blame.vim' " git blame
Plug 'airblade/vim-gitgutter' " Show git edits
Plug 'mhinz/vim-signify' " Show VCS edits
Plug 'Yggdroot/indentLine' " Show indentations
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
set foldmethod=syntax
set foldlevelstart=10
set foldnestmax=3
syntax enable
filetype plugin indent on

" Fabulousness settings
if has('termguicolors')
    set termguicolors
endif

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

nnoremap <C-n> :NvimTreeToggle<CR>
" map <C-n> :NERDTreeToggle<CR>
" let g:nerdtree_tabs_focus_on_files=1

" Ale settings
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
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
require'lspconfig'.pylsp.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.denols.setup{}
require'lspconfig'.ansiblels.setup{}

require'nvim-treesitter.configs'.setup {
  highlight = {enable = true},
  incremental_selection = {enable = true},
}

vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'lsp' } },
    { complete_items = { 'buffers' } },
    { mode = { '<c-p>' } },
    { mode = { '<c-n>' } }
  },
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup{
  view = {
    mappings = {
	  list = {
        { key = "s", cb = tree_cb("vsplit") },
        { key = "h", cb = tree_cb("split") },
        { key = "t", cb = tree_cb("tabnew") },
      }
    }
  }
}

EOF

autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Allow russian for vim controls
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Toggle Markdown (MD) preview
nmap <C-m> <Plug>MarkdownPreviewToggle

autocmd FileType java setlocal expandtab shiftwidth=4 tabstop=8
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 formatoptions+=croq softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType python set colorcolumn=0
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
