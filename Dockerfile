FROM hotio/dotnetcore

ARG DEBIAN_FRONTEND="noninteractive"

ENV APP="Jackett"
EXPOSE 9117
HEALTHCHECK --interval=60s CMD curl -fsSL http://localhost:9117 || exit 1

# install app
# https://github.com/Jackett/Jackett/releases
RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v0.11.184/Jackett.Binaries.LinuxAMDx64.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
