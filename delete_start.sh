#! /bin/bash
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_SESSION_TOKEN=
export AWS_DEFAULT_REGION=us-east-1

STACK_NAME="TomcatPrueba"
REGION=us-east-1
CLI_PROFILE=default
aws cloudformation delete-stack \
    --region us-east-1 \
    --profile default \
    --stack-name "TomcatPrueba"