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

" Deoplete Jedi
let g:deoplete#sources#jedi#server_timeout = 50

" Echodoc
set noshowmode
let g:echodoc#enable_at_startup = 1

" Ale
let g:ale_sign_column_always = 1
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_linters = {
  \ 'python': ['flake8'],
\}

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Better White Space
let g:strip_whitespace_on_save = 1
let g:better_whitespace_filetypes_blacklist=['rst', 'csv', 'diff', 'gitcommit', 'unite', 'qf', 'help']

" tagbar
nmap ,t :TagbarToggle<CR>

" SimplyFold
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 0

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



""-----------------------------------------------------------------------------
"" nvim-ipy
""-----------------------------------------------------------------------------
"autocmd FileType markdown.python,snakemake.python,python let g:nvim_ipy_perform_mappings = 0
"autocmd FileType markdown.python,snakemake.python,python map ,r <Plug>(IPy-Run)
""autocmd FileType markdown.python,python imap  <ESC><Plug>(IPy-Run)
"autocmd FileType markdown.python,snakemake.python,python map ,/ <Plug>(IPy-WordObjInfo)


""-----------------------------------------------------------------------------
"" vim-rst-tables
""-----------------------------------------------------------------------------
"noremap <silent> ;;c : call ReformatTable()<CR>
"noremap <silent> ;;f : call ReflowTable()<CR>
"
"

""-----------------------------------------------------------------------------
"" jedi-vim Settings
""-----------------------------------------------------------------------------
"let g:jedi#popup_on_dot = 0
"
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#goto_assignments_command = ''  " dynamically done for ft=python.
"let g:jedi#goto_definitions_command = ''  " dynamically done for ft=python.
"let g:jedi#use_tabs_not_buffers = 0  " current default is 1.
"let g:jedi#rename_command = '<Leader>gR'
"let g:jedi#usages_command = '<Leader>gu'
"let g:jedi#completions_enabled = 0
"let g:jedi#smart_auto_mappings = 1
"
"" Unite/ref and pydoc are more useful.
"let g:jedi#documentation_command = '<Leader>_K'
"let g:jedi#auto_close_doc = 1

""-----------------------------------------------------------------------------
"" vim cellmode
""-----------------------------------------------------------------------------
"let g:cellmode_use_tmux=1
"let g:cellmode_tmux_sessionname=''
"let g:cellmode_tmux_windowname=''
"let g:cellmode_tmux_panenumber='1'
