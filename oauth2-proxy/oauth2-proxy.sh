#!/bin/sh -eu

base_dir="$(cd $(dirname $0); pwd)"

. "$base_dir/oauth2-proxy.env"

$OAUTH2_PROXY_PATH \
    --http-address="127.0.0.1:34180" \
    --upstream="http://127.0.0.1/" \
    --email-domain="*" \
    --provider="github" \
    --github-user="$GITHUB_USERS" \
    --redirect-url="https://b1pro/oauth2/callback" \
    --client-id="$CLIENT_ID" \
    --client-secret="$CLIENT_SECRET" \
    --cookie-secret="$COOKIE_SECRET" \
    --cookie-secure=true \
    --cookie-name="_oauth2_proxy_b1pro" \
    --proxy-websockets=true \
    --reverse-proxy=true
