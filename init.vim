set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorlino
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
"
"set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin()
" Plugin Section
"
" tablines and themes
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'

" for icons
Plug 'https://github.com/ryanoasis/vim-devicons'

" for automatic parenthesis and other pair matches while coding
Plug 'jiangmiao/auto-pairs'

" github setup
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/junegunn/gv.vim'
"
"
Plug 'https://github.com/honza/vim-snippets'
if has('nvim') || has('patch-8.0.902')
    Plug 'https://github.com/mhinz/vim-signify'
else
    Plug 'https://github.com/mhinz/vim-signify', { 'branch': 'legacy' }
endif

" for file structure
Plug 'https://github.com/preservim/nerdtree'

" for commenting tingz
Plug 'https://github.com/tpope/vim-commentary'

" startup neo(vim)
Plug 'https://github.com/mhinz/vim-startify'

"Conqueror of Completion
Plug 'https://github.com/neoclide/coc.nvim', {'branch':'release'}

" Fuzzy finder
Plug 'https://github.com/junegunn/fzf'

" svelte setup
Plug 'https://github.com/othree/html5.vim'
Plug 'https://github.com/HerringtonDarkholme/yats.vim'
Plug 'https://github.com/evanleck/vim-svelte', {'branch':'main'}

" Color schemes
" Plug 'https://github.com/dracula/vim', {'as':'dracula'}
" Plug 'https://github.com/pineapplegiant/spaceduck', {'branch':'main'}
" Plug 'https://github.com/morhetz/gruvbox'
Plug 'morhetz/gruvbox'

Plug 'https://github.com/epilande/vim-react-snippets' " react snippets
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " TS
Plug 'https://github.com/nvim-treesitter/playground'

" ruby rails setup
Plug 'https://github.com/tpope/vim-rails'

" typescript setup
Plug 'https://github.com/MaxMEllon/vim-jsx-pretty'
Plug 'https://github.com/peitalin/vim-jsx-typescript'
Plug 'https://github.com/leafgarland/typescript-vim'


" dart flutter setup
Plug 'https://github.com/dart-lang/dart-vim-plugin'
Plug 'https://github.com/thosakwe/vim-flutter'
Plug 'https://github.com/natebosch/vim-lsc'
Plug 'https://github.com/natebosch/vim-lsc-dart'


" Tailwindcss coc
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

call plug#end()

" color schemes
if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
syntax enable

" colorscheme evening
" colorscheme dracula
" colorscheme spaceduck
autocmd vimenter * ++nested colorscheme gruvbox
"let g:lightline = {
"\ 'colorscheme': 'gruvbox'
"\ }

" nerdtree config
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

"Changing default NERDTree arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" airline config
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

"set italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" default updatetime 4000ms is not good for async update
set updatetime=100

" open new split panes to right and below
set splitright
set splitbelow

" coc settings

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \  'coc-eslint',
  \  'coc-prettier',
  \ ]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

nmap <leader>do <Plug>(coc-codeaction)

nmap <leader>rn <Plug>(coc-rename)

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L
" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Press i to enter insert mode, and ii to exit insert mode.
:inoremap ii <Esc>
:inoremap jk <Esc>
:inoremap kj <Esc>
:vnoremap jk <Esc>
:vnoremap kj <Esc>

" highlight and replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" map fuzzy finder
nnoremap <C-P> :FZF<CR>

" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>
" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

if has("python3")
    let g:python3_host_prog = '/d/Lenovo/AppData/Local/Programs/Python/Python39/python' 
endif

