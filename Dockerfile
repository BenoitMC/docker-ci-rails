FROM debian:stable
COPY ./install /install
RUN /install/install.sh
CMD zsh
