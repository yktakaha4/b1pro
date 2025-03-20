#!/bin/sh -eu

base_dir="$(cd $(dirname $0); pwd)"

. "$base_dir/openhands.env"

openhands_base_dir="$HOME/.openhands"
state_dir="$openhands_base_dir/.openhands-state"
workspace_dir="$openhands_base_dir/workspace"
mkdir -p "$state_dir" "$workspace_dir"

docker pull docker.all-hands.dev/all-hands-ai/runtime:0.29-nikolaik

docker run -it --rm --pull=always \
    -e SANDBOX_RUNTIME_CONTAINER_IMAGE=docker.all-hands.dev/all-hands-ai/runtime:0.29-nikolaik \
    -e LOG_ALL_EVENTS=true \
    -e "SANDBOX_USER_ID=$OPENHANDS_SANDBOX_USER_ID" \
    -e "WORKSPACE_MOUNT_PATH=$workspace_dir" \
    -v "$workspace_dir:/opt/workspace_base" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$state_dir:/.openhands-state" \
    --add-host host.docker.internal:host-gateway \
    --name openhands-app \
    docker.all-hands.dev/all-hands-ai/openhands:0.29
