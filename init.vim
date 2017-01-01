set noswapfile

" -----------------------------------------------------------------
" Install Pluging
" ----------------------------------------------------------------
"call pathogen#infect()

" set the runtime path to include Vundle and initialize
"
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction

call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'junegunn/seoul256.vim'
Plug 'bfredl/nvim-ipy'
Plug 'jalvesaq/Nvim-R'
Plug 'davidhalter/jedi-vim'
Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-markdown'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'majutsushi/tagbar'
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'tmhedberg/SimpylFold'
Plug 'vimwiki/vimwiki'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ccwang002/vim-snakemake'
Plug 'ap/vim-buftabline'

" plugin on GitHub repo
"Plug 'fholgado/minibufexpl.vim'
"Plug 'garbas/vim-snipmate'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'nvie/vim-rst-tables'
"Plug 'tomtom/tlib_vim'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-scripts/bash-support.vim'
"Plug 'vim-scripts/perl-support.vim'
"Plug 'ynkdir/vim-diff'
"Plug 'bling/vim-airline'
"Plug 'kien/ctrlp.vim'
"Plug 'EricGebhart/SAS-Vim'
"Plug 'Valloric/YouCompleteMe'
"Plug 'suan/vim-instant-markdown'
"Plug 'plasticboy/vim-markdown'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plug 'visincr'
"Plug 'Vim-R-plugin'
"Plug 'Conque-GDB'
"Plug 'oplatek/Conque-Shell'

call plug#end()            " required

" -----------------------------------------------------------------
" General Settings
" ----------------------------------------------------------------
" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

syntax on           " Turn on that syntax highlighting
set hidden          " This allows you to leave a buffer with out saving you will be promted to save upon quit
set showmode        " At least let yourself know what mode you're in
set smartindent     " This causes autoindent after certain marks such as '{'
set expandtab       " Replace tab with spaces
set tabstop=4       " Replace tab with 4 spaces
set softtabstop=4   " Replace tab with 4 spaces
set shiftwidth=4    " This is kind of like tabstop, except when you are in insert  mode you hit <C-D> or <C-T>
set nospell

set scrolloff=3
set showcmd
set wildmode=list:longest
set novisualbell
set nocursorline
set ruler
set backspace=indent,eol,start
set laststatus=2

set ignorecase
set smartcase
set incsearch
set showmatch
set clipboard+=unnamedplus
set modeline
set modelines=1

command Bd bp\|bd \#            " This will close a buffer and not close split

"let mapleader = ","
nnoremap ,<space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

let g:seoul256_background = 234
colorscheme seoul256

" -----------------------------------------------------------------------
" Key Mappings
" -----------------------------------------------------------------------

" Maps j and k to gj and gk so that when lines wrap you will move down one
" line at a time.
nmap j gj
nmap k gk

"Move the cursor in split mode
noremap <silent> ,h :wincmd h<cr>
noremap <silent> ,j :wincmd j<cr>
noremap <silent> ,k :wincmd k<cr>
noremap <silent> ,l :wincmd l<cr>

" Close different panes in split mode
noremap <silent> ,cj :wincmd j<cr>:close<cr>
noremap <silent> ,ck :wincmd k<cr>:close<cr>
noremap <silent> ,ch :wincmd h<cr>:close<cr>
noremap <silent> ,cl :wincmd l<cr>:close<cr>

" Move the current pane
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J

" Map CTRL-E to do what ',' used to do
nnoremap <c-e> ,
vnoremap <c-e> ,
map <F1> <Esc>
imap jj <Esc>
tnoremap <Esc> <C-\><C-n>

" Add shortcut for spellinfoldmethod=indentg
nmap ,ss :setlocal spell! spelllang=en<CR>

" Add shortcut for wrapping
nmap <silent> ,w :set invwrap<CR>:set wrap?<CR>

" Add shortcut for setting folding
"noremap <silent> ,fi :set foldmethod=indent<CR>

