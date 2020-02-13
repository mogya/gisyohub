![Docker Image CI](https://github.com/mogya/gisyohub/workflows/Docker%20Image%20CI/badge.svg)

# depends on

- direnv
- docker
- docker-compose

# start

```
$ mv .envrc.sample .envrc
$ direnv allow
$ docker-compose up -d
```

# development(rails)

```
$ docker exec -it gishohub_rails_1 bash
/rails$ ./bin/rails s -b 0.0.0.0
```

# docker containers

- rails: backend server
- nginx: frontend server. it works as proxy to rails server and serve frontend contents.
- front: nuxt.js container. 
  - in development environment, work as dev server.
  - in production environment, it generate static built content using 'nuxt generate'. The contents are served by nginx container.

