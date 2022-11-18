Docker : PHP - OCI 8
===
***
## Image information
- Base Image : Ubuntu
- What will be installed
    - PHP 8.0
    - PHP Basic Extensions
    - OCI8
    - Oracle Instant Client(Basic, SDK, ver. 19)
    - PHP Composer
    - Laravel
- Volume
    - /var/www/html
- Port
    - 22 : SSH 
    - 80 : PHP / Apache 2
- Default ssh passwd
    - Username : root
    - Password : ubuntu123
    ```bash
    ssh root@(IP or hostname) -p (SSH Port)
    ```
***
## Warning
- **Please consider your Docker host's CPU**
- **Supported CPU Architecture**
    - **[ARM](ARM) : Apple Sillicon, ARM Linux, ARM Windows**
    - **[x86, 64bit](x86) : 64bit x86 Architecture CPU**
***
## Run container
1. Build Container

```bash
docker build -t (image name) .
```

2. Run image

```bash
docker run -d --name (container name) -v (local volume directory):/var/www/html -p (local port):80 (image name)
```

3. Access URL

```text 
127.0.0.1:(local port)
```
