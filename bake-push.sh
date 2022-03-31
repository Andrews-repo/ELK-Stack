#!/bin/bash
AWS_ACCOUNT_ID=037399687915
REPO_NAME=elasticsearch
ES_VERSION=6.5.4
REGION=us-east-1
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com
docker build --build-arg ES_VERSION=$ES_VERSION -t $REPO_NAME:$ES_VERSION .
docker tag $REPO_NAME:$ES_VERSION $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:$ES_VERSION
docker push $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:$ES_VERSION