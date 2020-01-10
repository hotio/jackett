FROM hotio/dotnetcore@sha256:4524ea84157df940f79f724a59d86e1e17d766ef6406875126835a7a94d7d277

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 9117

# https://github.com/Jackett/Jackett/releases
ARG JACKETT_VERSION=0.12.1525

# install app
RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VERSION}/Jackett.Binaries.LinuxARM64.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
