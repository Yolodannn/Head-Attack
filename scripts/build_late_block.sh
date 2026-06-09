#!/bin/bash
export DOCKER_BUILDKIT=1
docker build -t geth:v1.13-base -f dockerfile/geth.Dockerfile .
docker build -t beacon:v7.1.4-experiment -f dockerfile/beacon.new.Dockerfile .
docker build -t validator:v7.1.4-experiment -f dockerfile/validator.new.Dockerfile .
