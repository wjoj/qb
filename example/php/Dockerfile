FROM wjojz/qb-hot:latest AS qb-hot

FROM php:7.4-cli

COPY --from=qb-hot /usr/bin/qb /usr/bin/

ENTRYPOINT ["/usr/bin/qb", "hot"]