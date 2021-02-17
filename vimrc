" Useful Links
    " Most vim builtin function is in :help expr
    "   Many usage in this plug in: https://github.com/jiangmiao/auto-pairs/blob/master/plugin/auto-pairs.vim
    " Tabs in vim:
    "   https://webdevetc.com/blog/tabs-in-vim
    " Best autocomplete
    "   https://www.reddit.com/r/vim/comments/cupswo/best_autocomplete/
    " vimrc
    "   https://dougblack.io/words/a-good-vimrc.html
    "   https://github.com/JJGO/dotfiles/blob/master/vim/.vimrc
    " cheatsheet
    "   https://vim.rtorr.com/
    " Key remap
    "   https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
    "
" Quick reference
    " Terminal
    "   Open terminal: :ter. In vim terminal opens in new split window, so :tab ter opens it in a new tab. In nvim it opens in current window, so tabe | ter helps.
    "   Enter normal mode: <C-\><C-n>. Enter terminal mode: any command that enter the insert mode.
    " List files in directory
    "   :e and then press <C-d>. Also works with partial paths
    " Delete words in command line:
    "   <C-w>
    " Vim with specifiec config. Note -N is necessary
    "   vim -u {path_to_config} -N No config at all: vim -u NONE -N
    " Session management
    "   :mksession and vim -S. Use :source to load a session file.
    " Working with buffers
    "   :b {bufname} goes to buffer {bufname}. It doesn't have to be full name. Most useful
    "   :tab sb {bufname} opens a buffer in a new tab
    "   :ls lists buffers
    "   :b[N] goes to buffer N
    "   :sb [N] | {bufname} basically similar, but opens it in split window.
    " Quick horizonal navigation
    "   f, F, t, T. Repeat last one: ';' Repeat last one in opposite direction: ','. But this is often for leader key
    "   Note you can use these with c,d,v,y
    " Quick vertical navigation
    "   H, L, M
    " Quick navigation in text:
    "   () for sentence, {} for paragraphs, [[, ]] for sections.
    " Quickly show help for keyword under cursor. Works in Python as well. You
    " should just filetype plugin on. That's it.
    "   K
    " Quit and save everything
    "   :xa
    " Edit
    "   D/C deletes/changes till the end. 
    "   s substitutes current charater. S substitues the whole line
    "   `I` insert at line start. Useful for commenting. `A` insert at line end
    "   Visual selection + paste replaces things
    " Split window:
    "   See help ctrl-w for more. ctrl+w+s and ctrl+w+v. ctrl-w-c to close
    " Close all split windows except the current one: 
    "   ctrl+w+o. :help ctrl-w to see more on this topic.
    " Navigating between windows:
    "   ctrl+w+j/k/l/h
    " Opens window in a new tab:
    "   ctrl+w+T
    " Move current window to far top/bottom/left/right
    "   ctrl+w+K/J/H/L
    " Going back and forth
    "   ctrl-o and ctrl-i
    " Go to definition
    "   gd
    " Tabs
    "   gt, 1gt, tabe/tabnew
    "   Move tab: tabm {N} to be after current tab n
    " Join lines
    "   J
    " vim-surround
    "   ysiw, ds", cs", S" (in visual mode)
    " Fix indentation:
    "   ={motion}
    " Marker
    "   Mark: m{c} Go back: `{c}
    " Macro
    "   Record: q{c} Finish Record: q Use macro: @{c}. Repeat last recording: @@
    " Rename file
    "   :w {filename}
    " Navigating in help:
    "   gO shows TOC, <C-]> go to link, <C-t> goes back
    " Usable ctrl keys:
    "   https://vi.stackexchange.com/questions/22145/how-to-map-ctrl
    "   Suggestion: don't use ctrl unless you need to keep applying it (like
    "   Commentary)

" vim-plug
" https://github.com/junegunn/vim-plug
" Install vim-plug if not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let b:firsttime=1
else
  let b:firsttime=0
endif


