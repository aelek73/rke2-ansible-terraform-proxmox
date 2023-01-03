#!/bin/bash
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img

virt-customize -a jammy-server-cloudimg-amd64.img --install qemu-guest-agent

qm create 900 --name jammy-templ --memory 2048 --net0 virtio,bridge=vmbr1
qm importdisk 900 jammy-server-cloudimg-amd64.img local -format qcow2
qm set 900 --scsihw virtio-scsi-pci --scsi0 /var/lib/vz/images/900/vm-900-disk-0.qcow2
qm set 900 --ide2 local:cloudinit --boot c --bootdisk scsi0 --serial0 socket --vga serial0
qm set 900 --ipconfig0 ip=dhcp
qm set 900 --sshkey ~/.ssh/id_rsa.pub
qm template 900