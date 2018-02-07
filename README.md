# pmkr/profit-trailer

[![pmkr/profit-trailer on Docker Hub](https://img.shields.io/badge/Docker%20Hub-Hosted-blue.svg)](https://hub.docker.com/r/pmkr/profit-trailer/)

[ProfitTrailer](https://github.com/taniman/profit-trailer) docker image.

Also check out [pmkr/profit-trailer-feeder](https://hub.docker.com/r/pmkr/profit-trailer-feeder).

## example

```sh
$ docker run -it       \
-p 8081:8081           \
-v $PWD/config:/config \
pmkr/profit-trailer
```

## volumes

### /config

Mount the config directory containing `application.properties`, `configuration.properties`, and `trading` here.

## ports

### 8081

The web server binds to port 8081.

## bin

### `pt`

starts Profit Trailer
