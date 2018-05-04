FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -qqy curl wget vim git tmux python-pip

# Install Node.js
RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  npm install -g npm


RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# vim syntax
RUN git clone \
  git://github.com/altercation/vim-colors-solarized.git \
  ~/.vim/bundle/vim-colors-solarized & \
  git clone \
  git://github.com/digitaltoad/vim-jade.git \
  ~/.vim/bundle/vim-jade & \
  git clone \
  git://github.com/JulesWang/css.vim.git \
  ~/.vim/bundle/css.vim & \
  git clone \
  git://github.com/genoma/vim-less.git \
  ~/.vim/bundle/vim-less & \
  wait

# Rope
RUN git clone \
  https://github.com/python-rope/ropevim.git \
  ~/.vim/bundle/ropevim && \
  pip install ~/.vim/bundle/ropevim

# Airline and plugins
RUN git clone \
  https://github.com/bling/vim-airline \
  ~/.vim/bundle/vim-airline & \
  git clone \
  https://github.com/scrooloose/syntastic.git \ 
  ~/.vim/bundle/syntastic & \
  git clone \
  https://github.com/mhinz/vim-signify \
  ~/.vim/bundle/vim-signify && \
  wait

RUN git clone \
  https://github.com/vim-scripts/Mark--Karkat.git \
  ~/.vim/bundle/Mark--Karkat

COPY .tmux.conf /root/.tmux.conf
COPY .vimrc /root/.vimrc

WORKDIR /root/code

ENV TERM xterm-256color
CMD tmux

RUN apt-get install -y locales

RUN locale-gen sv_SE.UTF-8  
ENV LANG sv_SE.UTF-8  
ENV LANGUAGE sv_SE:sv  
ENV LC_ALL sv_SE.UTF-8  

RUN git config --global push.default simple

RUN echo "alias npm-exec='PATH=\$(npm bin):\$PATH'" >> ~/.bashrc
