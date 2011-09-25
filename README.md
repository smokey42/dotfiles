smokey42's dotfiles
===================

This repo contains my basic dotfiles as well as my vim configuration.

How to use it
-------------

    cd ~
    git init
    git remote add origin git://github.com/smokey42/dotfiles.git
    git pull
    git submodule init
    git submodule update
    vim -c BundleInstall -c qa

After the last command, all referenced *vim* plugins will be installed.

If you see *.vim/bundle/vundle (untracked content)* in `git status`, this
is because `BundleInstall` creates the file .vim/bundle/vundle/doc/tags. Just
ignore the warning.

Using vim with Eclipse
----------------------

To use `eclim` you need to visit [this page](http://eclim.org/download.html)
and download the installer first.
Start it with something like `java -jar eclim_1.7.2.jar` and click through
the following wizard. When you're ready it will download and compile
additional stuff.

TODO
----

Things to look into:

 * https://code.google.com/p/maven-android-plugin/
 * http://jyro.blogspot.com/2009/05/android-development-with-vim-eclim.html

Things to solve:

 * Setting `JAVA_HOME` correctly for Eclim.
