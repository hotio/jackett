FROM hotio/dotnetcore@sha256:9f7f622c28af08dfe406c12ca7b571c67062484ec8abc5546c506bc36a134877

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 9117

# https://github.com/Jackett/Jackett/releases
ARG JACKETT_VERSION

# install app
RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v${JACKETT_VERSION}/Jackett.Binaries.LinuxAMDx64.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
