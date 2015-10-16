#!/bin/bash
set -e

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

nodeVersion="$(awk '$1 == "FROM" { print $2; exit }' Dockerfile)"

redisCommanderVersion="$(docker run --rm "$nodeVersion" npm show redis-commander version)"

echo $redisCommanderVersion

sed -ri "s/^(ENV REDIS_COMMANDER) .*$/\1 $redisCommanderVersion/" Dockerfile