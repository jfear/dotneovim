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
Plug 'Rykka/riv.vim'
Plug 'Rykka/InstantRst'
Plug 'ap/vim-buftabline'
Plug 'bfredl/nvim-ipy'
Plug 'ccwang002/vim-snakemake'
Plug 'chrisbra/csv.vim'
Plug 'davidhalter/jedi-vim'
"Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'godlygeek/tabular'
Plug 'jalvesaq/Nvim-R'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'majutsushi/tagbar'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'visincr'

" plugin on GitHub repo
"Plug 'garbas/vim-snipmate'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'vim-pandoc/vim-pandoc'

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
set nospell         " Turn off spell check

set scrolloff=3     " Minimal number of screen lines to keep above and below the cursor.
set showcmd
set wildmode=list:longest
set novisualbell    " Use visual bell instead of beeping.
set nocursorline    " Highlight the screen line of the cursor with CursorLine |hl-CursorLine|.
set ruler           " Show the line and column number of the cursor position, separated by a comma
set backspace=indent,eol,start
set laststatus=2

set ignorecase
set smartcase
set incsearch
set showmatch
set clipboard+=unnamedplus
set modeline
set modelines=1

let g:seoul256_background = 234
colorscheme seoul256

" -----------------------------------------------------------------------
" Key Mappings
" -----------------------------------------------------------------------

command Bd bp\|bd \#            " This will close a buffer and not close split

"let mapleader = ","
nnoremap ,<space> :noh<cr>      " Turns off highlighting
nnoremap <tab> %
vnoremap <tab> %

" Maps j and k to gj and gk so that when lines wrap you will move down one
" line at a time.
nmap j gj
nmap k gk

" Move the cursor in split mode
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

" Map jj to escape
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

" Insert Date
nnoremap <F5> "=strftime("%m/%d/%Y")<CR>P
inoremap <F5> <C-R>=strftime("%m/%d/%Y")<CR>

" add/remove comments on visual selection
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" -----------------------------------------------------------------------
" Buffer and Filetype Settings
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
au BufRead,BufNewfile *.tex set lbr
au BufRead,BufNewfile *.tex set tw=80
au BufRead,BufNewfile *.tex set spell spelllang=en
au BufRead,BufNewfile *.tex set nonumber

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
au BufRead,BufNewfile *.py set number

au BufNewFIle,BufRead *.pymd set ft=markdown.python

" Snakemake
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead Snakefile set foldmethod=indent
au BufNewFile,BufRead Snakefile set number

au BufNewFile,BufRead *.snake set ft=snakemake.python
au BufNewFile,BufRead *.snake set syntax=snakemake
au BufNewFile,BufRead *.snake set foldmethod=indent
au BufNewFile,BufRead *.snake set number

" YAML
au BufNewFile,BufRead *.yaml set syntax=yaml
au BufNewFile,BufRead *.yaml set foldmethod=indent
au BufNewFile,BufRead *.yaml set shiftwidth=2

au BufNewFile,BufRead *.yml set syntax=yaml
au BufNewFile,BufRead *.yml set foldmethod=indent
au BufNewFile,BufRead *.yml set shiftwidth=2


" rst
au BufRead,BufNewfile *.rst set lbr
au BufRead,BufNewfile *.rst set tw=80
au BufRead,BufNewfile *.rst set spell spelllang=en
au BufRead,BufNewfile *.rst set nonumber
au BufRead,BufNewfile *.rst set syntax=rst
au BufRead,BufNewfile *.rst set fo=want


" Headings
au FileType rst nnoremap <leader>h1 ^yypv$r=o<cr><esc>
au FileType rst inoremap <leader>h1 <esc>^yypv$r=o<cr>

au FileType rst nnoremap <leader>h2 ^yypv$r-o<cr><esc>
au FileType rst inoremap <leader>h2 <esc>^yypv$r-o<cr><esc>

au FileType rst nnoremap <leader>h3 ^yypv$r+o<cr><esc>
au FileType rst inoremap <leader>h3 <esc>^yypv$r+o<cr><esc>

au FileType rst nnoremap <leader>h4 ^yypv$r~o<cr><esc>
au FileType rst inoremap <leader>h4 <esc>^yypv$r~o<cr><esc>

au FileType rst nnoremap <leader>h5 ^yypv$r*o<cr><esc>
au FileType rst inoremap <leader>h5 <esc>^yypv$r*o<cr><esc>

"""Make Link (ml)
" Highlight a word or phrase and it creates a link and opens a split so
" you can edit the url separately. Once you are done editing the link,
" simply close that split.
au FileType rst vnoremap <leader>ml yi`<esc>gvvlli`_<esc>:vsplit<cr><C-W>l:$<cr>o<cr>.. _<esc>pA: http://TODO<esc>vb

"""Make footnote (ml)
au FileType rst iabbrev mfn [#]_<esc>:vsplit<cr><C-W>l:$<cr>o<cr>.. [#] TODO
au FileType rst set spell

"Create image
au FileType rst iabbrev iii .. image:: TODO.png<cr>    :scale: 100<cr>:align: center<cr><esc>kkkeel

"Create figure
"au FileType rst iabbrev iif .. figure:: TODO.png<cr>    :scale: 100<cr>:align: center<cr>:alt: TODO<cr><cr><cr>Some brief description<esc>kkkeel

"Create note
au FileType rst iabbrev nnn .. note::<cr>

"Start or end bold text inline
au FileType rst inoremap <leader>bb **

"Start or end italics text inline
au FileType rst inoremap <leader>ii *

"Start or end preformatted text inline
au FileType rst inoremap <leader>pf ``

" Fold settings
"au FileType rst set foldmethod=marker

" Admonitions
au FileType rst iabbrev adw .. warning::
au FileType rst iabbrev adn .. note::

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
autocmd FileType markdown.python,snakemake.python,python let g:nvim_ipy_perform_mappings = 0
autocmd FileType markdown.python,snakemake.python,python map ,r <Plug>(IPy-Run)
"autocmd FileType markdown.python,python imap  <ESC><Plug>(IPy-Run)
autocmd FileType markdown.python,snakemake.python,python map ,/ <Plug>(IPy-WordObjInfo)

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

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

nnoremap ,sc :SyntasticToggleMode<CR>:w<CR>

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

"-----------------------------------------------------------------------------
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
" let wiki_1 = {}
" let wiki_1.path = '~/Dropbox/wiki/research'
" let wiki_1.path_html = '~/Dropbox/wiki/public_html'
" let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
" let wiki_1.ext = '.md'
" let wiki_1.syntax = 'markdown'
" let g:vimwiki_list = [wiki_1]

"-----------------------------------------------------------------------------
" Riv
"-----------------------------------------------------------------------------
" let proj1 = {'~/SpiderOak Hive/test'}
" let g:riv_projects = [proj1]
let g:riv_auto_format_table = 0

"-----------------------------------------------------------------------------
" Bufftabline
"-----------------------------------------------------------------------------
let g:buftabline_numbers = 1

"-----------------------------------------------------------------------------
" Better White Space
"-----------------------------------------------------------------------------
let g:strip_whitespace_on_save = 1
let g:better_whitespace_filetypes_blacklist=['rst', 'csv', 'diff', 'gitcommit', 'unite', 'qf', 'help']

"=============================================================================
"                                Functions
"=============================================================================
