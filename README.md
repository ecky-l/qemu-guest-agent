# Docker image for qemu-guest-agent

This docker image provides the qemu-guest-agent based on alpine.

# How to build

docker build -t ele/qemu-guest-agent:latest .

# How to use

This image will only be useful inside a [qemu](https://www.qemu.org/) virtual machine running containers. It provides
the [guest agent](https://wiki.libvirt.org/page/Qemu_guest_agent), which can, when it is running, communicate with the
virtual machine host for various operations. Using the guest agent it is for instance possible to determine the IPs of
the virtual machine or to shutdown/reboot it from the host system.

As these are privileged operations, the container must be run as root with the `--privileged` flag. Furthermore there is
a special socket file that must be mounted from the host, in order to enable the communication with the host.

Run it like this:
```
docker run \
        -d \
        --privileged \
        -v /dev/virtio-ports/org.qemu.guest_agent.0:/dev/virtio-ports/org.qemu.guest_agent.0 \
        eleh/qemu-guest-agent
```

# Notes

The image is particularly useful on container linux systems like Fedora CoreOS, Flatcar or Rancher, where the
primary objective is to run services only as containers, rather than direct binaries.

# License

Apache 2.0 license.

See the file LICENSE for full legal details