#!/bin/bash

yum -y install gcc
yum -y install libevent-devel ncurses-devel
yum -y install zsh

# install git
yum -y install https://packages.endpoint.com/rhel/7/os/x86_64/endpoint-repo-1.7-1.x86_64.rpm
yum -y install git

# configure git
git config --global user.email "xiangzhuo.meng@cloudchef.io"
git config --global user.name "Meng Xiangzhuo"
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout

# install tmux
yum -y remove tmux
curl -LO https://github.com/tmux/tmux/releases/download/3.1b/tmux-3.1b.tar.gz
tar xzvf tmux-3.1b.tar.gz
cd tmux-3.1b
./configure && make
sudo make install
cd -

# install oh my tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
cd -

# configure tmux
cp ./tmux.conf ~/.tmux.conf.xzmeng
echo -e "\nsource ~/.tmux.conf.xzmeng" >> ~/.tmux.conf.local


# install oh my zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# configure zsh
cp ./zshrc ~/.zshrc.xzmeng
echo -e "source ~/.zshrc.xzmeng" >> ~/.zshrc
sed -i 's/^plugins=.*/plugins=(git z zsh-autosuggestions docker)/' ~/.zshrc

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# install vim
yum -y install vim
git config --global core.editor vim

# configure vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ./vimrc ~/.vimrc.xzmeng
sed -i '\:^source ~/\.vimrc\.xzmeng$:d' ~/.vimrc
echo -e "\nsource ~/.vimrc.xzmeng" >> ~/.vimrc


