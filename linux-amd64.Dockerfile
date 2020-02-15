FROM hotio/dotnetcore@sha256:cf67da1687fc378c496e2d896a932691e2838b27ce6a9764ed57d862ad79c3e4

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 9117

# https://github.com/Jackett/Jackett/releases
ARG JACKETT_VERSION=0.13.122

# install app
RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VERSION}/Jackett.Binaries.LinuxAMDx64.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
