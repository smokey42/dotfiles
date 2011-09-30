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

Using pyflakes with vim
-----------------------

The Installation routine can not install the pyflakes Python module systemwide.
For simplicity's sake I just did

    cd ~/.vim/bundle/pyflakes
    sudo python setup.py install

I'll later try to automate this so that pyflakes-vim will find the pyflakes
module without having to install it. But that's low prio.

Using vim with Eclipse
----------------------

To use `eclim` you need to visit [this page](http://eclim.org/download.html)
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

Problems I ran into
-------------------

 * It took a while to figure out that eclim only can do code completion when
   Eclipse knows about the file you are working on, the file is saved so Eclipse
   can read it and the file belongs to a project that Eclipse knows about.
 * If you have a non-standard workspace directory (as I have) you must set your
   Eclipse workspace directory in `~/.eclimrc`.

        osgi.instance.area.default=@user.home/workspacedirectory
   If you don't do that, code completion will not work.

Further reading
---------------

 * http://pbrisbin.com/posts/raw_audio
 * http://stackoverflow.com/questions/tagged/eclim
 * http://eclim.org/guides/headless.html
 * http://jyro.blogspot.com/2009/05/android-development-with-vim-eclim.html
