# pmkr/profit-trailer

[![pmkr/profit-trailer on Docker Hub](https://img.shields.io/badge/Docker%20Hub-Hosted-blue.svg)](https://hub.docker.com/r/pmkr/profit-trailer/)

> [ProfitTrailer](https://github.com/taniman/profit-trailer) docker image.

Also check out [pmkr/profit-trailer-feeder](https://hub.docker.com/r/pmkr/profit-trailer-feeder).

## example

```sh
$ docker run -it       \
-p 8081:8081           \
-v $PWD/config:/config \
pmkr/profit-trailer
```

## volumes

### `/appdata/config`

Mount the config directory containing `application.properties`, `configuration.properties`, and `trading/` here.

### `/appdata/data`

Mount the directory containing ProfitTrailerData.json, ProfitTrailerData.json.backup, and `backup/` here.

### `/appdata/logs`

Mount the directory for Profit Trailer logs here.

## ports

### `8081`

The web server binds to port 8081.

## bin

### `startup` (default)

This symlinks your config, logs, and data into the appropriate Profit Trailer directories and then starts Profit Trailer.

### `pt`

Just starts Profit Trailer. You should usually use `startup` instead.
