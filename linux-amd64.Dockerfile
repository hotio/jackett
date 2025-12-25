ARG UPSTREAM_IMAGE
ARG UPSTREAM_DIGEST_AMD64

FROM ${UPSTREAM_IMAGE}@${UPSTREAM_DIGEST_AMD64}
EXPOSE 9117
ARG IMAGE_STATS
ENV IMAGE_STATS=${IMAGE_STATS} WEBUI_PORTS="9117/tcp"

RUN apk add --no-cache icu-libs icu-data-full

ARG VERSION
RUN curl -fsSL "https://github.com/Jackett/Jackett/releases/download/v${VERSION}/Jackett.Binaries.LinuxMuslAMDx64.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
