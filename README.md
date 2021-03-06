[![](https://badge.imagelayers.io/uzyexe/drill:latest.svg)](https://imagelayers.io/?images=uzyexe/drill:latest 'Get your own badge on imagelayers.io')

# uzyexe/drill

This is drill container (7.074MB).

## What is drill

drill - get (debug) information out of DNS(SEC)

[https://nlnetlabs.nl/projects/drill/](https://nlnetlabs.nl/projects/drill/)

## Dockerfile

[**Trusted Build**](https://hub.docker.com/r/uzyexe/drill/)

This Docker image is based on the [alpine:3.4](https://hub.docker.com/_/alpine/) base image.

## How to use this image

```
docker run uzyexe/drill name [@server] [type] [class]
```

### Case 1: do a lookup

```
docker run -it --rm drill docker.io @8.8.8.8
```

### Case 2 : do a reverse lookup

```
docker run -it --rm drill -x 162.242.195.84 @8.8.8.8
```

### Help

```
  Usage: docker run uzyexe/drill name [@server] [type] [class]
        <name>  can be a domain name or an IP address (-x lookups)
        <type>  defaults to A
        <class> defaults to IN

        arguments may be placed in random order

  Options:
        -D              enable DNSSEC (DO bit)
        -T              trace from the root down to <name>
        -S              chase signature(s) from <name> to a know key [*]
        -I <address>    source address to query from
        -V <number>     verbosity (0-5)
        -Q              quiet mode (overrules -V)

        -f file         read packet from file and send it
        -i file         read packet from file and print it
        -w file         write answer packet to file
        -q file         write query packet to file
        -h              show this help
        -v              show version

  Query options:
        -4              stay on ip4
        -6              stay on ip6
        -a              fallback to EDNS0 and TCP if the answer is truncated
        -b <bufsize>    use <bufsize> as the buffer size (defaults to 512 b)
        -c <file>       use file for rescursive nameserver configuration
                        (/etc/resolv.conf)
        -k <file>       specify a file that contains a trusted DNSSEC key [**]
                        Used to verify any signatures in the current answer.
                        When DNSSEC enabled tracing (-TD) or signature
                        chasing (-S) and no key files are given, keys are read
                        from: /usr/etc/unbound/root.key
        -o <mnemonic>   set flags to:
                        [QR|qr][AA|aa][TC|tc][RD|rd][CD|cd][RA|ra][AD|ad]
                        lowercase: unset bit, uppercase: set bit
        -p <port>       use <port> as remote port number
        -s              show the DS RR for each key in a packet
        -u              send the query with udp (the default)
        -x              do a reverse lookup
        when doing a secure trace:
        -r <file>       use file as root servers hint file
        -t              send the query with tcp (connected)
        -d <domain>     use domain as the start point for the trace
        -y <name:key[:algo]>    specify named base64 tsig key, and optional an
                        algorithm (defaults to hmac-md5.sig-alg.reg.int)
        -z              don't randomize the nameservers before use

  [*] = enables/implies DNSSEC
  [**] = can be given more than once

  ldns-team@nlnetlabs.nl | http://www.nlnetlabs.nl/ldns/
```
