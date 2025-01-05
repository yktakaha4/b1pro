#!/bin/sh -eu

base_path="$(cd "$(dirname "$0")/.."; pwd)"

echo "=== deploy ==="
cp -rfv "$base_path/public/"* "/usr/share/nginx/html"
echo "=== done ==="
