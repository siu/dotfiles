FROM ubuntu:latest
MAINTAINER David Sinuela <siu.4coders@gmail.com>

ARG username

# System setup
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get clean && \
  apt-get -y install curl && \
  apt-get -y install locales

# locale
RUN \
  echo "LC_ALL=en_US.UTF-8" >> /etc/environment && \
  echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
  echo "LANG=en_US.UTF-8" > /etc/locale.conf && \
  locale-gen en_US.UTF-8

# Base dev
RUN \
  apt-get update && \
  apt-get -y install tmux && \
  apt-get -y install git && \
  apt-get -y install fonts-powerline

# neovim
RUN \
  apt-get -y install software-properties-common && \
  add-apt-repository -y ppa:neovim-ppa/stable && \
  apt-get update && \
  apt-get -y install neovim && \
  apt-get install -y python3-pip && \
  pip3 install pynvim

# used by bootstrap.sh
RUN \
  apt-get update && \
  apt-get install -y rsync

# Create user

RUN useradd -ms /bin/bash $username
RUN chown -R $username:$username /home/$username

# SSH keys, credentials, persistent directory TBD at container run time

VOLUME /home/$username/.ssh
VOLUME /home/$username/.credentials/
VOLUME /home/$username/persistent/

ADD . /home/$username/dotfiles/

USER $username
WORKDIR /home/$username/

# Install vim plug
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

USER $username
WORKDIR /home/$username

RUN \
  ./dotfiles/bootstrap.sh -f && \
  nvim --headless +PlugInstall +qall

CMD ["bash"]
