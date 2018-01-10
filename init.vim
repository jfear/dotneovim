" Initialize NeoVim Settings
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.config/nvim/dein')
  call dein#begin('$HOME/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  " Shougo
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim', {'on_i': 1})
  call dein#add('Shougo/denite.nvim', {'on_cmd': 'Denite'})
  call dein#add('Shougo/deol.nvim')
  call dein#add('Shougo/echodoc.vim', {'on_i': 1})

  " scrooloose
  call dein#add('scrooloose/nerdtree', {'on_cmd': 'NerdTreeToggle'})

  " tpope
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')

  " Python
  call dein#add('zchee/deoplete-jedi',
    \ {'on_ft': ['python', 'snakemake'],
    \ 'on_i': 1})

  call dein#add('w0rp/ale',
    \ {'on_ft': ['python', 'snakemake']})

  call dein#add('tmhedberg/SimpylFold',
    \ {'on_ft': ['python', 'snakemake']})

  call dein#add('Vimjas/vim-python-pep8-indent',
    \ {'on_ft': ['python', 'snakemake']})

  call dein#add('davidhalter/jedi-vim',
    \ {'on_ft': ['python', 'snakemake']})

  " R
  call dein#add('jalvesaq/Nvim-R',
    \ {'on_ft': ['r', 'rmd']})

  " others
  call dein#add('junegunn/seoul256.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('triglav/vim-visual-increment')
  call dein#add('majutsushi/tagbar', {'on_cmd': 'TagbarToggle'})
  call dein#add('chrisbra/csv.vim', {'on_ft': ['csv', 'tsv']})

"Plug 'Rykka/riv.vim'
"Plug 'Rykka/InstantRst'
"Plug 'bfredl/nvim-ipy'
""Plug 'julienr/vim-cellmode'
"Plug 'ccwang002/vim-snakemake'
"Plug 'chrisbra/csv.vim'
"Plug 'davidhalter/jedi-vim'
"Plug 'godlygeek/tabular'
"Plug 'tpope/vim-markdown'
"Plug 'visincr'
"Plug 'mattn/gist-vim'
"Plug 'mattn/webapi-vim'


  " You can specify revision/branch/tag.
  "call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif


source $HOME/.config/nvim/general.vimrc
source $HOME/.config/nvim/keys.vimrc
source $HOME/.config/nvim/plugins.vimrc
source $HOME/.config/nvim/files.vimrc