" Use :PlugInstall after adding plugins here
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Plug 'lifepillar/vim-mucomplete'          " You may want this if lsp completion is not working
Plug 'psliwka/vim-smoothie'                 " Smooth scroll
Plug 'godlygeek/tabular'                    " Align texts. Command to align python comments: Tabularize /#
Plug 'tpope/vim-surround'                   " ds' cs' ysiw' S' (in visual mode)
Plug 'tpope/vim-commentary'                 " Use <C-/> to comment
Plug 'scrooloose/nerdtree'                  " <C-q> to toggle. Press m to open a menu for things like deleting a file
Plug 'liuchengxu/vista.vim'                 " <C-\>
Plug 'cohama/lexima.vim'
" Plug 'sainnhe/edge'                        " Sonokai by the same author is also great
Plug 'kaicataldo/material.vim'
Plug 'sheerun/vim-polyglot'                 " Better syntax highlighting and indent. Note this includes vim-python-pep8-indent
Plug 'padde/jump.vim'                       " j [path]
Plug 'ctrlpvim/ctrlp.vim'                   " <C-p>, <C-jkhl> to select, <C-t> new tab. I recommend you always hold ctrl when using this.
Plug 'romainl/vim-cool'                     " Disable highlight after search, and show #matches 
Plug 'brooth/far.vim'                       " Find and replace. :Far to find and replace, :F to find. t and T to toggle selection. s to replace. u to undo
Plug 'mg979/vim-visual-multi'               " Multi-cursor. Use <ctrl-n> and <Tab>
Plug 'prabirshrestha/vim-lsp'               " Vim language server protocal client
Plug 'prabirshrestha/asyncomplete.vim'      " Aynsyc autocomplete
Plug 'prabirshrestha/asyncomplete-lsp.vim'  " Helper to setup vim-lsp as source from asyncomplete
Plug 'mattn/vim-lsp-settings'               " 1) For installing language servers (LspInstallServer) 2) For setting up vim-lsp (e.g., which server to use for which language)
Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'           " Session management. <leader>pc to create/load session, <leader>pd to delete session
Plug 'gikmx/vim-ctrlposession'              " <C-s> to switch session
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'dense-analysis/ale'                   " :lopen and :lclose displays error list. <C-j>, <C-k> navigates between errors.
                                            " Fix with :ALEFix
                                            " You would need to install flake8 and yapf via pip
                                            "


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" First time open vim. Install all plugins
if b:firsttime == 1
    PlugInstall
    q   "Automatically close pluging window
endif

""" Color scheme

let g:material_terminal_italics = 1
" let g:material_theme_style = 'darker'
syntax on
colorscheme material
set termguicolors
" Disable tilde https://stackoverflow.com/questions/3813059/is-it-possible-to-not-display-a-for-blank-lines-in-vim-neovim
highlight NonText guifg=bg
" Fix italics in Vim: https://github.com/kaicataldo/material.vim/issues/56
if !has('nvim')
  let &t_ZH="\e[3m"
  let &t_ZR="\e[23m"
endif


" UI settings
filetype on        " Enable detecting file types
filetype indent on " Load filetype-specific indent files
filetype plugin on " Load filetype specific plugin files
set number         " Show line numbers
set relativenumber " Show relative numbering
set showcmd        " Show command in bottom bar
set cursorline     " Highlight current line
set wildmenu       " Visual autocomplete for command menu
set showmatch      " Highlight matching [{()}]
set mouse+=a       " A necessary evil, mouse support
set splitbelow     " Open new vertical split bottom
set splitright     " Open new horizontal splits right
set laststatus=2   " Show the status line at the bottom
set showtabline=2  " Always show tabline
set nowrap         " Do not wrap lines
set noshowmode     " Do not show '--INSERT--' cause we have status line
set completeopt=menuone,noselect  " Do not show preview window in auto complete
set shortmess+=c   " Shut off completion messages
set shortmess-=S   " Show number of matches in searc
set signcolumn=yes " Always show sign column
set startofline    " Change cursor location to start of line when doing things like ^U, ^D

" Tab and spaces
" https://superuser.com/questions/4511/delete-space-expanded-tab-in-vim-with-one-keystroke
set tabstop=4                  " show existing tab with 4 spaces width
set shiftwidth=0               " when indenting with '>', use 4 spaces width. 0 uses tabstop
set softtabstop=-1             " Enables deleting 4 spaces at a time. -1 uses shiftwidth
set expandtab                  " On pressing tab, insert spaces instead
set backspace=indent,eol,start " Backspace

" Search
set incsearch  " Incremental search. Search as you type.
set hlsearch   " Highlight matched items. Type :noh to turn off hightlighting
set ignorecase " Case insensitive search
set smartcase  " If search entry contains a capital, then it becomes case sensitive

" Undo
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir " To use this function, you must manually create this directory
if exists("*mkdir") && !isdirectory(expand("~/.vim/undodir"))
    call mkdir(expand("~/.vim/undodir"), "p")
endif

" Do not show line numbers in terminal mode in nvim.
if has('nvim')
    autocmd TermEnter * setlocal nonumber norelativenumber
    autocmd TermLeave * setlocal number relativenumber
endif

" Use clipboard
set clipboard=unnamed

" Horizontal scroll binding
" Disabled this. Get used to zH and zL please.
" noremap L 20zl
" noremap H 20zh
"
" Quick horizontal navigation. 
" You don't need this. Get used to using FfTt and ; instead.
" noremap L 20l
" noremap H 20h
"
" Quick vertical navigation. 
" You don't need this. First, H and L are useful. Second, 
" noremap J 5l
" noremap K 5h

" Quickly switch between tabs
nnoremap <c-h> gT
nnoremap <c-l> gt

"""Leader key
let mapleader = ","


" Window resize problem in tmux
" https://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux
" nvim does not have ttymouse
if !has('nvim')
    if has("mouse_sgr")
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    end
end

