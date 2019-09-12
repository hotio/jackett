FROM hotio/dotnetcore

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 9117
HEALTHCHECK --interval=60s CMD curl -fsSL -b /dev/shm/cookie http://localhost:9117 || exit 1

COPY root/ /

# install app
RUN version=$(sed -n '1p' /versions/jackett) && \
    curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v${version}/Jackett.Binaries.LinuxAMDx64.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"
