filetype plugin indent on
syntax on
set nocompatible

colorscheme zenburn

syntax enable

" enable matchit.vim and use '%' to jump between matching keywords
runtime macros/matchit.vim

set number
set display=lastline
" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

" map '%:h', which expands to the file path of the active buffer, to '%%'
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" normal mode mapping for fuzzy file finder fzf
nnoremap <C-p> :<C-u>FZF<CR>

"status line
set laststatus=2
set statusline=%<\ %f\ %m%r%y%w%=\ L:\ \%l\/\%L\ C:\ \%c\

" recommended settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" set up eslint for syntastic
let g:syntastic_javascript_checkers = ['jshint']

" let backspace work as expected
set backspace=indent,eol,start

" highlight search terms
set hlsearch

" set incremental search option
set incsearch

" shortcut to mute highlighting
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Mac OS X Clipboard Sharing
set clipboard=unnamed

" hidden buffers
set hidden

" mapping to make changing focus between windows easier (http://vimcasts.org/episodes/working-with-windows/)
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"enable fzf in vim by adding directory to &runtimepath
set rtp+=/usr/local/opt/fzf

