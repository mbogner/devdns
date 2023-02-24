FROM alpine
WORKDIR /root
RUN apk add --no-cache git go && \
    git clone https://github.com/robbiev/devdns.git && \
    cd /root/devdns && \
    go mod init mbo.dev/devdns && \
    go mod tidy && \
    go build -o /usr/local/bin/devdns


FROM alpine
COPY --from=0 /usr/local/bin/devdns /usr/local/bin/devdns
ENTRYPOINT ["/usr/local/bin/devdns"]
CMD ["-addr=0.0.0.0:5300"]
EXPOSE 5300
