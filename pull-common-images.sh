#!/bin/bash

default_images=(
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

registry_url="registry.registryhub.ir"

if [ "$#" -gt 0 ]; then
    images=("$@")
     echo "[🚀] Pulling custom images"
else
    images=("${default_images[@]}")
    echo "[📥] Pulling default images"
fi

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