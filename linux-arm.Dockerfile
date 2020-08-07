FROM hotio/base@sha256:adec3ba5bb37ee1a04734455262d53ccc1864573ff5171b0754ac5d6a0032476

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 9117

# install packages
RUN apt update && \
    apt install -y --no-install-recommends --no-install-suggests \
        libicu66 && \
# clean up
    apt autoremove -y && \
    apt clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ARG JACKETT_VERSION

RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VERSION}/Jackett.Binaries.LinuxARM32.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
