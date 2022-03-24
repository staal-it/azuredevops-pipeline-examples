#!/bin/bash
set -xe

export TF_VAR_TENANT_ID="d0ef24f8-cf45-4295-b69a-87faf1de0871"
export TF_VAR_SUBSCRIPTION_ID="f0e483fc-9d2f-4a4b-8aee-887a398ff27e"
export TF_VAR_ENVIRONMENT_YML="./config/dev.yaml"

export TENANT_ID=$(az account show --query tenantId -o tsv)
export SUBSCRIPTION_ID=$(az account show --query id -o tsv)
export STATE_RESOURCEGROUP_NAME="terraform-dev-state"