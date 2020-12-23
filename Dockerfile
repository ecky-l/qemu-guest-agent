FROM alpine:latest
RUN apk add qemu-guest-agent
VOLUME /dev/virtio-ports/org.qemu.guest_agent.0
ENTRYPOINT ["qemu-ga"]
