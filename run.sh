#!/bin/bash
set -e

docker run -it --rm \
	--name redis-commander \
	--link redis_1:redis \
	osado/redis-commander "$@"