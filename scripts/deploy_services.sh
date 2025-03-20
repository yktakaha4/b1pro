#!/bin/sh -eu

base_path="$(cd "$(dirname "$0")/.."; pwd)"

for target in $(ls $base_path/services/*.service); do
    echo "=== deploy $target ==="
    cp -vf "$target" "/etc/systemd/system/"
    echo "=== restart $target ==="
    systemctl daemon-reload
    systemctl restart "$(basename $target .service)"
done

echo "=== done ==="
