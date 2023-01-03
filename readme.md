## Deploy RKE2 cluster with Terraform and Ansible in Proxmox

1. Copy the `create-ci-template.sh` and run it on the Proxmox host
2. Clone the created template to other Proxmox hosts
3. Create Proxmox API credentials for the admin user
4. Fill `terraform.tfvars` variables
5. Create virtual machines
```
terraform init
terraform apply
```
6. Fill or edit IP addresses on the inventory file and edit the `env_vars.yaml` file
7. Deploy the first RKE2 server
```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <user> -i inventory_file ./rke2-install-first-server.yaml -l rke2-master-0
```
8. Create the token file with the printed node-token content
```
TOKEN: <your node-token file content>
```
9. Deploy the remaining RKE2 servers
##### Note: Install only 1 machine at a time to prevent the join problems
```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <user> -i inventory_file ./rke2-install-server.yaml -l rke2-master-1
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <user> -i inventory_file ./rke2-install-server.yaml -l rke2-master-2
```
10. Deploy the RKE2 agents
```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <user> -i inventory_file ./rke2-install-agent.yaml -l rke2-infra-0
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <user> -i inventory_file ./rke2-install-agent.yaml -l rke2-infra-1
...
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <user> -i inventory_file ./rke2-install-agent.yaml -l rke2-worker-0
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <user> -i inventory_file ./rke2-install-agent.yaml -l rke2-worker-1
```
11. Change server endpoint in kubeconfig file
12. Export the kubeconfig file and enjoy the newly created cluster
```
export KUBECONFIG=kubeconfig
kubectl get node
```

## Upgrade RKE2 cluster
1. Change the destination version in `env_vars_upgrade.yaml`
2. Upgrade RKE2 servers
```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <user> -i inventory_file ./rke2-upgrade-server.yaml -l rke2-master-0
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <user> -i inventory_file ./rke2-upgrade-server.yaml -l rke2-master-1
```
3. Upgrade RKE2 agents
```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <user> -i inventory_file ./rke2-upgrade-agent.yaml -l rke2-infra-0
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <user> -i inventory_file ./rke2-upgrade-agent.yaml -l rke2-infra-1
...
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <user> -i inventory_file ./rke2-upgrade-agent.yaml -l rke2-worker-0
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u <user> -i inventory_file ./rke2-upgrade-agent.yaml -l rke2-worker-1
```