#!/bin/sh -eu

code-insiders serve-web \
    --host "127.0.0.1" \
    --port "37000" \
    --server-base-path "/code-insiders/" \
    --without-connection-token \
    --accept-server-license-terms
