#!/bin/sh

cd /minecraft

# Clear directory
rm -rf $(pwd)/*

# Download minecraft serverfile
echo "Downloading minecraft server"

# 1.18
wget https://launcher.mojang.com/v1/objects/3cf24a8694aca6267883b17d934efacc5e44440d/server.jar
# Add eula
echo "Add EULA File"
echo "eula=true">eula.txt

# Add file auth
chmod +x /usr/bin/docker-entrypoint.sh

echo "Server starting"
echo "Maximum memory : ${maxmem}mb / Minimum memory : ${minmem}mb"

java -Xmx${maxmem}M -ms${minmem}M -jar server.jar nogui
