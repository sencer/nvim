packadd paq-nvim
lua require'packages'
"
" Plugin settings {{{
let g:python3_host_prog = "$HOME/.local/share/conda/bin/python"
let g:python_host_prog = "/usr/bin/python2.7"

nmap <Leader>- :Explore<CR>
let g:surround_no_insert_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
let g:qf_join_changes = 1
let g:CoolTotalMatches = 1
let g:vista_echo_cursor = 0

let g:neoterm_repl_python = 'ipython --no-autoindent'
let g:neoterm_default_mod = 'botright'
let g:neoterm_auto_scroll = 1
let g:neoterm_autoinsert = 1
let g:neoterm_auto_repl_cmd = 1
let g:neoterm_bracketed_paste = 1
" let g:neoterm_repl_enable_ipython_paste_magic=1
nmap dx <Plug>(neoterm-repl-send)
xmap <CR> <Plug>(neoterm-repl-send)
nmap dxx <Plug>(neoterm-repl-send-line)
nnoremap <silent> <Leader>t :Ttoggle<CR>
tnoremap <silent> <Leader>t :TcloseAll<CR>

nnoremap <silent> <F9> :Vista!!<CR>
nnoremap <silent> coz :UndotreeToggle<CR>
nmap cx <Plug>(Exchange)
nnoremap <silent> cog :SignifyToggle<CR>

let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_cd_cmd = 'lcd'
let g:rooter_resolve_links = 1
let g:rooter_patterns = ['BUILD', '.git', '.hg', '.svn', 'Makefile']

" Load nvim specific plugins {{{
if has('nvim')
  " Terminal {{{
    tnoremap <silent> <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
    tnoremap <silent> <C-j> <C-\><C-n>:TmuxNavigateDown<CR>
    tnoremap <silent> <C-k> <C-\><C-n>:TmuxNavigateUp<CR>
    tnoremap <silent> <C-l> <C-\><C-n>:TmuxNavigateRight<CR>
    tnoremap <silent> <C-w> <C-\><C-n><C-w>
    tnoremap <silent> <C-x> <C-\><C-n><C-w>c
    tnoremap <silent> <C-]> <C-\><C-n>
  " }}}
  packadd nvim-lspconfig
  lua require'lsp-config'

  call sign_define("LspDiagnosticsErrorSign",
        \ {"text" : "E", "texthl" : "ErrorMsg"})
  call sign_define("LspDiagnosticsWarningSign",
        \ {"text" : "W", "texthl" : "WarningMsg"})
  call sign_define("LspDiagnosticsInformationSign",
        \ {"text" : "I", "texthl" : "ModeMsg"})
  call sign_define("LspDiagnosticsHintSign",
        \ {"text" : "H", "texthl" : "ModeMsg"})

  packadd nvim-treesitter
  lua require'treesitter-config'

  packadd nvim-compe
  lua require'compe-config'

  packadd nvim-colorizer.lua
  set termguicolors
  nnoremap coe :ColorizerToggle<CR>
  lua require'colorizer'.setup()

  packadd popup.nvim
  packadd plenary.nvim
  packadd telescope.nvim
  lua require'telescope-config'

  packadd nvim-colorizer.lua
endif
" }}}

" Commentary {{{
vmap <Leader><Space> gc
nmap <Leader><Space> gcc
" }}}

" Fugitive {{{
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>ga :Gcommit --amend<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
" }}}

" vim-qf {{{
nmap <silent> <F2> <Plug>(qf_qf_toggle_stay)
nmap <silent> <F3> <Plug>(qf_loc_toggle_stay)
let g:qf_mapping_ack_style = 1
" }}}

" }}}

" VIM settings {{{
set termguicolors
set background=dark
set guicursor=
      \n-v-c:block-Cursor/lCursor-blinkon0,
      \i-ci:ver25-Cursor/lCursor,
      \r-cr:hor20-Cursor/lCursor
colorscheme gruvbox

set cursorline
set signcolumn=number
set whichwrap+=<,>,[,],~,h,l

set scrolloff=3
set sidescrolloff=8
set clipboard^=unnamedplus
let g:clipboard = {
      \   'name': 'tmux',
      \   'copy': {
      \      '+': ['tmux', 'load-buffer', '-w', '-'],
      \      '*': ['tmux', 'load-buffer', '-w', '-'],
      \    },
      \   'paste': {
       \      '+': ['tmux', 'save-buffer', '-'],
       \      '*': ['tmux', 'save-buffer', '-'],
      \   },
      \   'cache_enabled': 1,
      \ }

set cpoptions+=J

set shell=/usr/bin/zsh

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround

set gdefault
set ignorecase
set smartcase

set modeline

set virtualedit=block,onemore

set number
set relativenumber

set nowrap

