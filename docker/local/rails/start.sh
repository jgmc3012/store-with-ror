#!/bin/sh

set -e

if [ -f /app/tmp/pids/server.pid ]; then
    rm /app/tmp/pids/server.pid
fi

bundle exec rails s -b 0.0.0.0