" Vim commentary
" Note that you cannot use <c-/>. Vim send <c-/> as <c-_>
" See this: https://stackoverflow.com/questions/90l51837/how-to-map-c-to-toggle-comments-in-vim
noremap <silent> <c-_> :Commentary<cr><cr>

" Use jump.vim, redefine built-in 'j' as 'J'
" https://stackoverflow.com/questions/2605036/how-to-redefine-a-command-in-vim
cabbrev j J

" NERDTree setting
noremap <silent> <leader>e :NERDTreeToggle<CR>
" Minimal UI
let NERDTreeMinimalUI = 1

" Vista setting
noremap <silent> <leader>t :Vista!!<CR>

""" Prosession map. See https://stackoverflow.com/questions/45993666/vim-send-tab-keystroke-in-keymapping
set wildcharm=<C-z>
" Switch
noremap <silent> <leader>s :CtrlPObsession <CR>
" Create or switch
noremap <leader>pc :Prosession <C-z>
" Delete 
noremap <leader>pd :ProsessionDelete <C-z>


" markdown syntax highlighting
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" auto-pairs
" Do not pair " in vim
" https://github.com/jiangmiao/auto-pairs/issues/204
autocmd Filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'}


" Mucomplete. Turn this on if you need synchronous complete.
" let g:mucomplete#enable_auto_at_startup = 0

" auto pair ) if the completed item is a function
" Look at :help CompleteDone
" Look at :help line-continuation
" Look at :help has_key()
" https://learnvimscriptthehardway.stevelosh.com/chapters/37.html
" See :help expr4 for all available operations
"
func! CondInsert()
    " Insert )\<Left> only if the previous character is not )
    let line = getline('.')
    let pos = col('.') - 2
    if strgetchar(line, pos) != char2nr(')')
        return ")\<Left>"
    endif
    return ""
endf

" Note that a simple feedkeys(")\<Left>") with getline check for ) wouldn't
" work because ) is not in the line buffer when the event happen.
autocmd! CompleteDone * if has_key(v:completed_item, 'word') && v:completed_item.word =~# '($' 
                \| call feedkeys("\<C-R>=CondInsert()\<CR>")
                \| endif


" ALE, linter
nmap <silent> <C-k> <Plug>(ale_previous_wrap_error)
nmap <silent> <C-j> <Plug>(ale_next_wrap_error)
" let g:ale_echo_msg_format = '[%linter%][%code%] %s'
let g:ale_echo_msg_format = '[%linter%] %s'
" Show error in virtual text
let g:ale_virtualtext_cursor = 0
" let g:ale_echo_cursor = 0
" let g:ale_set_balloons = 1
" let g:ale_set_highlights = 1
let g:ale_linters = {
\   'python': ['flake8', 'pylint']
\}
let g:ale_fixers = {
\   'python': ['yapf']
\}
" Let pycodestyle report warnings instead of errors. See https://github.com/dense-analysis/ale/issues/758
let g:ale_type_map = {'flake8': {'ES': 'WS'}}
" For pylint only report errors. Style issues are handled with flake8. Pylint
" catches many errors that flake8 cannot catch.
let g:ale_python_pylint_options = '--disable=all --enable=E,F'



""" Lsp settings

" Diable diagnostics. Use ALE instead. ALE's highlighting is more precise. May
" change this if lsp supports better ways of highlighting.
let g:lsp_diagnostics_enabled = 0
" let g:lsp_diagnostics_highlights_enabled = 0
" let g:lsp_diagnostics_float_cursor = 1
" let g:lsp_diagnostics_float_delay = 500

" lsp key mappings
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    " nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


""" lsp-settings
let g:lsp_settings_filetype_python = 'jedi-language-server'

""" Asyncomplete key mappings
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


""" Vista settings
let g:vista_default_executive = 'vim_lsp'
let g:vista#renderer#enable_icon = 0
" let g:vista_icon_indent = ["▸ ", ""]


""" Far
" Enable undo
let g:far#enable_undo=1


""" Procession on startup
let g:prosession_on_startup = 1


""" visual-multi
let g:VM_quit_after_leaving_insert_mode = 0
let g:VM_silent_exit = 1
let g:VM_theme = 'iceblue'
" Fix extra <CR> issue with autocomplete. See https://github.com/mg979/vim-visual-multi/issues/122
autocmd User visual_multi_mappings  imap <buffer><expr> <CR> pumvisible() ? "\<C-Y>" : "\<Plug>(VM-I-Return)"


""" Lightline

let g:lightline = {'colorscheme' : 'material_vim'}
let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'raw',
      \ }
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ], ['lineinfo'], [ 'filetype', 'percent']] }
let g:lightline.tabline = { 'left': [['tabs']], 'right': []}

""" Polyglot
" Disable highlighting for trailing whitespace https://github.com/sheerun/vim-polyglot/issues/333
let g:python_highlight_space_errors = 0

"""CtrlP Use mixed mode
" let g:ctrlp_map = '<leader>p'
" Maybe you don't need mixed. Get used to use :b {bufname} to go to file
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_cmd = 'CtrlPMixed'
