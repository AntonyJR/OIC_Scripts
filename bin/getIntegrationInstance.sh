#!/bin/bash
if [ $# -ne 1 ]
  then
    echo "Expected instance OCID" >&2
    echo "Usage : " $(basename "$0") "<Instance_OCID>" >&2
    exit 2
fi
# oci integration integration-instance get --id $1 --query 'data[].{"name" : "display-name", "network" : "network-endpoint-details"}'
oci integration integration-instance get --id $1 --query 'data[].{"name" : "display-name", "network" : "network-endpoint-details"}'
