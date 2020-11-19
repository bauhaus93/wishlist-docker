#!/bin/sh

FULL_REBUILD=0
CLEANUP=0
while getopts ":fc" option; do
	case "${option}" in
	f) FULL_REBUILD=1 ;;
	c) CLEANUP=1 ;;
	esac
done

if [ $FULL_REBUILD -eq 1 ]; then
	docker build -t wishlist_backend:build -f $PWD/backend/Dockerfile-build https://github.com/bauhaus93/wishlist-backend.git
fi

docker-compose --env-file $PWD/.env build

if [ $CLEANUP -eq 1 ]; then
	docker image prune -f --filter label=stage=wishlist-build
fi
