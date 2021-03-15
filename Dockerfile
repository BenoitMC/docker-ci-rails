FROM buildpack-deps:buster
COPY ./install /install
RUN /install/install.sh
CMD bash
