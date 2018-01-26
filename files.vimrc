" -----------------------------------------------------------------------
" Buffer and Filetype Settings
" -----------------------------------------------------------------------
" Vim
au FileType vim
  \ set nospell |
  \ set smartindent |
  \ set expandtab |
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2 |
  \ set foldmethod=indent |
  \ let b:comment_leader = '" '

" Bash
au FileType sh
  \ set number |
  \ set nospell |
  \ set smartindent |
  \ set expandtab |
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2 |
  \ set foldmethod=syntax |
  \ let b:comment_leader = '# '

" Python
au BufRead,BufNewfile *.py
  \ set ft=python |
  \ set syntax=python |
  \ set number |
  \ set nospell |
  \ set smartindent |
  \ set expandtab |
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set foldmethod=indent |
  \ set colorcolumn=79 |
  \ let b:comment_leader = '# '

" Snakemake
au BufRead,BufNewfile Snakefile,*.snake,*.snakefile
  \ set ft=snakemake.python |
  \ set syntax=snakemake |
  \ set number |
  \ set nospell |
  \ set smartindent |
  \ set expandtab |
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set foldmethod=indent |
  \ set colorcolumn=79 |
  \ let b:comment_leader = '# '

" CSV and TSV
au BufRead,BufNewfile *.csv,*.tsv
  \ set ft=csv |
  \ set nonumber |
  \ set noexpandtab |
  \ set nospell

" Text
au BufRead,BufNewfile *.txt,*.tex,*.md,*.rst
  \ set lbr |
  \ set tw=80 |
  \ set spell spelllang=en |
  \ set nonumber

" YAML
au BufNewFile,BufRead *.yaml,*.yml
  \ set syntax=yaml |
  \ set foldmethod=indent |
  \ set shiftwidth=2 |

" HTML and XML
au BufNewFile,BufRead *.html,*.xml
  \ set foldmethod=indent |
  \ set shiftwidth=2

" IGV Genome Files
au BufReadCmd *.genome call zip#Browse(expand(""))

" Other Comment code
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType ruby,conf,fstab   let b:comment_leader = '# '
