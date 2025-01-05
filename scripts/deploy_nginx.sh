#!/bin/sh -eu

base_path="$(cd "$(dirname "$0")/.."; pwd)"

echo "=== deploy ==="
cp -v "$base_path/nginx/nginx.b1pro.conf" "/etc/nginx/conf.d/"
nginx -t
echo "=== restart ==="
systemctl restart nginx
echo "=== done ==="
