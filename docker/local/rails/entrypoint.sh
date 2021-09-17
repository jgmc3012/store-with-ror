#!/bin/sh

set -e

if [ -f tmp/pdis/server.pid ]; then
    rm tmp/pdis/server.pid
fi

bundle exec rails s -b 0.0.0.0