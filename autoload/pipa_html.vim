" Author: Rok Garbas <rok@garbas.si>
" Source: http://github.com/kiberpipa/pipa-vim

function! pipa_html#addons()

function! Sparkup()
    let g:sparkup = {}
    let g:sparkup.lhs_expand = '<c-s>'
endfunction

call extend(g:PIPA_ADDONS, {
    \   'html5': {
    \       'categories': [ 'web', 'html' ],
    \       },
    \   'sparkup': {
    \       'categories': [ 'web', 'html' ],
    \       'config': function('Sparkup'),
    \       },
    \})

endfunction
