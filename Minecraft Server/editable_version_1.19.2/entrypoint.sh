#!/bin/sh

cd /minecraft

# Clear directory
rm -rf $(pwd)/*

# Download minecraft serverfile
echo "Downloading minecraft server"

# 1.19.2
wget https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar
# Add eula
echo "Add EULA File"
echo "eula=true">eula.txt

# Add file auth
chmod +x /usr/bin/docker-entrypoint.sh

echo "Server starting"
echo "Maximum memory : ${maxmem}mb / Minimum memory : ${minmem}mb"

java -Xmx${maxmem}M -ms${minmem}M -jar server.jar nogui
