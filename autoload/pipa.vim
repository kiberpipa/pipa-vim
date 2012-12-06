" Author: Rok Garbas <rok@garbas.si>
" Source: http://github.com/kiberpipa/pipa-vim

fun! pipa#category(category, custom_addons, custom_vam_options)

" All avaliable addons {{{

let all_addons = {}

call pipa_python#addons(all_addons)

call extend(all_addons, custom_addons)

" }}}


" Install addons and their specific configuration {{{

let addons_to_activate = []
let settings_to_activate = []

for addon in all_addons

    if (index(addon[1], a:category) != -1) || (a:category == 'default')
        call extend(addons_to_activate, [addon[0]])
        if exists("addon[2]")
            call extend(settings_to_activate, [addon[2]])
        endif
    endif

endfor


let vam_options = extend({
        \ 'auto_install': 1,
        \ 'plugin_root_dir': $HOME.'/.vim/addons',
        \ 'scm_merge_stategy': 'force',
        \ 'known_repos_activation_policy': 'ask',
        \ }, custom_vam_options)

call vam#ActivateAddons(addons_to_activate, vam_options)

for addon_function in settings_to_activate
    :call call(function(addon_function), [])
endfor

" }}}

endfun
