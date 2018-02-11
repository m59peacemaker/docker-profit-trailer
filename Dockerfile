FROM alpine:3.7 as gh-deps

ARG 1.2.6.15

WORKDIR /tmp

RUN \
  PROJECT_URL="https://github.com/taniman/profit-trailer" && \
  ARTIFACT_URL="$PROJECT_URL/releases/download/v$PT_VERSION/ProfitTrailer.zip" && \
  wget -O ProfitTrailer.zip $ARTIFACT_URL && \
  unzip ProfitTrailer.zip && \
  (cd ProfitTrailer; rm pm2-ProfitTrailer.json Run-ProfitTrailer.cmd) && \
  mv ProfitTrailer /



FROM alpine:3.7

ENV PT_VERSION $PT_VERSION

COPY --from=gh-deps /ProfitTrailer /ProfitTrailer

COPY bin/pt /usr/local/bin/pt
COPY bin/startup /usr/local/bin/startup

RUN apk add --update --no-cache openjdk8

RUN mkdir -p /config /logs /data

RUN \
  addgroup -g 1000 pt && \
  adduser -D -s /bin/sh -G pt -u 1000 ptuser

RUN chown -R ptuser:pt /ProfitTrailer /config /logs /data

VOLUME /config
VOLUME /logs
VOLUME /data

EXPOSE 8081

USER ptuser
WORKDIR /config

CMD ["startup"]
