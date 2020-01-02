FROM hotio/dotnetcore@sha256:e36e3de92233c69859f85d8fa1ca5066840d2f6d2e419b5c6f934603a0cefa45

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 9117

# https://github.com/Jackett/Jackett/releases
ARG JACKETT_VERSION=0.12.1398

# install app
RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VERSION}/Jackett.Binaries.LinuxAMDx64.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
