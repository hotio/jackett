FROM hotio/base@sha256:df49443e2ae38469c6d15e4ba67e0dbaf38a7d3649516f56de44a5068c58c7e4

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 9117
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true

ARG JACKETT_VERSION

RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VERSION}/Jackett.Binaries.LinuxARM64.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
