FROM alpine:latest
RUN apk add qemu-guest-agent && \
    mkdir -p /etc/qemu
COPY qemu-ga.conf /etc/qemu/
VOLUME /dev/virtio-ports/org.qemu.guest_agent.0
ENTRYPOINT ["qemu-ga"]
