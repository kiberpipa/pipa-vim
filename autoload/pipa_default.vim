" Author: Rok Garbas <rok@garbas.si>
" Source: http://github.com/kiberpipa/pipa-vim

function! pipa_default#addons()

call extend(g:PIPA_ADDONS, {
    \   'Powerline': {
    \       'categories': [ 'default' ],
    \       },
    \})

endfunction
