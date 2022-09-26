let mapleader=","

" call plug#begin()
call plug#begin()
set rtp+=~/.fzf

" kitty
Plug 'fladson/vim-kitty'

" rust
Plug 'neovim/nvim-lspconfig'
Plug 'Shougo/deoplete-lsp'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'


" terraform
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'

Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'

" colorschemes
Plug 'ayu-theme/ayu-vim'
" syntax helpers
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pprovost/vim-ps1'
Plug 's3rvac/vim-syntax-yara'
Plug 'vim-scripts/splunk.vim'
" linters
Plug 'dense-analysis/ale'
" code
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'pangloss/vim-javascript'
Plug 'sebdah/vim-delve'
" helpers
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'mattn/emmet-vim'
Plug 'psliwka/vim-smoothie'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
" git
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'itchyny/vim-gitbranch'
" tagbar
Plug 'preservim/tagbar'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'christalib/nvim-splunk-linter'
call plug#end()

" setup rust_analyzer LSP (IDE features)
lua require'lspconfig'.rust_analyzer.setup{}

" Use LSP omni-completion in Rust files
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
" customise deoplete                                                                                                                                                     " maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 80)

" Press Tab to scroll _down_ a list of auto-completions
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#enable_at_startup = 1
set termguicolors     " enable true colors support
let ayucolor="mirage"
colorscheme ayu
"set laststatus=2
"set noshowmode
filetype plugin on
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamedplus
set complete-=i
set completeopt+=noselect
set confirm
set cursorline
set expandtab
set hidden
set hlsearch
set incsearch
set mouse+=a
set nobackup
set nu
set omnifunc=ale#completion#OmniFunc
set ruler
set shiftwidth=4
set smartindent
set smarttab
set so=10
set softtabstop=4
set tabstop=4
set textwidth=80
set title
set updatetime=100
set wildmenu
set wrap
" set virtualedit=all
"let NERDTreeQuitOnOpen = 1
autocmd BufNewFile,BufRead *.yar,*.yara setlocal filetype=yara
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd VimEnter * NERDTree

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <Leader>, <ESC>:w<CR>i
inoremap jj <ESC>:w<CR>
inoremap kk <ESC>:w<CR>
map <C-H> <C-W><C-H>
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>
map <C-m> :cprevious<CR>
map <C-n> :cnext<CR>
map <F4> :noh<CR>
map <F7> gg=G<C-o><C-o>
map <Leader>, :w<CR>
map <Leader>F <ESC>:FZF<CR>
map <Leader>G <ESC>:Rg<CR>
map <Leader>[ :bprevious<CR>
map <Leader>] :bnext<CR>
map <Leader>k :NERDTreeToggle <CR>
map <Leader>l :buffers list<CR>
map <leader>a :cclose <bar> lclose <bar> pclose<CR>
map <leader>s <C-w>s<CR><C-w><C-J>:term<CR>i
map <leader>v <C-w>v<CR><C-w><C-L>:term<CR>i
map <leader>~ :set spell spelllang=en_gb<CR>
map <silent> <C-j> <Plug>(ale_next_wrap)
map <silent> <C-k> <Plug>(ale_previous_wrap)
nnoremap <C-n> :norm
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings= {
    \ 'javascript.jsx' : {
    \ 'extends': 'jsx',
    \ },
\}
" These mappings will make it so that going to the next one in a search will
" center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
" Set this variable to 1 to fix files when you save them.
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'css': ['prettier', 'stylelint'],
      \   'javascript': ['eslint', 'prettier'],
      \   'python': ['isort', 'black'],
      \   'HTML': ['HTMLHint', 'proselint'],
      \   'ruby': ['rubocop'],
      \   'go': ['gofmt', 'goimports'],
      \}
let g:ale_linters = {
             \ 'go': ['staticcheck'],
             \ 'python': ['black'],
             \}
let g:ale_fix_on_save = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_hightlight_fields = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_addtags_transform = "camelcase"
" nerdCommenter
let g:ERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
" Default fzf layout
" - Popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

let g:terraform_fmt_on_save=1
let g:terraform_fold_sections=0