" Add blank line below/above
nnoremap + maO<esc>`a
noremap - mao<esc>`a

nmap <C-p> "+gP

" Insert Date
nnoremap <F5> "=strftime("%m/%d/%Y")<CR>P
inoremap <F5> <C-R>=strftime("%m/%d/%Y")<CR>

noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" -----------------------------------------------------------------------
" Buffer Settings
" -----------------------------------------------------------------------

" Change to the current directory of the current file
autocmd BufEnter * if expand('%p') !~ '://' | :lchdir %:p:h | endif

" Comment code
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python,conf,fstab   let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType vim              let b:comment_leader = '" '

" Text
au BufRead,BufNewfile *.txt set lbr
au BufRead,BufNewfile *.txt set tw=80
au BufRead,BufNewfile *.txt set spell spelllang=en
au BufRead,BufNewfile *.txt set nonumber

" Latex
au BufRead,BufNewfile *.tex set nonumber
au BufRead,BufNewfile *.tex set lbr
au BufRead,BufNewfile *.tex set tw=80
au BufRead,BufNewfile *.tex set spell spelllang=en

" Markdown
au BufRead,BufNewfile *.mkd set lbr
au BufRead,BufNewfile *.mkd set tw=80
au BufRead,BufNewfile *.mkd set spell spelllang=en
au BufRead,BufNewfile *.mkd set nonumber
au BufRead,BufNewfile *.mkd set syntax=markdown

" BASH
au BufRead,BufNewfile *.sh set number
au BufRead,BufNewfile *.qsub set number

" IGV Genome Files
au BufReadCmd *.genome call zip#Browse(expand(""))

" CSV
au BufRead,BufNewfile *.csv set ft=csv
au BufRead,BufNewfile *.csv set nonumber

" TSV
au BufRead,BufNewfile *.tsv set ft=csv
au BufRead,BufNewfile *.tsv set noexpandtab
au BufRead,BufNewfile *.tsv set nonumber

" Python
au BufRead,BufNewfile *.py set ft=python
au BufRead,BufNewFile *.py set syntax=python
au BufRead,BufNewfile *.py set foldmethod=indent
au BufRead,BufNewfile *.py set number
au BufRead,BufNewfile *.py let g:strip_whitespace_on_save = 1

au BufNewFIle,BufRead *.pymd set ft=markdown.python

" Snakemake
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead Snakefile set foldmethod=indent
au BufNewFile,BufRead Snakefile set number
au BufRead,BufNewfile Snakefile let g:strip_whitespace_on_save = 1

au BufNewFile,BufRead *.snake set ft=snakemake.python
au BufNewFile,BufRead *.snake set syntax=snakemake
au BufNewFile,BufRead *.snake set foldmethod=indent
au BufNewFile,BufRead *.snake set number
au BufRead,BufNewfile *.snake let g:strip_whitespace_on_save = 1

" YAML
au BufNewFile,BufRead *.yaml set syntax=yaml
au BufNewFile,BufRead *.yaml set foldmethod=indent
au BufNewFile,BufRead *.yaml set shiftwidth=2

au BufNewFile,BufRead *.yml set syntax=yaml
au BufNewFile,BufRead *.yml set foldmethod=indent
au BufNewFile,BufRead *.yml set shiftwidth=2

" -----------------------------------------------------------------------
" SAS Settings
" -----------------------------------------------------------------------

" Allows copying to X11 clipboard
:com -range Cz :silent :<line1>,<line2>w !xsel -i -b
:com -range Cx :silent :<line1>,<line2>w !xsel -i -p
:com -range Cv :silent :<line1>,<line2>w !xsel -i -s
:ca cv Cv
:ca cz Cz
:ca cx Cx

:com -range Pz :silent :r !xsel -o -b
:com -range Px :silent :r !xsel -o -p
:com -range Pv :silent :r !xsel -o -s

:ca pz Pz
:ca px Px
:ca pv Pv

