# DevDNS

this container wraps https://github.com/robbiev/devdns. This is a simple dns server written in go answering every request with 127.0.0.1.

You can run the container and map port 5300 to your local machine and then redirect your dns queries to this server.

## MacOS

To map all A requests to *.test to your local server simply create the file `/etc/resolver/test` where the filename equals the top level domain. Content of that file is

```
nameserver 127.0.0.1
port 5300
```
