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

"add minpac
packadd minpac
call minpac#init()

"add plugins using minpac
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('jnurmine/Zenburn')
call minpac#add('altercation/vim-colors-solarized')
call minpac#add('tpope/vim-vinegar')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-surround')
call minpac#add('pangloss/vim-javascript')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-repeat')
call minpac#add('SirVer/ultisnips')
call minpac#add('LaTeX-Box-Team/LaTeX-Box')
call minpac#add('mattn/emmet-vim')
call minpac#add('adelarsq/vim-matchit')
call minpac#add('MaxMEllon/vim-jsx-pretty')
call minpac#add('romainl/ctags-patterns-for-javascript')
call minpac#add('natebosch/vim-lsc')
call minpac#add('dmerejkowsky/vim-ale')

" add VimCompletesMe to be able to use the TAB key to scroll through completion
" candidates?

"create minpac commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()


" configure Nate Bosch's vim-lsc for JavaScript
let g:lsc_server_commands = {
 \  'javascript': {
 \    'command': 'typescript-language-server --stdio',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  }
 \}
let g:lsc_auto_map = {
 \  'GoToDefinition': 'gd',
 \  'FindReferences': 'gr',
 \  'Rename': 'gR',
 \  'ShowHover': 'K',
 \  'FindCodeActions': 'ga',
 \  'Completion': 'omnifunc',
 \}
let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'

" auto-completion
set completeopt=menu,menuone,noinsert,noselect

" vim-ale (Asynchronous Lint Engine)
" for JavaScript files, use eslint
let g:ale_linters = {
 \  'javascript': ['eslint'],
 \ }

" mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)
