#!/bin/bash

images=(
    "nginx"
    "redis"
    "mysql"
    "mongo"
    "alpine"
    "node"
    "python"
    "postgres"
    "grafana/grafana"
    "prom/prometheus"
    "hashicorp/terraform"
    "jenkins/jenkins:lts"
    "busybox"
    "ubuntu"
    "golang"
    "openjdk"
    "ruby"
    "php"
    "microsoft/dotnet"
    "ruby"
    "maven"
    "gradle"
    "rust"
    "phpmyadmin"
    "elixir"
    "perl"
    "tensorflow/tensorflow"
    "pytorch/pytorch"
    "jupyter/base-notebook"
    "debian"
    "httpd"
    "rabbitmq"
    "traefik"
    "hello-world"
    "wordpress"
    "haproxy"
    "influxdb"
    "nextcloud"
    "memcached"
    )

registry_url="registry.mastkhiar.xyz"

for image in "${images[@]}"; do
    full_image="$registry_url/$image"
    echo "[⚙️] Pulling $full_image ..."
    docker pull $full_image
    docker rmi $full_image
    if [ $? -ne 0 ]; then
        echo "[❌] Failed to pull $full_image"
    else
        echo "[✅] Seccessfully pulled $full_image"
    fi
done