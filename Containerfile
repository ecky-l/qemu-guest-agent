FROM docker.io/library/fedora:36

RUN yum -y --setopt=tsflags=nodocs install qemu-guest-agent && \
    mkdir -p /etc/qemu /var/log/qemu-ga

COPY qemu-ga.conf /etc/qemu/

ENTRYPOINT ["qemu-ga"]
