FROM hotio/dotnetcore

ARG DEBIAN_FRONTEND="noninteractive"
ARG ARCH_JACKETT
ARG GIT_COMMIT
ARG GIT_TAG
ARG ARCH

ENV GIT_COMMIT="${GIT_COMMIT}" GIT_TAG="${GIT_TAG}" ARCH="${ARCH}"
ENV APP="Jackett"
ENV ARCH_JACKETT="${ARCH_JACKETT}"
EXPOSE 9117
HEALTHCHECK --interval=60s CMD curl -fsSL -b /dev/shm/cookie http://localhost:9117 || exit 1

# install app
# https://github.com/Jackett/Jackett/releases
RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v0.11.675/Jackett.Binaries.${ARCH_JACKETT}.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
