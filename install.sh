#!/bin/bash

yum -y install gcc
yum -y install libevent-devel ncurses-devel
yum -y install zsh

# install git
yum -y install https://packages.endpoint.com/rhel/7/os/x86_64/endpoint-repo-1.7-1.x86_64.rpm
yum install git

# install tmux
yum -y remove tmux
curl -LO https://github.com/tmux/tmux/releases/download/3.1b/tmux-3.1b.tar.gz
tar xzvf tmux-3.1b.tar.gz
cd tmux-3.1b
./configure && make
sudo make install
cd ..

# install oh my tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# install oh my zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp ~/.zshrc ~/.zshrc.orig
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="fishy"/' ~/.zshrc

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install neovim
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y neovim python3-neovim
echo "alias nvi=nvim" >> ~/.bashrc
echo "alias vi=nvim" >> ~/.bashrc
echo "alias nvi=nvim" >> ~/.zshrc
echo "alias vi=nvim" >> ~/.zshrc

# init git
git config --global user.email "xiangzhuo.meng@cloudchef.io"
git config --global user.name "Meng Xiangzhuo"
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout
