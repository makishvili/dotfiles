#!/bin/sh

# Config builder
# Copyright 2012 Alexander Tarmolov <tarmolov@gmail.com>

# show program usage
show_usage() {
    echo "usage: ./build.sh [--clean] --name=<your name> --email=<your email>"
    echo "      --clean         removes all builded files (optional)"
    echo "      --name          your name for git and debian"
    echo "      --email         your email for git and debian"
    exit
}

# clean config files
# + .vim
clean() {
    for file in .zshrc .tmux.conf .vimrc .profile .gitconfig
    do
        rm -rf ~/$file
    done
}

# process command-line arguments
for OPT in "$@" ; do
    case $OPT in
        -*)  true ;
            case $OPT in
               --help)
                    show_usage;;
                --name=*)
                    NAME=${OPT##*=}
                    shift ;;
                --email=*)
                    EMAIL=${OPT##*=}
                    shift ;;
                --clean)
                    echo "Clean old config files..."
                    clean
                    exit;;
                -*)
                    echo "Illegal option"
                ;;
            esac
        ;;
    esac
done

echo "Config setup is started..."
echo

read -p "Config builder wants to delete .zshrc, .tmux.conf, .gitconfig, .vimrc and .vim. Do you want to continue? (y/n)? "
[ "$REPLY" != "y" ] && exit

echo "Clean old config files..."
clean

# create symblinks
ln -sf ~/.configs/tmux/.tmux.conf ~/.tmux.conf
ln -sf ~/.configs/vim/.vimrc ~/.vimrc
ln -sf ~/.configs/zsh/templates/.zshrc ~/.zshrc

cd ~/.configs
git submodule init
git submodule update

echo "Install vim plugins..."
sleep 1

vim -c ":BundleInstall" -c ":qa"
cd - >> /dev/null

echo "Generate .profile and .gitconfig"

# generate .profile if name and e-mail are set
if [ -n "$NAME" ] &&  [ -n "$EMAIL" ]; then
    echo "export DEBFULLNAME=\"$NAME\"" >> ~/.profile
    echo "export DEBEMAIL=$EMAIL" >> ~/.profile
    echo "export EMAIL=$EMAIL" >> ~/.profile

    echo "[user]" >> ~/.gitconfig
    echo "  name = $NAME" >> ~/.gitconfig
    echo "  email = $EMAIL" >> ~/.gitconfig
fi

# echo ". ~/.configs/.profile" >> ~/.profile
echo "[include]" >> ~/.gitconfig
echo "  path = .configs/.gitconfig" >> ~/.gitconfig

echo "Add useful commands"
mkdir -p ~/bin
ln -sf ~/.configs/.bin/diffconflicts ~/bin
# add tmux start config
ln -sf ~/.configs/.bin/tm ~/bin

echo
echo "Config setup is finished..."
