#!/bin/sh -eu

base_dir="$(cd $(dirname $0); pwd)"

(
  cd "$base_dir"
  docker compose down
  docker compose up
)
