FROM ubuntu:15.04

RUN apt-get update
RUN apt-get install -qqy curl vim git tmux

COPY .tmux.conf /root/.tmux.conf

RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

RUN git clone \
  git://github.com/altercation/vim-colors-solarized.git \
  ~/.vim/bundle/vim-colors-solarized.git

RUN git clone \
  https://github.com/python-rope/ropevim.git \
  ~/.vim/bundle/ropevim

RUN apt-get install -qqy python-pip
RUN pip install ~/.vim/bundle/ropevim

# Airline and plugins
RUN git clone \
  https://github.com/bling/vim-airline \
  ~/.vim/bundle/vim-airline

RUN git clone \
  https://github.com/scrooloose/syntastic.git \ 
  ~/.vim/bundle/syntastic

RUN git clone \
  https://github.com/mhinz/vim-signify \
  ~/.vim/bundle/vim-signify

# End of airline and plugins

RUN git clone \
  https://github.com/vim-scripts/Mark--Karkat.git \
  ~/.vim/bundle/Mark--Karkat

COPY .vimrc /root/.vimrc

WORKDIR /root/code

ENV TERM xterm-256color
CMD tmux

RUN locale-gen sv_SE.UTF-8  
ENV LANG sv_SE.UTF-8  
ENV LANGUAGE sv_SE:sv  
ENV LC_ALL sv_SE.UTF-8  
