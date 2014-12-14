FROM ubuntu:15.04

RUN apt-get update
RUN apt-get install -qqy vim git tmux

