FROM cr.hotio.dev/hotio/base@sha256:e2d58acb46c90e2d8d7b020800ee5b3d599c33a6fffdc7176f0f67d2a3237722

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

ARG VERSION

RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v${VERSION}/Jackett.Binaries.LinuxAMDx64.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
