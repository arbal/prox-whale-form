# List of terraform tags
# https://hub.docker.com/r/hashicorp/terraform/tags
FROM golang:alpine3.12

RUN apk update && \
    apk add --no-cache \
        git \
        terraform

# Now the actual instllation of proxmox terraform provider
# docs here:
# https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/index.md
RUN go get -v github.com/Telmate/terraform-provider-proxmox/cmd/terraform-provider-proxmox \
    go get -v github.com/Telmate/terraform-provider-proxmox/cmd/terraform-provisioner-proxmox \
    go install -v github.com/Telmate/terraform-provider-proxmox/cmd/terraform-provider-proxmox \
    go install -v github.com/Telmate/terraform-provider-proxmox/cmd/terraform-provisioner-proxmox