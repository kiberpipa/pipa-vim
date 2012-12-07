Purpose
=======

TODO: describe purpose of pipa-vim

.. contents::


Install
=======

How to install ``pipa-vim`` in your user account.

Bootstrap VAM
-------------

::

    mkdir ~/.vim/addons -p
    cd ~/.vim/addons
    git clone git://github.com/MarcWeber/vim-addon-manager.git


.vimrc
------

Backup you're old .vimrc and replace it with this lines::

    set runtimepath+=$HOME/.vim/addons/vim-addon-manager
    call vam#ActivateAddons(['github:kiberpipa/pipa-vim'], {'auto_install': 0})

    if exists("$VIMCATEGORY")
        call pipa#category($VIMCATEGORY)
    else
        for CATEGORY in [ 'development', 'python', 'html', 'css', 'javascript' ]
            call pipa#category(CATEGORY)
        endfor
    endif


Using
=====

TODO: different scenarios of usage


Categories
==========

TODO: what are categories


Python
------


Javascript
----------


HTML
----


CSS
---


