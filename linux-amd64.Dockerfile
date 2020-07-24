FROM hotio/base@sha256:20690b47bc26636539b1c55070546770502f3c7c8c39d3b9e6831e9154575999

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 9117
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true

ARG JACKETT_VERSION

RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VERSION}/Jackett.Binaries.LinuxAMDx64.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
