Extra Vim plugins for Go
========================

This is a collection of extra vim plugins for Go. This is based on go's official repository located at `misc/vim`.
This plugins provides following feature:

* `:Godoc` command to open documentation window.
* `:Fmt` command to format current buffer.
* `:Import` command to add import statement.

And if you has installed some go utilities, this will add runtime path to the vim plugins which is the utilities provides.
Below is the list of supported utilities.

* gocode (https://github.com/nsf/gocode)
* lint (https://github.com/golang/lint)

Installation
------------

To install using pathogen.vim:

    cd ~/.vim/bundle
    git clone https://github.com/vim-jp/vim-go-extra.git
    
To install using [Vundle](https://github.com/gmarik/vundle):

    " add this line to your .vimrc file
    Plugin 'vim-jp/vim-go-extra'

To checkout the source from repository:

    cd ~/.vim/bundle
    git clone https://github.com/vim-jp/vim-go-extra.git


Configuration
-------------

A popular configuration is to gofmt Go source files when they are saved.
To do that, add this line to the end of your $HOME/.vimrc.

    autocmd FileType go autocmd BufWritePre <buffer> Fmt

License
-------

Same as original plugins that go was provided. i.e. BSD
