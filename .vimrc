set number
set relativenumber
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab

syntax enable

filetype plugin on

let mapleader = " "

" escape insert mode with jk
inoremap jk <Esc>

" leader e to go to file exporer
nnoremap <leader>e :Ex<CR>
autocmd FileType netrw noremap <leader>e :e #<CR>

"plugins
call plug#begin('~/.vim/plugged')

" Enable LSP (using coc.nvim)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Enable auto-pairing for brackets, quotes, etc.
Plug 'jiangmiao/auto-pairs'

" Install fzf
" using telescope to search for files
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

" ale
Plug 'dense-analysis/ale'

"gruvbox theme
Plug 'morhetz/gruvbox'

" Install plenary.nvim (Lua dependency)
Plug 'nvim-lua/plenary.nvim'

" Install Telescope.nvim
Plug 'nvim-telescope/telescope.nvim'


call plug#end()

"have to set colorscheme at the end of the file
colorscheme gruvbox

if has("gui_running")
	hi Normal guibg=none
else
	hi Normal ctermbg=NONE
endif

" Use Tab and Shift+Tab to navigate the autocomplete suggestions
inoremap <silent> <expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<TAB>"
inoremap <silent> <expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) :"\<S-TAB>"

" Use Enter to select a suggestion
inoremap <silent> <expr> <CR> coc#pum#visible() ? coc#confirm() : "\<CR>" 

" Use Ctrl+Space to trigger completion
" using telescope to search for files
inoremap <silent> <C-Space> coc#refresh()

let $VIM = expand('$HOME/.vim')

" fuzzy finder bindings
nnoremap <leader>ff :Files<CR>
