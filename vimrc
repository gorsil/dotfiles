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
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'sheerun/vim-polyglot'

" Golang
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Python
Plug 'mitsuhiko/vim-jinja'
Plug 'mitsuhiko/vim-python-combined'

" Saltstack
Plug 'saltstack/salt-vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

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

" Colorscheme config
let g:lucius_style = 'dark'
let g:lucius_contrast_bg = 'high'
colorscheme lucius

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

map <C-n> :NERDTreeToggle<CR>
let g:nerdtree_tabs_focus_on_files=1

let g:airline_theme = "bubblegum"
let g:airline#extensions#branch#enabled = 1
let g:rainbow_active = 1

" Go settings
" let g:go_auto_type_info = 1
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_generate_tags = 1
" let g:go_highlight_extra_types = 1
"
" augroup go
"   au!
"   au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
"   au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
"   au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
"   au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
"
"   au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
"   au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
"   au FileType go nmap <Leader>db <Plug>(go-doc-browser)
"
"   au FileType go nmap <leader>r  <Plug>(go-run)
"   au FileType go nmap <leader>t  <Plug>(go-test)
"   au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
"   au FileType go nmap <Leader>i <Plug>(go-info)
"   au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
"   au FileType go nmap <C-g> :GoDecls<cr>
"   au FileType go nmap <leader>dr :GoDeclsDir<cr>
"   au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
"   au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
"   au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>
" augroup END

" Ale settings
let g:ale_fix_on_save = 1
let b:ale_linters = {
\	'go': ['gometalinter'],
\	'json': ['jsonlint'],
\	'javascript': ['eslint', 'flow'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['gofmt', 'goimports'],
\   'python': ['autopep8'],
\}
", 'yapf'],

let g:ale_linters_explicit = 1
let g:ale_go_gometalinter_options = '--fast --enable=staticcheck --enable=gosimple --enable=unused'
" let g:ale_python_autopep8_options = '--max-line-length 120'
" let g:ale_python_flake8_options = '--max-line-length 120 --ignore=F405'

" let g:ale_java_google_java_format_options = '-a --skip-sorting-imports'

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

nmap <C-m> <Plug>MarkdownPreviewToggle

" augroup autoformat_settings
"   autocmd FileType bzl AutoFormatBuffer buildifier
"   autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
"   autocmd FileType dart AutoFormatBuffer dartfmt
"   autocmd FileType go AutoFormatBuffer gofmt
"   autocmd FileType gn AutoFormatBuffer gn
"   autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
"   autocmd FileType java AutoFormatBuffer google-java-format
"   autocmd FileType python AutoFormatBuffer yapf
"   " Alternative: autocmd FileType python AutoFormatBuffer autopep8
"   autocmd FileType rust AutoFormatBuffer rustfmt
"   autocmd FileType vue AutoFormatBuffer prettier
" augroup END
"
" lua require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
" autocmd BufEnter * lua require'completion'.on_attach()

autocmd FileType java setlocal expandtab shiftwidth=4 tabstop=8
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 formatoptions+=croq softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType python set colorcolumn=0
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
