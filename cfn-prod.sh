#!/bin/bash

aws cloudformation package --template-file mipaquete.yaml --s3-bucket transadmin.co-cf-templates --output-template-file mipaquete-packaged.yaml
aws cloudformation deploy --template-file mipaquete-packaged.yaml --stack-name mipaquete-prod --capabilities CAPABILITY_NAMED_IAM --parameter-overrides ProjectName=mipaquete EnvType=prod Domain=mipaquete.transadmin.co