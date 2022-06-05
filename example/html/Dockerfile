FROM wjojz/qb-hot:latest AS qb-hot

FROM puppet/discocoreui

COPY --from=qb-hot /usr/bin/qb /usr/bin/

ENTRYPOINT ["/usr/bin/qb", "hot"]