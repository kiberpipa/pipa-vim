" Author: Rok Garbas <rok@garbas.si>
" Source: http://github.com/kiberpipa/pipa-vim

function! pipa_javascript#addons()

call extend(g:PIPA_ADDONS, {
    \   'jQuery': {
    \       'categories': [ 'javascript', 'web' ]
    \       },
    \})

endfunction
