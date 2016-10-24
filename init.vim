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
Plug 'junegunn/seoul256.vim'
Plug 'bfredl/nvim-ipy'
Plug 'jalvesaq/Nvim-R'
Plug 'davidhalter/jedi-vim'
Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'majutsushi/tagbar'

" plugin on GitHub repo
"Plug 'fholgado/minibufexpl.vim'
"Plug 'garbas/vim-snipmate'
"Plug 'godlygeek/tabular'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'nvie/vim-rst-tables'
"Plug 'scrooloose/syntastic'
"Plug 'tomtom/tlib_vim'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-scripts/bash-support.vim'
"Plug 'vim-scripts/perl-support.vim'
"Plug 'ynkdir/vim-diff'
"Plug 'junegunn/goyo.vim'
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

" Add shortcut for spelling
nmap ,ss :setlocal spell! spelllang=en<CR>

" Add shortcut for wrapping
nmap <silent> ,w :set invwrap<CR>:set wrap?<CR>

" Add shortcut for setting folding
noremap <silent> ,fi :set foldmethod=indent<CR>

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
autocmd BufEnter * lcd %:p:h

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
au BufRead,BufNewfile *.py set foldmethod=indent 
au BufRead,BufNewFile *.py set syntax=python

" Snakemake
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead Snakefile set foldmethod=indent
au BufNewFile,BufRead *.rules set syntax=snakemake
au BufNewFile,BufRead *.rules set foldmethod=indent
au BufNewFile,BufRead *.workflow set syntax=snakemake
au BufNewFile,BufRead *.workflow set foldmethod=indent
au BufNewFile,BufRead *.snake set syntax=snakemake
au BufNewFile,BufRead *.snake set foldmethod=indent

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
autocmd FileType python let g:nvim_ipy_perform_mappings = 0
autocmd FileType python map ,r <Plug>(IPy-Run)
"autocmd FileType python imap  <ESC><Plug>(IPy-Run)
autocmd FileType python map ,/ <Plug>(IPy-WordObjInfo)

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

"-----------------------------------------------------------------------------
" Minibufexplorer 
"-----------------------------------------------------------------------------
let g:miniBufExplorerMoreThanOne=2

"-----------------------------------------------------------------------------
" vim-rst-tables Settings
"-----------------------------------------------------------------------------
noremap <silent> ;;c : call ReformatTable()<CR>
noremap <silent> ;;f : call ReflowTable()<CR>

"-----------------------------------------------------------------------------
" Syntastic Settings
"-----------------------------------------------------------------------------
autocmd FileType python let g:syntastic_python_flake8_args='--ignore=E501,F401,W391'

"-----------------------------------------------------------------------------
" tagbar Settings
"-----------------------------------------------------------------------------
nmap ,t :TagbarToggle<CR>

"-----------------------------------------------------------------------------
" jedi-vim Settings
"-----------------------------------------------------------------------------
let g:jedi#popup_on_dot = 0

"=============================================================================
"                                Functions                                      
"=============================================================================
