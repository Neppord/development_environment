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

RUN git clone \
  https://github.com/bling/vim-airline \
  ~/.vim/bundle/vim-airline

RUN git clone \
  https://github.com/scrooloose/syntastic.git \ 
  ~/.vim/bundle/syntastic


COPY .vimrc /root/.vimrc

CMD tmux -2
