FROM ubuntu:24.04

RUN apt-get update

RUN apt-get install -y \
  curl \
  wget \
  gpg

# vscode
RUN echo "code code/add-microsoft-repo boolean true" | debconf-set-selections \
  && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg \
  && install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg \
  && echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | tee /etc/apt/sources.list.d/vscode.list > /dev/null \
  && rm -f packages.microsoft.gpg

# gh
RUN mkdir -p -m 755 /etc/apt/keyrings \
  && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
  && cat $out | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
  && chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

RUN apt-get update \
  && apt-get install -y \
  language-pack-en \
  code \
  gh \
  direnv \
  git \
  vim \
  zsh \
  tmux \
  jq

RUN locale-gen en_US.UTF-8 \
  && update-locale LANG=en_US.UTF-8 \
  && echo "LANG=en_US.UTF-8" > /etc/default/locale \
  && echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale

USER ubuntu

WORKDIR /home/ubuntu
