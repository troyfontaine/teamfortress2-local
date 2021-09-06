#!/usr/bin/env bash

# Rename the server in the config file
sed -i -e 's/{{SERVER_HOSTNAME}}/'"${SRCDS_HOSTNAME}"'/g' "${STEAM_APP_CFG_DIR}/server.cfg"

bash "${STEAM_APP_DIR}/srcds_run" -game "${STEAM_APP_CFG_NAME}" -console -autoupdate \
    -steam_dir "${STEAM_CMD_DIR}" \
    -steamcmd_script "${HOMEDIR}/${STEAM_APP_CFG_NAME}_update.txt" \
    -usercon \
    +fps_max "${SRCDS_FPSMAX}" \
    -tickrate "${SRCDS_TICKRATE}" \
    -port "${SRCDS_PORT}" \
    +tv_port "${SRCDS_TV_PORT}" \
    +clientport "${SRCDS_CLIENT_PORT}" \
    +maxplayers "${SRCDS_MAXPLAYERS}" \
    +map "${SRCDS_STARTMAP}" \
    +sv_setsteamaccount "${SRCDS_TOKEN}" \
    +rcon_password "${SRCDS_RCONPW}" \
    +sv_password "${SRCDS_PW}" \
    +sv_region "${SRCDS_REGION}" \
    -ip "${SRCDS_IP}" \
    -authkey "${SRCDS_WORKSHOP_AUTHKEY}"
