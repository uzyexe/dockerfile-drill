FROM alpine:3.2

RUN apk add --update bash drill && \
    rm -rf /var/cache/apk/* glibc-2.21-r2.apk

ENTRYPOINT ["/usr/bin/drill"]

CMD ["-h"]