set list
set listchars=trail:·,eol:¬,tab:»-,extends:»,precedes:«,nbsp:¤
set showbreak=…

set fillchars=vert:│,fold:·,diff:-
set foldtext=FoldText()
set foldmethod=marker
set foldlevel=100

set undofile
set undolevels=1000
set undoreload=1000
set undodir=~/.cache/nvim/undo

set directory=~/.cache/nvim/swap
set updatetime=200

set nobackup

set colorcolumn=81
set showtabline=1
set wildmode=longest:full,full
set showmatch
set showcmd
set noshowmode
set noerrorbells
set visualbell
set lazyredraw

set mouse=a
set mousemodel=popup_setpos

set infercase
set wildignore=*.o,*~,*.sw*
set wildignorecase
set thesaurus+=~/.config/nvim/dictionaries/moby
set dictionary+=/usr/share/dict/words
set completeopt=noinsert,menuone,noselect

set autoread
set switchbuf=useopen,usetab
set hidden

set autoindent
set smartindent
set copyindent
set cindent
set cinoptions+=l1

set grepprg=rg\ --vimgrep

set shortmess+=c
" }}}

" Maps {{{
map <Space> <nop>
map <Space> <Leader>

" copy to the end of line
nmap Y y$

" redraw
noremap Q <C-L>

" visual mode increment/decrement
vnoremap <C-a> <C-a>gv
vnoremap <C-x> <C-x>gv

" visual mode redo
vnoremap . :norm.<CR>

nnoremap v <C-v>
nnoremap <C-v> v
vnoremap v <C-v>
vnoremap <C-v> v

inoremap <C-U> <C-g>u<C-U>

" Save
nnoremap <silent> <Leader>w :up!<CR>

" Save and exit
nnoremap <silent> <Leader>x :x!<CR>

" Exit without saving; and exit vim if no buffers left
nnoremap <expr> <Leader>q len(filter(range(1, bufnr('$')),
      \ 'buflisted(v:val)')) == 1 ? ':q<CR>' : ':bp\|bd#<CR>'

" zoom current window
nnoremap <expr> <Leader>z winnr('$')==1?':tabclose<CR>':':tab split<CR>'

" close other windows
nnoremap <Leader>o <C-w>o
nnoremap <Leader>c <C-w>c

" }}}
" Autocommands {{{
augroup vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC

  " Make <leader>q quit cmdwin as well
  autocmd CmdwinEnter  * nnoremap <buffer> <Leader>q :q<CR>

  autocmd InsertEnter * set norelativenumber
  autocmd InsertLeave * set relativenumber

  " Don't create swap file for /dev/shm for security
  autocmd BufNewFile,BufReadPre /dev/shm/*
        \ setl noswapfile noundofile

  " Open the last open position
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

  " Auto-close in python/vim
  autocmd FileType python,vim,cpp,c
        \ let b:closer = 1 |
        \ let b:closer_flags = '([{'


  autocmd FileType bash,c,cpp,haskell,json,markdown,python,html,sparql,go,rust,javascript,regex,css,yaml,lua
        \ setl foldmethod=expr |
        \ setl foldexpr=nvim_treesitter#foldexpr()


  autocmd BufNewFile,BufReadPre /google/src/cloud/* call google3#config()

  autocmd BufNewFile,BufReadPre *
        \ setl noswapfile noundofile |
        \ if expand('%:p') =~ "/google/src/cloud" && !&readonly|
        \   setl undodir=. directory=. |
        \ else |
        \   setl undodir=~/.cache/nvim/undo directory=~/.cache/nvim/swap |
        \ endif |
        \ setl swapfile undofile

augroup END  " }}}

" Commands {{{
" Show the changes
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

if !exists(":Redir")
command! -nargs=1 -complete=command -bar -range Redir
      \ silent call redir#Redir(<q-args>, <range>, <line1>, <line2>)
endif
" }}}

" Functions {{{
function! FoldText() abort

  let s:reg='{{'.'{\d\='

  for c in split(&commentstring, '%s')
    let s:reg = s:reg.'\|'.escape(c, '*')
  endfor

  let s:foldchar = matchstr(&fillchars, 'fold:\zs.')
  let s:wlength = min([winwidth(0), 80])
  let s:indent = max([indent(v:foldstart), v:foldlevel-1])
  let s:nlines = (v:foldend-v:foldstart+1).' lines '
  let s:ftext = substitute(getline(v:foldstart), s:reg,'','g')

  return repeat(' ', s:indent) . substitute(s:ftext, '^\s*\(.\{-}\)\s*$', '\1', '')
        \ . repeat(s:foldchar, s:wlength - strlen(s:nlines.s:ftext) - 2 - s:indent)
        \ . s:nlines  . ' ≡'
endfunction
" }}}
"
" highlight default link TSDefinition TSCurrentScope TSDefinitionUsage
"
" let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
