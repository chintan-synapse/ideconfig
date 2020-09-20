"-------------Base Config------------------
" enable syntax highlighting
syntax enable

" show line numbers
:set number relativenumber

" set tabs to have 4 spaces
set ts=4
set list
set lcs=space:.

" indent when moving to the next line while writing codel
set autoindent

" expand tabs into spaces
set expandtab

" setting column length to 88
set colorcolumn=88
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" setting the autocompletion window to do popup
set completeopt=menu,popup

set undofile " Maintain undo history between sessions"
set undodir=~/.vim/undodir

"enable all Python syntax highlighting features
let python_highlight_all = 1

" tag mapping
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"adding clipboard support
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif
"-------------New Configs-------------

"splits window to right
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" vi INSERT & CMD  mode movement
"In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>


"UTF-8 Encoding
set encoding=utf-8


"---------Plugin Configs----------

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
"ALE is the pluging for all linters and fixers for all the languages
"Linters detects all the code errors based on the language specific linters
"Fixers all the code erros based on the language specific fixers
Plug 'dense-analysis/ale'
"{{
let g:ale_fix_on_save = 1
  let g:ale_fixers = {
  \  'python': [
  \       'black'
  \   ],
  \  
  \}
let g:ale_sign_error = "◉"
let g:ale_sign_warning = "◉"
highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500 guibg=#F5F5F5
highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#ED6237 guibg=#F5F5F5
""}}
Plug 'tpope/vim-sensible'
Plug 'tmhedberg/SimpylFold'
" YCM is code completion engine for vim
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
"{{
let g:ycm_autoclose_preview_window_after_completion=1
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"}}
Plug 'morhetz/gruvbox'
Plug 'https://github.com/powerline/powerline.git',{'rtp':'powerline/bindings/vim'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{

"function! s:GotoOrOpen(command, ...)
  "for file in a:000
    "if a:command == 'e'
      "exec 'e ' . file
    "else
      "exec "tab drop " . file
    "endif
  "endfor
"endfunction
"command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<f-args>)
" fzf key binding
let g:fzf_action = {
  \ 'ctrl-t': 'tab drop',
  \ 'ctrl-s': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_buffers_jump = 1
nnoremap <silent> <leader><space> :Files  <CR>
let g:fzf_preview_window = 'right:60%'
let g:fzf_history_dir = '~/.local/share/fzf-history'
"function! s:build_quickfix_list(lines)
  "call setqflist(map(copy(a:lines), '{ \"filename": v:val }'))
  "copen
  "cc
"endfunction
"let g:fzf_action = {
  "\ 'ctrl-q': function('s:build_quickfix_list'),
  "\ 'ctrl-t': 'tab split',
  "\ 'ctrl-x': 'split',
  "\ 'ctrl-v': 'vsplit' }
"}}
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jiangmiao/auto-pairs'
"List ends here. Plugins become visible to Vim after this call.
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
"{{
nmap <F8> :TagbarToggle<CR>
"}}
Plug 'davidhalter/jedi-vim'
"{{
" jedi-vim requires pip3 install jedi
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#completions_enabled = 0
"}}
Plug 'ervandew/supertab'
call plug#end()

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
autocmd FileType nerdtree setlocal number relativenumber
" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" nerdtree settings
let NERDtreeShowLineNumber = 1

"Theme Config
"Enable Theme
colorscheme gruvbox
set bg=dark 
"Enable Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic
"Powerline status config
"set rtp+=~/usr/local/powerline/powerline/bindings/vim
