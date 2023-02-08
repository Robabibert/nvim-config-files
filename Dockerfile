FROM rust as base

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
    # Node required for vim-vimrc-coc markdown-preview example
    && apt install nodejs npm -y\
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
RUN npm install --global yarn
# instakll nvm
# nvm environment variables
ENV NVM_DIR /root/.nvm

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# install node and npm
RUN . $NVM_DIR/nvm.sh \
    && nvm install 19.4 \
    && nvm alias default 19.4 \
    && nvm use default

# install typescript language server
RUN npm install -g typescript typescript-language-server
#install python dependencies
RUN apt-get install python3 python3-dev python3-pip -y
RUN pip3 install neovim

RUN rustup default nightly
RUN rustup component add rls --toolchain nightly-x86_64-unknown-linux-gnu 
RUN rustup component add rust-analysis --toolchain nightly-x86_64-unknown-linux-gnu 
RUN rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu
RUN rustup component add rustfmt

##get rust-analyzer and make it executable
RUN curl -L -o rust-analyzer-x86_64-unknown-linux-gnu.gz https://github.com/rust-analyzer/rust-analyzer/releases/download/2022-12-19/rust-analyzer-x86_64-unknown-linux-gnu.gz \
    && gzip -d rust-analyzer-x86_64-unknown-linux-gnu.gz \
    && mkdir -p ~/.local/bin \
    && mv rust-analyzer-x86_64-unknown-linux-gnu ~/.local/bin/rust-analyzer \
    && chmod +x ~/.local/bin/rust-analyzer 


ENV PATH=$PATH:/root/.local/bin
FROM base as nvim

RUN mkdir -p /root/.config/nvim

#Get codelldb
RUN mkdir -p /root/.local/bin/codelldb
RUN curl -L -o /root/.local/bin/ccodelld/bodelldb-x86_64-linux.vsix https://github.com/vadimcn/vscode-lldb/releases/download/v1.8.1/codelldb-x86_64-linux.vsix 
RUN unzip /root/.local/bin/codelldb-x86_64-linux.vsix -d /root/.local/bin/codelldb
RUN rm /root/.local/bin/codelldb/codelldb-x86_64-linux.vsix

#Get vale for markdown_preview

WORKDIR /root/.local/bin
RUN wget https://github.com/errata-ai/vale/releases/download/v2.21.1/vale_2.21.1_checksums.txt
RUN wget https://github.com/errata-ai/vale/releases/download/v2.21.1/vale_2.21.1_Linux_64-bit.tar.gz 
RUN cat vale_2.21.1_checksums.txt|grep Linux_64|sha256sum --check
RUN tar xfvz vale_2.21.1_Linux_64-bit.tar.gz  
RUN chmod +x vale
WORKDIR /

#Copy config files
COPY lua /root/.config/nvim/lua
COPY spell /root/.config/nvim/spell
COPY init.lua /root/.config/nvim/
COPY .luarc.json /root/.config/nvim/.luarc.json


#get packer
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    /root/.local/share/nvim/site/pack/packer/start/packer.nvim
ENV XDG_CONFIG_HOME=/root/.config

RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# get markdown-preview
#ENV NODE_OPTIONS=--openssl-legacy-provider

WORKDIR /root/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim
RUN yarn install
RUN yarn build
WORKDIR /base

#RUN nvim --headless -c 'PackerInstall'

FROM nvim as development

#disable ASLR for debugging with lldb
#RUN echo 0  > /proc/sys/kernel/randomize_va_space

#allow rust backtrace
ENV RUST_BACKTRACE=full
CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
