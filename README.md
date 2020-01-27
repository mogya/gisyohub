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


