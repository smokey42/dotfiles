smokey42's dotfiles
===================

This repo contains my basic dotfiles as well as my vim configuration.

How to use it
-------------

    cd ~
    git init
    git remote add origin git://github.com/smokey42/dotfiles.git
    git pull origin master
    git submodule update --init
    vim -c BundleInstall -c qa

After the last command, all referenced *vim* plugins will be installed.

If you see *.vim/bundle/vundle (untracked content)* in `git status`, this
is because `BundleInstall` creates the file .vim/bundle/vundle/doc/tags. Just
ignore the warning.

Upgrading git-based Bundles
---------------------------

This is actually pretty easy. Just run the following command and all git-based
bundles will be updated to the current version of their origin.

    awk -F/ '/Bundle/ && /\// { print "cd ~/.vim/bundle/" $2 "; git pull" }' .vimrc|sed "s/'//"|bash

Using vim with Eclipse
----------------------

To use `eclim` you need to visit [Eclim's download page](http://eclim.org/download.html)
and download the installer first. Executing the following command will performa
an unattended installation of eclim.

    java \
        -Declipse.home=$HOME/bin/eclipse-installation \
        -Dvim.files=$HOME/.vim \
        -DfeatureList.ant=true \
        -DfeatureList.jdt=true \
        -DfeatureList.maven=true \
        -DfeatureList.python=true \
        -jar eclim_1.7.2.jar install

Interesting to Python programmers: Eclim also includes [rope](http://rope.sourceforge.net/),
of which I found the Integration to be of superiour quality when compared against pyflakes.
Especially on 512kB large (don't ask!) Python files.

Problems I ran into
-------------------

 * It took a while to figure out that eclim only can do code completion when
   Eclipse knows about the file you are working on, the file is saved so Eclipse
   can read it and the file belongs to a project that Eclipse knows about.
 * If you have a non-standard workspace directory (as I have) you must set your
   Eclipse workspace directory in `~/.eclimrc`.

        osgi.instance.area.default=@user.home/workspacedirectory
   If you don't do that, code completion will not work.

I really should try that
------------------------

 * When triggering `undo` in a pristine file, a splitscreen should show older
   versions of the same code pulled from the git repository.
 * http://jeetworks.org/node/89

Further reading
---------------

 * http://sontek.net/turning-vim-into-a-modern-python-ide
 * http://pbrisbin.com/posts/raw_audio
 * http://stackoverflow.com/questions/tagged/eclim
 * http://eclim.org/guides/headless.html
 * http://jyro.blogspot.com/2009/05/android-development-with-vim-eclim.html
 * http://blog.ultimalatet.ch/2010/10/android-devel-using-eclim.html
