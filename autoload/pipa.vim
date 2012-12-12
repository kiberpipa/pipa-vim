" Author: Rok Garbas <rok@garbas.si>
" Source: http://github.com/kiberpipa/pipa-vim

if !exists('g:PIPA_ADDONS')
    let g:PIPA_ADDONS = {}
endif

if !exists('g:PIPA_ADDONS_ACTIVATED')
    let g:PIPA_ADDONS_ACTIVATED = []
endif

if !exists('g:PIPA_VAM_OPTIONS')
    let g:PIPA_VAM_OPTIONS = {
        \ 'auto_install': 1,
        \ 'plugin_root_dir': $HOME.'/.vim/addons',
        \ 'scm_merge_stategy': 'force',
        \ 'known_repos_activation_policy': 'ask',
        \ }
endif

let g:PIPA_ADDONS_TO_ACTIVATE = []

call pipa_default#addons()
call pipa_development#addons()
call pipa_python#addons()
call pipa_html#addons()
call pipa_css#addons()
call pipa_javascript#addons()

function! pipa#category(CATEGORY)


    for name in keys(g:PIPA_ADDONS)
        if ((index(keys(g:PIPA_ADDONS[name]), 'categories') != -1)
            \&& (index(g:PIPA_ADDONS[name]['categories'], a:CATEGORY) != -1))
            call extend(g:PIPA_ADDONS_TO_ACTIVATE, [name])
        endif
    endfor

endfunction


function pipa#initialize()

    call vam#ActivateAddons(g:PIPA_ADDONS_TO_ACTIVATE, g:PIPA_VAM_OPTIONS)

    for name in g:PIPA_ADDONS_TO_ACTIVATE 
        if (index(keys(g:PIPA_ADDONS[name]), 'config') != -1)
            :call call(g:PIPA_ADDONS[name]['config'], [])
        endif
    endfor

endfunction
