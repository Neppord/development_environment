FROM jpetazzo/dind

RUN apt-get update
RUN apt-get install -qqy vim git tmux

