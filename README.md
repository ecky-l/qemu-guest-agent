# Container image for qemu-guest-agent

This container image provides the `qemu-guest-agent` on top of the official Fedora 36 base image.

## How to build

```bash
# Build the container
podman build -t ghcr.io/danmanners/qemu-guest-agent:fedora-36 .

# Authenticate to GitHub Container Registry
cat ~/.github/token | podman login ghcr.io --username danmanners --password-stdin

# Push image to ghcr.io
podman push ghcr.io/danmanners/qemu-guest-agent:fedora-36
```

## How to use

This image will only be useful inside a [qemu](https://www.qemu.org/) virtual machine running containers. It provides
the [guest agent](https://wiki.libvirt.org/page/Qemu_guest_agent), which can, when it is running, communicate with the
virtual machine host for various operations. Using the guest agent it is for instance possible to determine the IPs of
the virtual machine or to shutdown/reboot it from the host system.

As these are privileged operations, the container must be run as root with the `--privileged` flag. Furthermore there is
a special socket file that must be mounted from the host, in order to enable the communication with the host.

To run the container via Docker, you can use this command:

```bash
docker run \
        -d \
        --privileged \
        -v /dev/virtio-ports/org.qemu.guest_agent.0:/dev/virtio-ports/org.qemu.guest_agent.0 \
        ghcr.io/danmanners/qemu-guest-agent:fedora-36
```

If you want to deploy the `qemu-guest-agent` to your Kubernetes Cluster, you can run this command:

```bash
# Apply the Kustomization File to your Kubernetes Cluster
kubectl apply -k kubernetes
```

## Notes

- The image is particularly useful on container linux systems like Fedora CoreOS, Talos OS, Flatcar, or Rancher, where the primary objective is to run services only as containers, rather than direct binaries.
- The Kubernetes daemonset ignores `arm64` by default, as it is unlikely that someone will be running a QEMU `arm64` host.

## License

Apache 2.0 license.

See the file LICENSE for full legal details.
