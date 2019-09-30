#!/bin/bash
set -eux

rm -f /app/tmp/pids/server.pid

echo "Starting a ruby on rails container"
exec "$@"