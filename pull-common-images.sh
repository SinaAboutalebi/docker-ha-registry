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
    )

registry_url="registry.mastkhiar.xyz"

for image in "${images[@]}"; do
    full_image="$registry_url/$image"
    echo "[⚙️] Pulling $full_image ..."
    docker pull $full_image
    if [ $? -ne 0 ]; then
        echo "[❌] Failed to pull $full_image"
    else
        echo "[✅] Seccessfully pulled $full_image"
    fi
done