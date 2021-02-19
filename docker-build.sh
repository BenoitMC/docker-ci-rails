#!/bin/bash

set -e

final_tag=$(cat tag.txt)
tmp_tag="${final_tag}-tmp"
docker build --pull --no-cache -t $tmp_tag .
docker tag $tmp_tag $final_tag
docker rmi $tmp_tag
