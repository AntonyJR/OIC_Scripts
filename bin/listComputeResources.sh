#!/bin/bash
if [ $# -ne 1 ]
  then
    echo "Usage : " $(basename "$0") "<Compartment_Name" >&2
    echo "Lists the compute instances in a given compartment" >&2
    echo "Compartment_Name is the compartment to list compute nodes from" >&2
    echo "Command docs https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.45.0/oci_cli_docs/cmdref/compute/instance/list.html" >&2
    exit 2
fi
COMPARTMENT_ID=`oci iam compartment list | jq --raw-output --arg CompartmentName $1 '.data[] | select(.name == $CompartmentName) | .id'`
echo Listing compute instance from compartment ${1} with ID ${COMPARTMENT_ID} >&2
oci compute instance list --all --compartment-id ${COMPARTMENT_ID} | jq --raw-output '["Name", "InstanceID"], (.data[] | [."display-name", .id]) | @tsv'
