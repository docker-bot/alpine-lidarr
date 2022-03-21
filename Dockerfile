#FROM ghcr.io/agpsn/alpine-base:latest
FROM test/base:latest

ARG LBRANCH="master"
ARG LVERSION

#        echo "***** install runtime packages *****" && apk add --no-cache libmediainfo xmlstarlet icu-libs sqlite mediainfo chromaprint && \
RUN set -xe && \
        echo "***** update system packages *****" apk update && apk upgrade --no-cache && \
        echo "***** install build packages *****" && apk add --no-cache --virtual=build-dependencies curl jq && \
        echo "***** install runtime packages *****" && apk add --no-cache icu-libs sqlite-libs chromaprint && \
        echo "***** install lidarr *****" && if [ -z ${LVERSION+x} ]; then LVERSION=$(curl -sL "https://lidarr.servarr.com/v1/update/${LBRANCH}/changes?os=linuxmusl" | jq -r '.[0].version'); fi && mkdir -p "${APP_DIR}"/lidarr/bin && curl -o /tmp/lidarr.tar.gz -L "https://lidarr.servarr.com/v1/update/${LBRANCH}/updatefile?version=${LVERSION}&os=linuxmusl&runtime=netcore&arch=x64" && tar xzf /tmp/lidarr.tar.gz -C "${APP_DIR}"/lidarr/bin --strip-components=1 && printf "UpdateMethod=docker\nBranch=${LBRANCH}\nPackageVersion=${LVERSION}\nPackageAuthor=[agpsn]\n" >"${APP_DIR}"/lidarr/package_info && \
        echo "***** cleanup lidarr *****" && find "${APP_DIR}"/lidarr/bin -name '*.mdb' -delete && rm -rf "${APP_DIR}"/lidarr/bin/Lidarr.Update && \
        echo "***** cleanup *****" && apk del --purge build-dependencies && rm -rf /tmp/*

# add local files
COPY root/ /

# healthcheck
#HEALTHCHECK --start-period=10s --timeout=5s CMD wget -qO /dev/null 'http://localhost:8686/api/v1/system/status' --header "x-api-key: $(xmlstarlet sel -t -v '/Config/ApiKey' "${CONFIG_DIR}"/config.xml)"
#HEALTHCHECK --start-period=10s --timeout=5s CMD wget -qO /dev/null 'http://localhost:8686/api/v1/system/status' --header "x-api-key: $(xmlstarlet sel -t -v '/Config/ApiKey' "${CONFIG_DIR}"/config.xml)"

# ports and volumes
EXPOSE 8686
VOLUME "${CONFIG_DIR}"
