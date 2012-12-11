" Author: Rok Garbas <rok@garbas.si>
" Source: http://github.com/kiberpipa/pipa-vim

function! pipa_html#addons()

call extend(g:PIPA_ADDONS, {
    \   'html5': {
    \       'categories': [ 'web', 'html' ]
    \       },
    \   'sparkup': {
    \       'categories': [ 'web', 'html' ]
    \       },
    \})

endfunction
