" -----------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------
" Seoul256
let g:seoul256_background = 234
colorscheme seoul256

" Deoplete
let g:deoplete#enable_at_startup = 1
"     let g:deoplete#disable_auto_complete = 1
set completeopt=menu

" Neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Deoplete Jedi
let g:deoplete#sources#jedi#server_timeout = 500

" Denite
call denite#custom#var('file_rec', 'command',
  \ ['find', '-L', ':directory',
  \ '-path', '*/.git/*', '-prune', '-o',
  \ '-path', '*/.cache/*', '-prune', '-o',
  \ '-path', '*/.snakemake/*', '-prune', '-o',
  \ '-path', '*/.ipynb_checkpoints/*', '-prune', '-o',
  \ '-type', 'l', '-print', '-o',
  \ '-type', 'f', '-print'])

noremap <silent> <C-p> :Denite file_rec<CR>

" Echodoc
set noshowmode
let g:echodoc#enable_at_startup = 1

" Ale
let g:ale_sign_column_always = 1
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_linters = {
  \ 'python': ['flake8'],
\}

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


" Better White Space
let g:strip_whitespace_on_save = 1
let g:better_whitespace_filetypes_blacklist=['rst', 'csv', 'diff', 'gitcommit', 'unite', 'qf', 'help']

" tagbar
nmap ,t :TagbarToggle<CR>

" Nvim-R
au Filetype r,rmd,rnw inoremap <C-Space> <C-x><C-o>
au Filetype r,rmd,rnw vmap <C-J> <Plug>RDSendSelection
au Filetype r,rmd,rnw nmap <C-J> <Plug>RDSendLine

let rout_follow_colorscheme = 1
"let R_assign = 3  " nvim-r replaces ' __ ' with ' <- '
let R_assign_map = '__'
let R_nvimpager = "horizontal"

" Nvim-R (knitrBootstrap)
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

" jedi-vim Settings
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
let g:jedi#completions_enabled = 0
let g:jedi#auto_close_doc = 1

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

" CSV
aug CSV_Editing
  au!
  au BufRead,BufWritePost *.csv,*.tsv :%ArrangeColumn
  au BufWritePre *.csv,*.tsv :%UnArrangeColumn
aug end

" nvim-ipy
au FileType markdown.python,snakemake.python,python let g:nvim_ipy_perform_mappings = 0
au FileType markdown.python,snakemake.python,python map ,r <Plug>(IPy-Run)
" au FileType markdown.python,python imap  <ESC><Plug>(IPy-Run)
au FileType markdown.python,snakemake.python,python map ,/ <Plug>(IPy-WordObjInfo)

" rst-tables
nmap ;;c <Plug>(format-rst-table)
nmap ;;f <Plug>(reflow-rst-table)

" Git
aug gitgutter
  au!
  au BufRead * :GitGutter
aug end

" vimwiki
let g:vimwiki_list = [{'path': '~/research-wiki/src',
          \ 'syntax': 'markdown',
          \ 'ext': '.vimwiki',
          \ 'path_html': '~/research-wiki/html/',
          \ 'custom_wiki2html': '~/research-wiki/tools/wiki2html.sh',
          \ 'custom_wiki2html_args': '',
          \ 'auto_export': 1,
          \ 'auto_toc': 1}]

au FileType vimwiki set ft=markdown

" ipynb_vim
let g:notedown_enable=1
let g:notedown_code_match='all'

" Pencil
let g:pencil#textwidth=100
