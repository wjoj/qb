FROM alpine

COPY ./qb /usr/bin/

ENTRYPOINT ["/usr/bin/qb", "hot"]