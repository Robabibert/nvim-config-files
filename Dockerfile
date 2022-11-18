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
    # Node required for vim-vimrc-coc example
    && curl -sL https://deb.nodesource.com/setup_14.x  | bash - \
    && apt-get install nodejs \
    # Setup latest vim with vim-plug
    && apt-get install -y vim \
    && curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    # Setup latest neovim with vim-plug
    && sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \
    && mkdir -p ~/.config/nvim/ \
    && apt-get clean



#install python dependencies
RUN apt-get install python3 python3-dev python3-pip -y
RUN pip3 install neovim

RUN rustup default nightly
RUN rustup component add rls --toolchain nightly-x86_64-unknown-linux-gnu 
RUN rustup component add rust-analysis --toolchain nightly-x86_64-unknown-linux-gnu 
RUN rustup component add rust-src --toolchain nightly-x86_64-unknown-linux-gnu
RUN rustup component add rustfmt

##get rust-analyzer and make it executable
RUN curl -L -o rust-analyzer-x86_64-unknown-linux-gnu.gz https://github.com/rust-analyzer/rust-analyzer/releases/download/nightly/rust-analyzer-x86_64-unknown-linux-gnu.gz \
    && gzip -d rust-analyzer-x86_64-unknown-linux-gnu.gz \
    && mkdir -p ~/.local/bin \
    && mv rust-analyzer-x86_64-unknown-linux-gnu ~/.local/bin/rust-analyzer \
    && chmod +x ~/.local/bin/rust-analyzer 


ENV PATH=$PATH:/root/.local/bin
FROM base as nvim

RUN mkdir -p /root/.config/nvim

#Get codelldb
RUN mkdir -p /codelldb
RUN curl -L -o /codelldb/codelldb-x86_64-linux.vsix https://github.com/vadimcn/vscode-lldb/releases/download/v1.8.1/codelldb-x86_64-linux.vsix 
RUN unzip /codelldb/codelldb-x86_64-linux.vsix -d /codelldb
RUN rm /codelldb/codelldb-x86_64-linux.vsix


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
