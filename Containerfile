FROM debian:stable

LABEL description=Container development environment based around bclindner dotfiles.

RUN apt-get update
RUN apt-get install -y \
    zsh git curl neovim locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
RUN adduser \
    --home /home/bclindner \
    --gecos "Brian Lindner" \
    --shell /usr/bin/zsh \
    --disabled-password \
    bclindner
WORKDIR /home/bclindner
COPY init.sh ./init.sh
RUN chmod +x ./init.sh
RUN chown bclindner:bclindner ./init.sh
RUN rm -rf /home/bclindner/.config/nvim/
USER bclindner
RUN zsh ./init.sh