"=============================================================================
"                                Plugins
"=============================================================================

"-----------------------------------------------------------------------------
" nvim-ipy
"-----------------------------------------------------------------------------
autocmd FileType markdown.python,python let g:nvim_ipy_perform_mappings = 0
autocmd FileType markdown.python,python map ,r <Plug>(IPy-Run)
"autocmd FileType markdown.python,python imap  <ESC><Plug>(IPy-Run)
autocmd FileType markdown.python,python map ,/ <Plug>(IPy-WordObjInfo)

"-----------------------------------------------------------------------------
" Nvim-R
"-----------------------------------------------------------------------------
if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif
autocmd FileType r,rmd,rnw vmap <Space> <Plug>RDSendSelection
autocmd FileType r,rmd,rnw nmap <Space> <Plug>RDSendLine
autocmd FileType r,rmd,rnw set foldmethod=syntax


"-----------------------------------------------------------------------------
" Nvim-R (knitrBootstrap)
"-----------------------------------------------------------------------------
function! RMakeHTML_2(t)
    update
    let rmddir = expand("%:p:h")
    let rcmd = 'nvim.interlace.rmd("' . expand("%:t") . '", outform = "' . a:t .'", rmddir = "' . rmddir . '"'
    let rcmd .= ", view = FALSE"
    let rcmd = rcmd . ', envir = ' . g:R_rmd_environment . ')'
    call g:SendCmdToR(rcmd)
endfunction

"bind RMakeHTML_2 to leader kk
nnoremap <silent> <Leader>kk :call RMakeHTML_2("knitrBootstrap::bootstrap_document")<CR>
nnoremap <silent> <Leader>km :!mv %:r.html ../output/<CR>


"-----------------------------------------------------------------------------
" Minibufexplorer
"-----------------------------------------------------------------------------
let g:miniBufExplorerMoreThanOne=2

"-----------------------------------------------------------------------------
" vim-rst-tables
"-----------------------------------------------------------------------------
noremap <silent> ;;c : call ReformatTable()<CR>
noremap <silent> ;;f : call ReflowTable()<CR>

"-----------------------------------------------------------------------------
" Syntastic
"-----------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"autocmd FileType python let g:syntastic_python_flake8_args='--ignore=E501,F401,W391'
autocmd FileType python let g:syntastic_python_flake8_args='--ignore=E501'

"-----------------------------------------------------------------------------
" tagbar
"-----------------------------------------------------------------------------
nmap ,t :TagbarToggle<CR>


"-----------------------------------------------------------------------------
" jedi-vim Settings
"-----------------------------------------------------------------------------
let g:jedi#popup_on_dot = 0


" vim-markdown
"-----------------------------------------------------------------------------
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost README set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'r']


"-----------------------------------------------------------------------------
" vim-markdown-composer
"-----------------------------------------------------------------------------
let g:markdown_composer_autostart=0


"-----------------------------------------------------------------------------
" SimplyFold
"-----------------------------------------------------------------------------
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 0


"-----------------------------------------------------------------------------
" Vimwiki
"-----------------------------------------------------------------------------
let wiki_1 = {}
let wiki_1.path = '~/Dropbox/wiki/research'
let wiki_1.path_html = '~/Dropbox/wiki/public_html'
let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let wiki_1.ext = '.md'
let wiki_1.syntax = 'markdown'
let g:vimwiki_list = [wiki_1]

"-----------------------------------------------------------------------------
" Better White Space
"-----------------------------------------------------------------------------

"-----------------------------------------------------------------------------
" Bufftabline
"-----------------------------------------------------------------------------
let g:buftabline_numbers = 1

"=============================================================================
"                                Functions
"=============================================================================
function! RunNoteDown()
endfunction

function! TrimSpaces()
    let l:save = winsaveview()
    %s/\s\+$//e
    w
    call winsaveview()
endfun
command! TrimSpaces call TrimSpaces()
