FROM debian:stable
COPY ./install /install
WORKDIR /install
RUN ./install.sh
CMD zsh
WORKDIR /
