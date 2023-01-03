pm_api_url = ""
pm_user = ""
pm_password = ""
pm_tls_insecure = true

hosts = ["host1", "host2", "host3"]
worker_hosts = ["host1", "host1", "host2", "host2", "host3", "host3"]

template_name = "jammy-templ"
storage_name = "local"
vm_name_prefix = "rke2-"
ssh_key = ""

vlan_id = 10
ip_first_three_octet = "192.168.0"
ip_dns = "192.168.0.1"
ip_gw = "192.168.0.1"
netmask = "/24"

infra_first_vmid = 100
infra_count = 3
infra_cpu_count = 2
infra_memory = 4096
infra_disk_size = "32G"
infra_ip_fourth_octet_start = "10"

master_first_vmid = 110
master_count = 3
master_cpu_count = 2
master_memory = 8192
master_disk_size = "48G"
master_ip_fourth_octet_start = "20"

worker_first_vmid = 120
worker_count = 6
worker_cpu_count = 4
worker_memory = 102400
worker_disk_size = "48G"
worker_ip_fourth_octet_start = "30"