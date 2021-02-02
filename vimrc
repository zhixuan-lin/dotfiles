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
    " Quit everything
    "   :qa
    " Close all split windows except the current one: ctrl+w+o
    " Split window:
    "   ctrl+w+s and ctrl+w+v
    " Navigating between windows:
    "   ctrl+w+j/k/l/h
    " Going back and forth
    "   ctrl-o and ctrl-i
    " Go to definition
    "   gd
    " Tabs
    "   gt, 1gt, tabe, tabnew
    " Join lines
    "   J
    " vim-surround
    "   ysiw, ds", cs", S" (in visual mode)
    " Fix indentation:
    "   ={motion}
    " Marker
    "   Mark: m{c} Go back: `{c}
    " Macro
    "   Record: q{c} Finish Record: q Use macro: @{c}

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
" Plug 'ajh17/VimCompletesMe'
Plug 'lifepillar/vim-mucomplete'
Plug 'psliwka/vim-smoothie'               " Smooth scroll
Plug 'godlygeek/tabular'                  " Align texts. Command to align python comments: Tabularize /#
Plug 'tpope/vim-surround'                 " ds' cs' ysiw' S' (in visual mode)
Plug 'tpope/vim-commentary'               " Use <C-/> to comment
Plug 'scrooloose/nerdtree'                " <C-n>
Plug 'jiangmiao/auto-pairs'
Plug 'crusoexia/vim-monokai'
Plug 'padde/jump.vim'                     " j [path]
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'                 " <C-p>, <C-jkhl> to select
Plug 'dense-analysis/ale'                 " :lopen and :lclose displays error list. <C-j>, <C-k> navigates between errors.



" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" First time open vim. Install all plugins
if b:firsttime == 1
    PlugInstall
    q   "Automatically close pluging window
endif

" Colors sublime monokai
syntax on                       
colorscheme monokai
set termguicolors


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


" Use clipboard
set clipboard=unnamed

" Horizontal scroll binding
noremap <c-l> zL
noremap <c-h> zH


" Window resize problem in tmux
" https://superuser.com/questions/549930/cant-resize-vim-splits-inside-tmux
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" Vim commentary
" Note that you cannot use <c-/>. Vim send <c-/> as <c-_>
" See this: https://stackoverflow.com/questions/90l51837/how-to-map-c-to-toggle-comments-in-vim
noremap <c-_> :Commentary<cr><cr>

" Use jump.vim, redefine built-in 'j' as 'J'
" https://stackoverflow.com/questions/2605036/how-to-redefine-a-command-in-vim
cabbrev j J

" NERDTree setting
map <C-n> :NERDTreeToggle<CR>
 
" markdown syntax highlighting
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" auto-pairs
" Do not pair " in vim
" https://github.com/jiangmiao/auto-pairs/issues/204
au Filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'}


" auto complete
let g:mucomplete#enable_auto_at_startup = 1

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
let g:ale_echo_msg_format = '[%linter%] %code%: %s'
