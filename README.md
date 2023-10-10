# Project Zomboid Server Setup

## Overview

Welcome to the `project-zomboid` repository, a simplified environment to set up a Project Zomboid server using Docker and Docker Compose. With minimal steps, you'll have your Project Zomboid server up and running, ready for your survival against the zombie apocalypse.

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- Git

## Quick Start
Follow the steps below to get your Project Zomboid server started:

```shell
git clone https://github.com/igor875126/project-zomboid.git
cd project-zomboid
docker-compose up -d
```

After executing the above commands:
- Steam and Project Zomboid server files will be automatically downloaded.
- The server will start based on the default configuration.

## Configuration
Server configuration can be adjusted to tailor your gaming experience.

### Main Configuration File
Modify server parameters in the main configuration file.
- Path: `./server-configs/ZomboidDocker.ini`
- Parameters: Mods, server password, description, PVP options, and more.

### Initial Configuration
1. Run the server and observe the logs:
   ```shell
   docker-compose up -d && docker-compose logs -f
   ```
2. Wait for the server to download and start, which will generate additional configuration and file structures.
3. Navigate through `./server-configs` and `./server-files` to modify any new files as per your server needs.

## Firewall Configuration
To ensure players can access your server, verify that the necessary ports are open on your firewall. Check `docker-compose.yml` or the documentation to confirm which ports need to be configured.

## Additional Information
Refer to the Project Zomboid and Docker documentation for more advanced server configurations, including:
- Managing mods
- Admin privileges
- Automated backups
- Debugging
- Updating server files

## Support & Contribution
Feel free to open an issue for support, or submit pull requests for any enhancements you’d like to share with the community.

## Disclaimer
This project is not affiliated with or endorsed by The Indie Stone (the developers of Project Zomboid).

## License
MIT License. See `LICENSE` file for more details.

---

**Enjoy your new Project Zomboid server and try to survive as long as possible!** 🧟‍♂️ 🏡 🧟‍♀️