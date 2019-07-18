" File: .vimrc
" Author: Jake Zimmerman <jake@zimmerman.io>
"
" How I configure Vim :P
"
" Gotta be first
set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype off

call plug#begin('~/.vim/plugged')

" Comment/uncomment multiple lines with <leader>c<space>
Plug 'preservim/nerdcommenter'
" formating for various filetypes
Plug 'prettier/vim-prettier', {
    \'do': 'yarn install',
    \'for': ['typescript', 'html', 'javascript', 'css', 'scss', 'yaml', 'json']
\}
" ctags manager for autocomplete
Plug 'ludovicchabant/vim-gutentags'
" emmet html abbreviations expansion for vim
Plug 'mattn/emmet-vim'
" php comlpetion, refactoring and introspection
Plug 'phpactor/phpactor'
" allows to delete a buffer without closing the window
Plug 'rbgrouleff/bclose.vim'
" quick filtering of results
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" quickly move around a file using <leader><leader>
Plug 'easymotion/vim-easymotion'
" Show trailing whitespaces in red
Plug 'ntpeters/vim-better-whitespace'
" Indentation guides
Plug 'nathanaelkane/vim-indent-guides'
" vim Git wrapper
Plug 'tpope/vim-fugitive'
" syntax and snippets for dockerfiles
Plug 'ekalinin/Dockerfile.vim'
" show VCS changes in sign column beside opened file
Plug 'mhinz/vim-signify'
" auto-close braces etc..
Plug 'Raimondi/delimitMate'
" read and process .editorconfig file
Plug 'editorconfig/editorconfig-vim'
" a set of default configs and fixes to start of with
Plug 'tpope/vim-sensible'
" Powerfull intellisense for vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" auto trim trailing whitespace on save
Plug 'derekprior/vim-trimmer'
" Lightweight status bar
Plug 'mengelbrecht/lightline-bufferline'
" Ranger integration into vim
Plug 'francoiscabrol/ranger.vim'
" Display current file tags in side window
Plug 'majutsushi/tagbar'
" Highligt the enclosing or matching xml/html tags
Plug 'Valloric/MatchTagAlways'
" Autocorrect syntax using php-cs-fixer
Plug 'stephpy/vim-php-cs-fixer'
" Generate phpdoc blocks
Plug 'sumpygump/php-documentor/vim'

" ----------- SYNTAX -------------
Plug 'evidens/vim-twig'
Plug 'cakebaker/scss-syntax.vim'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'

" --------- Color Schemes -----------
Plug 'drewtempelmeyer/palenight.vim'
Plug 'jacoborus/tender.vim'
Plug 'dracula/vim'
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'

call plug#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set nohlsearch
set expandtab
set list
set shiftwidth=4
set softtabstop=4
set hid

if (has("termguicolors"))
 set termguicolors
endif

syntax enable

set mouse=a

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" ----- Inform noevim of pyhton path -----
let g:python_host_prog = '/usr/bin/python'
let g:pyhton3_host_prog = '/usr/bin/python3'

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256

" Set the colorscheme
"colorscheme palenight
"colorscheme tender
"colorscheme nord
"colorscheme solarized
colorscheme dracula

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2
let g:airline_section_b = '%{fugitive#head()}'
" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" Use the solarized theme for the Airline status bar
let g:airline_theme='solarized'
"let g:airline_theme='tender'

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- jez/vim-superman settings -----
" better man page support
noremap K :SuperMan <cword><CR>

" ----- mattn/emmet-vim settings -----
" remap expand to Ctrl+E & ,
let g:user_emmet_leader_key='<C-E>'
" enable emmet in all modes
let g:user_emmet_mode='inv'

" Seiya transparency config
" Default value: ['ctermbg']
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']
let g:seiya_auto_enable=1

" ----- sunuslee/vim-plugin-random-colorscheme-picker -----
let g:colorscheme_user_path = '~/.vim/bundle/vim-colorschemes/colors,~/.vim/bundle/vim-colors-solarized/colors,~/.vim/bundle/molokai/colors'

" ----- ctrlP -----
set wildignore+=*/tests/*,*/node_modules/*,*/node/*

let g:ctrl_p_custom_ignore = {
    \ 'dir': '\v[\/][\.](git|svn|hg|vendor|tests)$',
    \ 'file': '\v.(exe|so|dll|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" ----- Buffergator -----

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <C-PageUp> :bp<cr>

" Go to the next buffer open
nmap <C-PageDown> :bn<cr>

" View the entire list of buffers open
"nmap <leader>bl :BuffergatorOpen<cr>

" ----- vimfiler ------
let g:vimfiler_as_default_explorer = 1

" ----- NERDCommenter -----
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" ----- MatchTagAlways -----
let g:mta_use_matchparen_group = 1
let g:mta_filetypes = {'html' : 1,'html.twig' : 1,'vue' : 1,'js' : 1,'xhtml' : 1,'xml' : 1}

" ----- NERDtree -----
" Open by default
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in")  | NERDTree | endif
" Auto close nerdtree when open file
let NERDTreeQuitOnOpen = 1
" Auto close tab if only nerdtree remaining
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Auto delete buffer if file is deleted in nerdtree
let NERDTreeAutoDeleteBuffer = 1
" Pretty
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ----- Vim-Prettier -----

" max line length that prettier will wrap on
" Prettier default: 80
let g:prettier#config#print_width = 120

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 4

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'false'

" put > on the last line instead of new line
" Prettier default: false
" let g:prettier#config#jsx_bracket_same_line = 'false'

" avoid|always
" Prettier default: avoid
" let g:prettier#config#arrow_parens = 'always'

" none|es5|all
" Prettier default: none
" let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
" let g:prettier#config#parser = 'flow'

" cli-override|file-override|prefer-file
" let g:prettier#config#config_precedence = 'prefer-file'

" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'

" css|strict|ignore
" let g:prettier#config#html_whitespace_sensitivity = 'css'

" ----- alexis/custom -----
" map new tab to <F9> and Ctrl+Shift+N
map <F9> :tabnew<CR>
map <C-N> :tabnew<CR>
noremap <C-W> :q<CR>
map <A-1> :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
vmap <C-c> \c <CR>

" use system clipboard
set clipboard+=unnamedplus

" Disable line wrapping
set nowrap
set sidescroll=5
set listchars=precedes:-,extends:+

" Auto save
set autowriteall
au FocusLost * :wa

" PHPCS and PHPMD
" let g:phpqa_messdetector_ruleset = "/home/alexis/EDF/rosie/phpmd.xml"
" let g:phpqa_codesniffer_args = "--standard=/home/alexis/EDF/rosie/vendor/escapestudios/symfony2-coding-standard/Symfony2/ruleset.xml"
let g:phpqa_codecoverage_autorun = 0
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_messdetector_autorun = 0

" NO MORE EX MODE
nnoremap Q <nop>

" Remap buffer close
cnoreabbrev dd bd
:command W w

" configure custom indent per filetype
autocmd FileType vue setlocal shiftwidth=4 tabstop=4
