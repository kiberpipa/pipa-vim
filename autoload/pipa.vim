" Author: Rok Garbas <rok@garbas.si>
" Source: http://github.com/kiberpipa/pipa-vim

function! pipa#category(CATEGORY, ...)

    let CUSTOM_ADDONS = a:0 >= 1 ? a:1 : {}
    let CUSTOM_VAM_OPTIONS = a:0 >= 2 ? a:2 : {}

    if (tlib#type#IsString(a:CATEGORY))
        let CATEGORY = [ a:CATEGORY ]
    else
        let CATEGORY = a:CATEGORY
    endif


" All avaliable addons {{{

    let ADDONS = {}

    "call pipa_python#addons(all_addons)

    call extend(ADDONS, CUSTOM_ADDONS)

" }}}

" Install addons and their specific configuration {{{

    let TO_ACTIVATE = []
    for name in keys(ADDONS)
        if ((index(keys(ADDONS[name]), 'categories') != -1)
                \&& (index(ADDONS[name]['categories'], a:CATEGORY) != -1))
                \|| (a:CATEGORY== 'default')
            call extend(TO_ACTIVATE, [name])
        endif
    endfor

    let VAM_OPTIONS = extend({
            \ 'auto_install': 1,
            \ 'plugin_root_dir': $HOME.'/.vim/addons',
            \ 'scm_merge_stategy': 'force',
            \ 'known_repos_activation_policy': 'ask',
            \ }, CUSTOM_VAM_OPTIONS)
    call vam#ActivateAddons(TO_ACTIVATE, VAM_OPTIONS)

    for name in TO_ACTIVATE 
        if (index(keys(ADDONS[name]), 'config') != -1)
            :call call(ADDONS[name]['config'], [])
        endif
    endfor

" }}}

endfunction
