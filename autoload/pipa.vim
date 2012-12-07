" Author: Rok Garbas <rok@garbas.si>
" Source: http://github.com/kiberpipa/pipa-vim

let g:PIPA_ADDONS = {}
let g:PIPA_ADDONS_ACTIVATED = []
let g:PIPA_VAM_OPTIONS = {
        \ 'auto_install': 1,
        \ 'plugin_root_dir': $HOME.'/.vim/addons',
        \ 'scm_merge_stategy': 'force',
        \ 'known_repos_activation_policy': 'ask',
        \ }

call pipa_development#addons()
call pipa_python#addons()

function! pipa#category(CATEGORY)

" Install addons and their specific configuration {{{

    let TO_ACTIVATE = []
    for name in keys(g:PIPA_ADDONS)
        if (index(g:PIPA_ADDONS_ACTIVATED, name) == -1)
                \&& (index(keys(g:PIPA_ADDONS[name]), 'categories') != -1)
                \&& (index(g:PIPA_ADDONS[name]['categories'], a:CATEGORY) != -1)
            call extend(TO_ACTIVATE, [name])
        endif
    endfor

    call vam#ActivateAddons(TO_ACTIVATE, g:PIPA_VAM_OPTIONS)

    for name in TO_ACTIVATE 
        if (index(keys(g:PIPA_ADDONS[name]), 'config') != -1)
            :call call(g:PIPA_ADDONS[name]['config'], [])
        endif
    endfor

" }}}

endfunction
