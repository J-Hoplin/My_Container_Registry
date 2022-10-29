## Minecraft Server Docker files
***
### Image Information

- Base Image : [official openjdk docker image](https://hub.docker.com/_/openjdk)

- Opened Volume

    - /minecraft 
        - For minecraft world server files mount

- Opened Port

    - 25565
    - 25575

- Environment Variable 

    - maxmem
        - Maximum memory of minecraft server, unit : MB (ex_ if 4GB -> 4096)
    - minmem
        -Minimum memory of minecraft server should be at least 1GB, unit : MB(ex_ if 1GB -> 1024)

- Supporting Minecraft Versions : Version will update through after versions

    - 1.18
    - 1.19.2

***
### Build Image

```bash
# move to version file
cd "version (version)"

docker build -t (image name) .
```

### Run Container

```bash
# If you want to run container as daemon use option -itd instead of -it
# It require at least 3min for server to be open
docker run -it --name (container name)
-v (local location you want to mount):/minecraft 
-e maxmem=(maximum memory you want to config, unit : MB)
-e minmem=(minimum memory you want to config, unit : MB)
-p (local port):25565 
-p (local port):25575 (image name) bash
```