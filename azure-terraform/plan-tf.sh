#!/bin/bash
set -xe 

. ./common-tf.sh

terraform plan -out tfplan.tmp #> output.txt
