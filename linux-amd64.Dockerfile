FROM cr.hotio.dev/hotio/base@sha256:f4c5147cc3659574c0e948884f93954f35029bef2ae53c03949896a981a78ba8

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 9117

# install packages
RUN apt update && \
    apt install -y --no-install-recommends --no-install-suggests \
        libicu66 && \
# clean up
    apt autoremove -y && \
    apt clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

ARG VERSION

RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v${VERSION}/Jackett.Binaries.LinuxAMDx64.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
RUN chmod -R +x /etc/cont-init.d/ /etc/services.d/
