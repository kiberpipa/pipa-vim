" Author: Rok Garbas <rok@garbas.si>
" Source: http://github.com/kiberpipa/pipa-vim

function! pipa_python#addons()

call extend(g:PIPA_ADDONS, {
    \   'Python-mode-klen': {
    \       'categories': [ 'python' ]
    \       },
    \})

endfunction
