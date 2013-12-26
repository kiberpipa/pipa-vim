" Author: Rok Garbas <rok@garbas.si>
" Source: http://github.com/kiberpipa/pipa-vim

function! pipa_default#addons()

function! Addons_airlineish()
    let g:airline_theme = 'airlineish'
endfunction

call extend(g:PIPA_ADDONS, {
    \   'vim-airline': {
    \       'categories': [ 'default' ],
    \       },
    \   'airlineish': {
    \       'categories': [ 'default' ],
    \       'config': function('Addons_airlineish')
    \       },
    \})

endfunction
