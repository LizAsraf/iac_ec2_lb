#!/bin/bash
git clone git@github.com:LizAsraf/nodejs_application_hello_world.git
cd nodejs_application_hello_world
sed -i '6 s/app_node:latest/118341628787.dkr.ecr.us-east-1.amazonaws.com/nodejs_hello_world:v1.0.0/' docker-compose.yml
docker compose up