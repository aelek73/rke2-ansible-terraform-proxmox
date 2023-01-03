terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.7.4"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.pm_api_url
  pm_user = var.pm_user
  pm_password = var.pm_password
  pm_tls_insecure = var.pm_tls_insecure
}

resource "proxmox_vm_qemu" "infra" {
  vmid = var.infra_first_vmid + count.index
  count = var.infra_count
  name = "${var.vm_name_prefix}infra-${count.index}"
  target_node = element(var.hosts, count.index)

  clone = var.template_name

  agent = 1
  os_type = "cloud-init"
  cores = var.infra_cpu_count
  sockets = 1
  cpu = "host"
  memory = var.infra_memory
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = var.infra_disk_size
    type = "scsi"
    storage = var.storage_name
  }
  
  network {
    model = "virtio"
    bridge = "vmbr0"
    tag = var.vlan_id
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = "ip=${var.ip_first_three_octet}.${var.infra_ip_fourth_octet_start + count.index}${var.netmask},gw=${var.ip_gw}"
  nameserver = var.ip_dns
  sshkeys = var.ssh_key
}

resource "proxmox_vm_qemu" "master" {
  vmid = var.master_first_vmid + count.index
  count = var.master_count
  name = "${var.vm_name_prefix}master-${count.index}"
  target_node = element(var.hosts, count.index)

  clone = var.template_name

  agent = 1
  os_type = "cloud-init"
  cores = var.master_cpu_count
  sockets = 1
  cpu = "host"
  memory = var.master_memory
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = var.master_disk_size
    type = "scsi"
    storage = var.storage_name
  }
  
  network {
    model = "virtio"
    bridge = "vmbr0"
    tag = var.vlan_id
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  
  ipconfig0 = "ip=${var.ip_first_three_octet}.${var.master_ip_fourth_octet_start + count.index}/24,gw=${var.ip_gw}"
  nameserver = var.ip_dns
  sshkeys = var.ssh_key
}

resource "proxmox_vm_qemu" "worker" {
  vmid = var.worker_first_vmid + count.index
  count = var.worker_count
  name = "${var.vm_name_prefix}worker-${count.index}"
  target_node = element(var.worker_hosts, count.index)

  clone = var.template_name

  agent = 1
  os_type = "cloud-init"
  cores = var.worker_cpu_count
  sockets = 1
  cpu = "host"
  memory = var.worker_memory
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = 0
    size = var.worker_disk_size
    type = "scsi"
    storage = var.storage_name
  }
  
  network {
    model = "virtio"
    bridge = "vmbr0"
    tag = var.vlan_id
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  
  ipconfig0 = "ip=${var.ip_first_three_octet}.${var.worker_ip_fourth_octet_start + count.index}/24,gw=${var.ip_gw}"
  nameserver = var.ip_dns
  sshkeys = var.ssh_key
}