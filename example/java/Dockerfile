FROM wjojz/qb-hot:latest AS qb-hot

FROM openjdk:11

COPY --from=qb-hot /usr/bin/qb /usr/bin/

ENTRYPOINT ["/usr/bin/qb", "hot"]