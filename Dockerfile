FROM ubuntu:16.04

RUN apt-get update -yq \
    && apt-get install -yq \
        xinetd \
        runc \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

COPY ./vuln /vuln
RUN mkdir -p /vulnsrv/test/rootfs \
    && tar -C /vulnsrv/test/rootfs -xf /vuln/box/test/rootfs.tar.gz

CMD ["/usr/sbin/xinetd", "-dontfork"]
