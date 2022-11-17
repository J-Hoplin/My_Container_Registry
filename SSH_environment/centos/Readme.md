SSH Environment : Cent OS Base
===
***

## Image information
- Base : Cent OS:latest
- Volume
    - /root
- Port
    - 22 : For ssh
- Privileged : True (Require system D-Bus)
- SSH base account 
    - user : root
    - pw : centos123
***
## How in use?
1. Build container image

```bash
docker build -t (image name) .
```

2. Run container and execute essential shell script

```
docker run -d --privileged --name (container name) -v $(pwd)/(local mount directory):/home -p 9101:22 --restart=unless-stopped (image name) /sbin/init 
&& 
docker exec (container name) entrypoint.sh
```
***
