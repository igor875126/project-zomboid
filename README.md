# Project Zomboid Server Setup

## Github
[https://github.com/igor875126/project-zomboid](https://github.com/igor875126/project-zomboid)

## Overview
Welcome to the `project-zomboid` repository, your simplified environment for setting up a Project Zomboid server utilizing Docker and Docker Compose. In just a few steps, get your Project Zomboid server operational and brace yourself for survival against the zombie apocalypse.

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- Git

## Quick Start
Execute the steps below to initialize your Project Zomboid server:

```shell
git clone https://github.com/igor875126/project-zomboid.git
cd project-zomboid
docker-compose up -d
```

Upon executing the commands:
- Steam and Project Zomboid server files will be downloaded automatically.
- The server will initialize using the default configuration.

## Configuration
Tailor your server configuration to enhance your gaming experience.

### Main Configuration File
Adjust server parameters via the main configuration file:
- Path: `./server-configs/Server/ZomboidDocker.ini`
> Note: `ZomboidDocker` is dependent on the SERVER_NAME environment variable in your docker-compose.yml.

- Parameters: Mods, server password, description, PVP options, etc.

### Initial Configuration
1. Launch the server and monitor the logs:
   ```shell
   docker-compose up -d && docker-compose logs -f
   ```
2. Wait for the server to download, start, and generate additional configurations and file structures.
3. Navigate to `./server-configs` and `./server-files` to modify any new files according to your server requirements.

## Firewall Configuration
Ensure that the necessary ports are open on your firewall to allow player access to your server. Check `docker-compose.yml` or the documentation to determine which ports need configuring.

## Server Administration
After starting the server with `docker-compose up -d`, connect to the rcon (Server Admin CLI) using:

```shell
docker-compose exec app rcon
```

## Additional Information
For more advanced server configurations, refer to the Project Zomboid and Docker documentation, which includes topics on:
- Managing mods
- Admin privileges
- Automated backups
- Debugging
- Updating server files

## Installing Mods: Example
- Once you’ve started your server with `docker-compose up -d`, shut it down using `docker-compose down` to allow the server to create necessary files like `${SERVERNAME}.ini`, e.g., `ZomboidDocker.ini` located at `./server-configs/Server/ZomboidDocker.ini`.
- Open `ZomboidDocker.ini` with an editor.
- Locate the line: `Mods=`. Insert mod names here, e.g., `Mods=modoptions;betterLockpicking;ProfessionFrameworkB41Patch;...`.
- Locate the line: `WorkshopItems=`. Insert mod ids here, e.g., `WorkshopItems=2169435993;2368058459;2216760107;...`.
> Ensure the order of the mod names and workshop items is maintained!

## How to reset the "world"
- Stop the server `docker-compose down` or `docker-compose exec app rcon` `quit`
- Navigate to `./server-configs/Saves/Multiplayer/`
- Delete folder `${SERVER_NAME}`, e.g. `ZomboidDocker`
- Start the server `docker-compose up -d`

## Support & Contribution
For support, please open an issue. If you’d like to contribute enhancements, we welcome pull requests to share with the community.

## Disclaimer
This project is neither affiliated with nor endorsed by The Indie Stone, the developers of Project Zomboid.

## License
Licensed under the MIT License. See the `LICENSE` file for full details.

---

**Enjoy your new Project Zomboid server and strive to survive as long as possible!** 🧟‍♂️ 🏡 🧟‍♀️