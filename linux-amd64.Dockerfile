ARG BRANCH
FROM hotio/dotnetcore:${BRANCH}

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 9117

COPY root/ /

# https://github.com/Jackett/Jackett/releases
ENV JACKETT_VERSION=0.11.760

# install app
RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VERSION}/Jackett.Binaries.LinuxAMDx64.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"
