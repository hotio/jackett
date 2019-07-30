FROM hotio/dotnetcore

ARG DEBIAN_FRONTEND="noninteractive"
ARG ARCH_JACKETT="LinuxAMDx64"

ENV APP="Jackett"
ENV ARCH="${ARCH_JACKETT}"
EXPOSE 9117
HEALTHCHECK --interval=60s CMD curl -fsSL -b /dev/shm/cookie http://localhost:9117 || exit 1

# install app
# https://github.com/Jackett/Jackett/releases
RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v0.11.542/Jackett.Binaries.${ARCH_JACKETT}.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
