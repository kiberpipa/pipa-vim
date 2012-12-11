" Author: Rok Garbas <rok@garbas.si>
" Source: http://github.com/kiberpipa/pipa-vim

function! pipa_css#addons()

call extend(g:PIPA_ADDONS, {
    \   'css_color@skammer': {
    \       'categories': [ 'web', 'css' ]
    \       },
    \   'vim-less': {
    \       'categories': [ 'web', 'css' ]
    \       },
    \})

endfunction
