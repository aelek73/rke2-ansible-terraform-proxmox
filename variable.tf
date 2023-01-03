variable pm_api_url {
    type = string
    description = "API endpoint of Proxmox"
}
variable pm_user {
    type = string
    description = "Username of the API user"
}
variable pm_password {
    type = string
    description = "Password of the API user"
}
variable pm_tls_insecure {
    type = bool
    description = "Skip TLS verify"
}

variable "hosts" {
    type = list(string)
    description = "List of Proxmox host(s)"
}

variable "worker_hosts" {
    type = list(string)
    description = "Sorted list of Proxmox host(s) for worker virtual machines"
}

variable template_name {
    type = string
    description = "Name of cloud-init template virtual machine"
}
variable storage_name {
    type = string
    description = "Name of storage, where the system disks will be created"
}
variable vm_name_prefix {
    type = string
    description = "Prefix for virtual machine names"
}

variable ssh_key {
    type = string
    description = "SSH public key"
}

variable vlan_id {
    type = number
    description = "Network VLAN ID"
}
variable ip_first_three_octet {
    type = string
    description = "First three IP octets of your network"
}
variable ip_dns {
    type = string
    description = "IP address of DNS server"
}
variable ip_gw {
    type = string
    description = "IP address of gateway"
}
variable netmask {
    type = string
    description = "Subnet mask of network"
}

variable infra_first_vmid {
    type = number
    description = "The first ID of infra virtual machine"
}
variable infra_count {
    type = number
    description = "Number of infra node"
}
variable infra_cpu_count {
    type = number
    description = "Number of vCPU for infra virtual machines"
}
variable infra_memory {
    type = number
    description = "Size of memory for infra virtual machines (in MB)"
}
variable infra_disk_size {
    type = string
    description = "Size of system disk for infra virtual machines (in GB)"
}
variable infra_ip_fourth_octet_start {
    type = string
    description = "The fourth octet of the IP address, which will be used for the first infra machine"
}

variable master_first_vmid {
    type = number
    description = "The first ID of master virtual machine"
}
variable master_count {
    type = number
    description = "Number of master nodes"
}
variable master_cpu_count {
    type = number
    description = "Number of vCPU for master virtual machines"
}
variable master_memory {
    type = number
    description = "Size of memory for master virtual machines (in MB)"
}
variable master_disk_size {
    type = string
    description = "Size of system disk for master virtual machines (in GB)"
}
variable master_ip_fourth_octet_start {
    type = string
    description = "The fourth octets of the IP address, which will be used for the first master machine"
}

variable worker_first_vmid {
    type = number
    description = "The first ID of worker virtual machine"
}
variable worker_count {
    type = number
    description = "Number of worker nodes"
}
variable worker_cpu_count {
    type = number
    description = "Number of vCPU for worker virtual machines"
}
variable worker_memory {
    type = number
    description = "Size of memory for worker virtual machines (in MB)"
}
variable worker_disk_size {
    type = string
    description = "Size of system disk for worker virtual machines (in GB)"
}
variable worker_ip_fourth_octet_start {
    type = string
    description = "The fourth octets of the IP address, which will be used for the first worker machine"
}