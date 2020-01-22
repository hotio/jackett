FROM hotio/dotnetcore@sha256:4645191ffe8a667b175c92738f81646ae8575ad2b6d61338825c24fbe5bbf4a5

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 9117

# https://github.com/Jackett/Jackett/releases
ARG JACKETT_VERSION=0.12.1632

# install app
RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VERSION}/Jackett.Binaries.LinuxARM64.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
