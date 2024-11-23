#! /usr/bin/env bash

if [[ -z $1 ]]; then
  echo 'no image provided'
  exit 1
fi

if [[ -z $2 ]]; then
  echo 'no grep argument provided'
  exit 1
fi

docker create --name="tmp_$$" $1
docker export tmp_$$ | tar t | grep $2
docker rm tmp_$$
