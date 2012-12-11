" Author: Rok Garbas <rok@garbas.si>
" Source: http://github.com/kiberpipa/pipa-vim

function! pipa_development#addons()

function! Syntastic ()
    let g:syntastic_check_on_open=1
    let g:syntastic_auto_jump=0
    let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
endfunction

function! Gundo ()
    let g:gundo_preview_bottom = 1
    map <LEADER>G :GundoToggle<cr>
endfunction

function! Fugitive ()
    map <LEADER>gg :Git
    map <LEADER>gr :Gremove
    map <LEADER>gm :Gmove
    map <LEADER>gs :Gstatus<CR>
    map <LEADER>gd :Gdiff<CR>
endfunction

function! TaskList ()
    map <LEADER>tt <Plug>TaskList
endfunction

function! Tagbar()
    nmap <LEADER>tb :TagbarToggle<CR>
endfunction

call extend(g:PIPA_ADDONS, {
    \   'Syntastic': {
    \       'categories': [ 'development' ],
    \       'config': function('Syntastic')
    \       },
    \   'Gundo': {
    \       'categories': [ 'development' ],
    \       'config': function('Gundo')
    \       },
    \   'fugitive': {
    \       'categories': [ 'development' ],
    \       'config': function('Fugitive')
    \       },
    \   'TaskList': {
    \       'categories': [ 'development' ],
    \       'config': function('TaskList')
    \       },
    \   'Tagbar': {
    \       'categories': [ 'development' ],
    \       'config': function('Tagbar')
    \       },
    \})

endfunction
