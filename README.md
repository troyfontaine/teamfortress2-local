# Teamfortress 2 LAN Server

Docker Container Build of Valve's Team Fortress 2 intended for LAN play.  Customized to run as a LAN server via [server.cfg][servercfg] by modifying the value of `sv_lan` to `1`.

To launch a dedicated LAN server, do the following:

1. Modify the `custom/common.env` file with your own SRCDS_TOKEN, the hostname you want to use for your server and your server admin password
2. Modify the `custom/motd_default.txt` with your preferred changes
3. Launch the whole kit and caboodle using [Docker Compose][docker_compose] by running `docker-compose up -d`

[servercfg]: ./server.cfg
[docker_compose]: https://docs.docker.com/compose/
