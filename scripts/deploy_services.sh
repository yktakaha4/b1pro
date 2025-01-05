#!/bin/sh -eu

base_path="$(cd "$(dirname "$0")/.."; pwd)"

targets="app-py code-server mailpit oauth2-proxy"

for target in $targets; do
    echo "=== deploy $target ==="
    sudo cp -vf "$base_path/services/$target.service" "/etc/systemd/system/"
    echo "=== restart $target ==="
    sudo systemctl daemon-reload
    sudo systemctl restart "$target"
done

echo "=== done ==="
