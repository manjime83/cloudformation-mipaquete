#!/bin/bash

cd ../../api-mi-paquete
docker build -t 948003242781.dkr.ecr.us-east-1.amazonaws.com/mipaquete-prod/api .
eval $(aws ecr get-login --no-include-email --region us-east-1 --registry-ids 948003242781 --profile mipaquete-prod)
docker push 948003242781.dkr.ecr.us-east-1.amazonaws.com/mipaquete-prod/api
aws ecs update-service --cluster mipaquete-prod-cluster --service mipaquete-prod-service --force-new-deployment --profile mipaquete-prod