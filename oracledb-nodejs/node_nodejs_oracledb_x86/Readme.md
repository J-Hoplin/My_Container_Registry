Docker : Node.js + oracledb(npm) environment
===
***
## Image information
- Base Image : node:hydrogen-buster
- Node.js version : v 18
- Instant client version : v 19.10
***
## Warning
- **This Docker image only available in x86-64**
- **You can't use this image in ARM CPU(Apple Silicon included)**
***
## Container resource

- Volume 
    - /api : node.js project  will located
- Port
    - 3000 : For Swagger UI
    - 4000 : For Node.js web server
***
## Reference 
- https://node-oracledb.readthedocs.io/en/latest/index.html
***
1. Build Container

```bash
docker build -t (image name) .
```

2. Run image

```bash
docker run -it --name (container name) -p (local port):4000 -v (directory):/api (image name)
```

***
## Basic container run

```Docker
CMD [ "node","app.js" ]
```