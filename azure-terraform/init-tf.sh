#!/bin/bash
set -xe

. ./common-tf.sh 1

export storage_account_name=estfdemostatedev

terraform init \
  -backend-config=storage_account_name=$storage_account_name \
  -backend-config=container_name=terraform-state \
  -backend-config=key=terraform.tfstate \
  -backend-config=resource_group_name=$STATE_RESOURCEGROUP_NAME \
  -backend-config=tenant_id=$TENANT_ID \
  -backend-config=subscription_id=$SUBSCRIPTION_ID \

echo $ENVIRONMENT > .last-env
wait
