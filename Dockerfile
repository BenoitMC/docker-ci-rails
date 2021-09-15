FROM buildpack-deps:bullseye
COPY ./install /install
RUN /install/install.sh
CMD bash
