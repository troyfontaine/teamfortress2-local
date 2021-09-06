# Base image that runs as the user steam
FROM cm2network/steamcmd:latest

LABEL maintainer "tfontaine@troyfontaine.com"

# We have to split this out as for some unknown
# reason, STEAM_APP doesn't resolve unless passed in separately
ENV HOMEDIR="/home/steam"

ARG STEAM_APP="tf2" \
    STEAM_APP_ID="232250"

ENV STEAM_APP_CFG_NAME="tf" \
    STEAM_CMD_DIR="${HOMEDIR}/steamcmd" \
    STEAM_APP_DIR="${HOMEDIR}/${STEAM_APP}-dedicated"

ENV STEAM_APP_CFG_DIR="${STEAM_APP_DIR}/${STEAM_APP_CFG_NAME}/cfg" \
    SRCDS_FPSMAX="300" \
    SRCDS_TICKRATE="66" \
    SRCDS_PORT="27015" \
    SRCDS_TV_PORT="27020" \
    SRCDS_NET_PUBLIC_ADDRESS="0" \
    SRCDS_IP="0" \
    SRCDS_MAXPLAYERS="16" \
    SRCDS_TOKEN="0" \
    SRCDS_RCONPW="changeme" \
    SRCDS_PW="changeme" \
    SRCDS_STARTMAP="ctf_2fort" \
    SRCDS_REGION="3" \
    SRCDS_HOSTNAME="DyLAN \"${STEAM_APP}\" Server" \
    SRCDS_WORKSHOP_START_MAP="0" \
    SRCDS_HOST_WORKSHOP_COLLECTION="0" \
    SRCDS_WORKSHOP_AUTHKEY=""

RUN mkdir -p "${STEAM_APP_DIR}" \
    && ./steamcmd.sh +login anonymous +force_install_dir \
    "${STEAM_APP_DIR}" +app_update "${STEAM_APP_ID}" +quit

COPY --chown=steam:steam --chmod=755 config/* "${STEAM_APP_CFG_DIR}/"

COPY --chown=steam:steam tf_update.txt "${HOMEDIR}/"

COPY --chown=steam:steam --chmod=700 docker-entry.sh "${HOMEDIR}/"

WORKDIR "${HOMEDIR}"

EXPOSE 27015/tcp 27015/udp 27020/udp

CMD ["bash", "docker-entry.sh"]
