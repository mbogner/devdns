# DevDNS

this container wraps <https://github.com/robbiev/devdns>. This is a simple dns server written in go answering every request with 127.0.0.1.

You can run the container and map port 5300 to your local machine and then redirect your dns queries to this server.

## MacOS

To map all A requests to *.test to your local server simply create the file `/etc/resolver/test` where the filename equals the top level domain. Content of that file is

```
nameserver 127.0.0.1
port 5300
```

## docker compose

This repo also contains a simple compose file to run the server locally:

```yaml
version: "3.9"
services:
  devdns:
    image: mbopm/devdns:latest
    ports:
      - "127.0.0.1:5300:5300/udp"
```

With the `/etc/resolver/test` file and the container running you can then quer some example.test with the response 127.0.0.1.

```shell
~$ ping example.test
PING example.test (127.0.0.1): 56 data bytes
64 bytes from 127.0.0.1: icmp_seq=0 ttl=64 time=0.102 ms
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.254 ms
64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.245 ms
^C
--- example.test ping statistics ---
3 packets transmitted, 3 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 0.102/0.200/0.254/0.070 ms

~$ traceroute example.test
traceroute to example.test (127.0.0.1), 64 hops max, 52 byte packets
 1  localhost (127.0.0.1)  0.445 ms  0.052 ms  0.054 ms
```

So the system resolves all *.test to localhost.
