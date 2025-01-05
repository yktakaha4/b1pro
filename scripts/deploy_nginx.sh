#!/bin/sh -eu

base_path="$(cd "$(dirname "$0")/.."; pwd)"

echo "=== deploy ==="
sudo cp -v "$base_path/nginx/nginx.b1pro.conf" "/etc/nginx/conf.d/"
sudo nginx -t
echo "=== restart ==="
sudo systemctl restart nginx
echo "=== done ==="
