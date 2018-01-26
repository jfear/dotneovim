" -----------------------------------------------------------------
" General Settings
" ----------------------------------------------------------------
set hidden          " This allows you to leave a buffer with out saving you will be promted to save upon quit
set scrolloff=3     " Minimal number of screen lines to keep above and below the cursor.
set ignorecase      " Ignore case when searching
set smartcase       " If serach contains upper case then turn on case sensitive search
set noswapfile
set showmatch
set clipboard+=unnamedplus
set modeline
"set modelines=1
set mouse=a
set wildmode=list:longest
set number
set relativenumber
set spelllang=en_us
set nospell

" Change to the current directory of the current file
au BufEnter * if expand('%p') !~ '://' | :lchdir %:p:h | endif
