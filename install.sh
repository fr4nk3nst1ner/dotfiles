#/bin/bash

if [ -f /etc/os-release ]; then
    . /etc/os-release

    if [ "$ID_LIKE" == "debian" ]; then
        sudo apt update -y && \
            sudo apt install -y \
                apt-transport-https \
                ca-certificates \
                curl \
                gnupg-agent \
                software-properties-common \
                tmux \
                htop \
                python3 \
                python3-pip \
                tree \
                git \
                jq \
                net-tools \
                nmap \
                zsh \
                s3fs \
                awscli \
                tree \
                ifmetric \
                glances \
                acl \
                ansible

        curl -fsSL https://get.docker.com | sudo bash
        sudo usermod -aG docker ubuntu
    fi
fi

cp ./.bash_profile $HOME/.bash_profile
cp ./.vimrc $HOME/.vimrc
mkdir $HOME/.vim_runtime
cp -r ./vimrcs $HOME/.vim_runtime/
cp ./.zshrc $HOME/.zshrc
#cp ./.tmux.conf $HOME/.tmux.conf

sudo cp ./.bash_profile /root/.bash_profile
sudo cp ./.vimrc /root/.vimrc
mkdir /root/.vim_runtime
cp -r ./vimrcs /root/.vim_runtime/
cp ./.zshrc /root/.zshrc
#sudo cp ./.tmux.conf /root/.tmux.conf

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/scripts/install_plugins.sh
