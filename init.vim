packadd minpac
call minpac#init()
command! PackUpdate  packadd minpac | call minpac#update()
command! PackClean call minpac#clean()

"================AUTOLOADED PLUGINS===================================
call minpac#add('w0rp/ale', { 'do': '!npm install -g prettier' })
call minpac#add('Shougo/deoplete.nvim')
call minpac#add('prettier/vim-prettier')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

call minpac#add('scrooloose/nerdcommenter')
call minpac#add('vimwiki/vimwiki')
call minpac#add('andymass/vim-matchup')
call minpac#add('tpope/vim-surround') 
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('ap/vim-css-color')
call minpac#add('carlitux/deoplete-ternjs')
call minpac#add('flazz/vim-colorschemes')
call minpac#add('fenetikm/falcon')
call minpac#add('morhetz/gruvbox')
call minpac#add('artur-shaik/vim-javacomplete2')
call minpac#add('ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] })
call minpac#add('scrooloose/nerdtree')
call minpac#add('scrooloose/nerdcommenter')

"call minpac#add('pangloss/vim-javascript')
"call minpac#add('manasthakur/vim-commentor')
"call minpac#add('digitaltoad/vim-pug') "pug syntax highlighter
"call minpac#add('osyo-manga/vim-anzu')
"call minpac#add('soywod/vim-keepeye')

"=======GENERAL CONFIG=====================================
" deoplete config
let g:deoplete#enable_at_startup = 1        "Enable deoplete on startup
let g:deoplete#camel_case = 1    "Autocomplete files relative to current buffer path
let g:deoplete#file#enable_buffer_path = 1 "Show only 30 entries in list and allow smart case autocomplete
"let g:deoplete#disable_auto_complete = 1
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))       
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']




:"javacomplet2 config
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
nmap <leader>jii <Plug>(JavaComplete-Imports-Add)



"ale eslint prettier etc javascript======================
let g:ale_linters = {'javascript': ['eslint']}        "Lint js with eslint
let g:ale_fixers = {'javascript': ['prettier', 'eslint']}    "Fix eslint errors
let g:ale_javascript_prettier_options = '--print-width 100'  "Set max width to 100 chars for prettier
let g:ale_sign_error = '✖'      "Lint error sign
let g:ale_sign_warning = '⚠'    "Lint warning sign
let g:airline#extensions#ale#enabled=1 "display in airline 

let g:jsx_ext_required = 1       "Force jsx extension for jsx filetype
let g:javascript_plugin_jsdoc = 1  "Enable syntax highlighting for js doc blocks

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]  "Use dropbox folder for easier syncing of wiki

let g:matchup_matchparen_status_offscreen = 0  "Do not show offscreen closing match in statusline

let g:LanguageClient_serverCommands = {
\ 'javascript': ['javascript-typescript-stdio'],
\ 'javascript.jsx': ['javascript-typescript-stdio'],
\ 'typescript': ['javascript-typescript-stdio'],
\ }

let g:keepeye_start = v:true         "Start keepeye on vim enter
hi User4 guifg=#FFFFFF guibg=#FF0000
let g:keepeye_message_hl_user = 4   "Use User4 hl group when showing keepeye message

"Fuzzy search====================================
nnoremap <C-p> :<C-u>FZF<CR>


"prettier===========================================
autocmd FileType javascript set formatprg=prettier-eslint\ --stdin

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first) 
nmap <silent> [w <Plug>(ale_previous) 
nmap <silent> ]w <Plug>(ale_next) 
nmap <silent> ]W <Plug>(ale_last)


"Basic setup=========================================
syntax on
let g:mapleader = ','     "Change leader to a \ 
map ,n :bn<cr>
map ,p :bp<cr>
map <tab> <C-w>w

set number relativenumber

"cursorline set up
set cursorline
au BufEnter * setlocal cursorline "set cursor line only in active window 
au BufLeave * setlocal nocursorline ""set off sursorline when leaving active window 
"highlight CursorLine guibg=black ctermbg=234
"hi cursorline ctermfg=White ctermbg=black cterm=bold guifg=white guibg=black gui=bold
"autocmd InsertEnter * highlight CursorLine ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=black gui=bold


set ruler               " Show the line and column numbers of the cursor.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set tabstop=4 shiftwidth=4 expandtab
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions)
colorscheme falcon
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
set t_Co=256
set termguicolors
" airline settings=================================
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_powerline_fonts=1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_powerline_fonts=1
"let g:airline_theme='falcon'
let g:airline_theme='molokai'
