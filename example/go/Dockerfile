FROM wjojz/qb-hot:latest AS qb-hot

FROM golang:1.18

COPY --from=qb-hot /usr/bin/qb /usr/bin/

ENTRYPOINT ["/usr/bin/qb", "hot"]