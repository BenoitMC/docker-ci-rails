FROM buildpack-deps:bookworm
COPY ./install /install
RUN /install/install.sh
CMD bash
