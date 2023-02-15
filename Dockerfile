FROM python3 as base

USER root
ENV USER=root


#Install newest neovim
RUN curl -L -o nvim-linux64.deb https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
RUN curl -L -o nvim-linux64.deb.sum https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb.sha256sum
##check shasum
RUN sha256sum -c nvim-linux64.deb.sum 
RUN apt install ./nvim-linux64.deb
RUN rm ./nvim-linux64.deb
RUN rm ./nvim-linux64.deb.sum



RUN apt-get update \
    # Install common deps
    && apt-get install -y build-essential curl git exuberant-ctags software-properties-common gnupg git \
    #get fish terminal
    && apt-get install fish -y\
    # Setup latest vim with vim-plug
    && apt-get install -y vim \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    # Setup latest neovim with vim-plug
    && sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \
    && mkdir -p ~/.config/nvim/ \
    && apt-get clean
# instakll nvm
# nvm environment variables
ENV NVM_DIR /root/.nvm


#install python dependencies
RUN apt-get install python3 python3-dev python3-pip -y
RUN pip3 install neovim

ENV PATH=$PATH:/root/.local/bin
FROM base as nvim

RUN mkdir -p /root/.config/nvim
WORKDIR /

#Copy config files
COPY lua /root/.config/nvim/lua
COPY spell /root/.config/nvim/spell
COPY init.lua /root/.config/nvim/
COPY .luarc.json /root/.config/nvim/.luarc.json

COPY ./../requirements.txt /
RUN pip install -r /requirements.txt
RUN pip install debugpy
#get packer
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    /root/.local/share/nvim/site/pack/packer/start/packer.nvim
ENV XDG_CONFIG_HOME=/root/.config

RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

#RUN nvim --headless -c 'PackerInstall'

FROM nvim as development


CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
