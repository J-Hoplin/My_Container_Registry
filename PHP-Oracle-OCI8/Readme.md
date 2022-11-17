Docker : PHP - OCI 8
===
***
## Image information
- Base Image : Ubuntu
- What will be installed
    - PHP 8.0
    - PHP Basic Extensions
    - OCI8
    - Oracle Instant Client(Basic, SDK)
    - PHP Composer
    - Laravel
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
docker run -d -n (container name) -v (local volume directory):/var/www/html -p (local port):80 (image name)
```

3. Access URL

```text 
127.0.0.1:(local port)
```
