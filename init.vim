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
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deol.nvim', {'on_cmd': 'Deol'})

  " scrooloose
  call dein#add('scrooloose/nerdtree', {'on_cmd': ['NerdTreeToggle', 'NerdTree']})

  " tpope
  call dein#add('tpope/vim-fugitive', {'on_cmd': ['Gwrite', 'Gcommit']})
  call dein#add('tpope/vim-surround', {'on_i': 1})
  call dein#add('tpope/vim-repeat', {'on_i': 1})

  " Python
  call dein#add('zchee/deoplete-jedi',
    \ {'on_ft': ['python', 'snakemake'],
    \ 'on_i': 1})

  call dein#add('w0rp/ale',
    \ {'on_ft': ['python', 'snakemake'],
    \ 'on_i': 1})

  call dein#add('Vimjas/vim-python-pep8-indent',
    \ {'on_ft': ['python', 'snakemake'],
    \ 'on_i': 1})

  call dein#add('davidhalter/jedi-vim',
    \ {'on_ft': ['python', 'snakemake'],
    \ 'on_i': 1})

   call dein#add('bfredl/nvim-ipy',
     \ {'on_ft': ['python', 'snakemake'],
     \  'on_cmd': 'IPython'})

  call dein#add('ccwang002/vim-snakemake',
    \ {'on_ft': ['snakemake']})

  call dein#add('Shougo/echodoc.vim', {'on_ft': ['python', 'snakemake'], 'on_i': 1})

  " R
  call dein#add('jalvesaq/Nvim-R',
    \ {'on_ft': ['r', 'rmd']})

  " others
  call dein#add('junegunn/seoul256.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('airblade/vim-gitgutter', {'on_cmd': 'GitGutter'})
  call dein#add('ntpeters/vim-better-whitespace', {'on_i': 1})
  call dein#add('triglav/vim-visual-increment', {'on_i': 1})
  call dein#add('jlesquembre/rst-tables.nvim',
    \ {'on_cmd': ['TableRstFormat', 'TableRstReflow']})
  call dein#add('majutsushi/tagbar', {'on_cmd': 'TagbarToggle'})
  call dein#add('chrisbra/csv.vim', {'on_ft': ['csv', 'tsv']})
  call dein#add('godlygeek/tabular', {'on_cmd': 'Tabularize'})

"Plug 'Rykka/riv.vim'
"Plug 'Rykka/InstantRst'
"Plug 'tpope/vim-markdown'


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
