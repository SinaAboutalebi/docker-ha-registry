# Distributed Docker Registry with Load Balancers 🐳

This project sets up a highly available, redundant Docker registry across multiple Popsites using Ansible. Each Popsite has a load balancer acting as a reverse proxy for the registry hosted within the site and also forwards traffic to other sites for redundancy.

### 🐳 Accessing the Registry
to pull an image:
  ```BASH
  docker pull registry.RegistryHub.ir/nginx:latest
  ```

## 🚀 Installation and Usage

### ✅ Prerequisites
- Ansible installed on the control machine.
- Access to the target machines via SSH.
- Docker installed on the target machines.

### 📋 Setup Instructions

1. Clone the repository:
    ```BASH
    git clone --depth 1 https://github.com/SinaAboutalebi/docker-ha-registry
    cd docker-ha-registry/ansible
    ```
    
2. Configure the inventory:
   
   Edit the `inventory/hosts.ini` file to include the details of your target machines.
   
4. Run the playbooks:
   To deploy the Docker registry and load balancers, run:
    ```BASH
    ansible-playbook playbooks/deploy.yml -i inventory/hosts.ini
    ```
### 📜 Playbook Details
The `deploy.yml` playbook is the main playbook used to run this project. Here is a breakdown of the playbook and its variables:
```YAML
- hosts: nodes
  become: true
  vars:
    registry_network_name: registry-network
    registry_subnet: 172.23.8.0/24
    registry_gateway: 172.23.8.1
    registry_iprange: 172.23.8.0/24
    registry_container_name: registry
    registry_image: registry:2
    registry_config_src: config.yml
    registry_config_dest: /opt/volumes/registry/config/config.yml
    registry_data_dest: /opt/volumes/registry/data/
    local_registry_ip: 172.23.8.2
    nginx_container_name: nginx
    nginx_image: nginx:latest
    nginx_config_src: nginxsinglenode.conf.j2
    nginx_config_dest: /opt/volumes/loadbalancer/config/nginx.conf
    nginx_http_host_port: 80
    nginx_http_container_port: 80
    nginx_https_host_port: 443
    nginx_https_container_port: 443
    domain: registryhub.ir

  roles:
    - common
    - registry
    - loadbalancer
```

### ⚙️ Configuration Details
- **Load Balancer Configuration:**

    The Nginx configuration for the load balancers is defined in the `roles/loadbalancer/templates/nginx.conf.j2` template file. This template is used to generate the actual configuration file on each load balancer.


- **Docker Registry Configuration:**

    The Docker registry configuration is specified in the `roles/regisry/files/config.yml` file, which includes settings such as storage backend, authentication, and more.

## 🔧 Usage
### 🐳 Accessing the Registry
Use the global load balancer's address to interact with the Docker registry. For example, to pull an image:
  ```BASH
  docker pull <global_load_balancer_address>/my-image:tag
  ```

## 🤝 Contributing
Contributions are welcome! Please fork the repository and submit a pull request for any enhancements, bug fixes, or new features.
