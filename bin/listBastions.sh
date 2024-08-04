#!/bin/bash
if [ $# -ne 1 ]
  then
    echo "Usage : " $(basename "$0") "<Compartment_Name>" >&2
    echo "Lists the bastions in a given compartment" >&2
    echo "Compartment_Name is the name of the compartment to list bastions from" >&2
    echo "Command docs https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.45.0/oci_cli_docs/cmdref/bastion/bastion/list.html" >&2
    exit 2
fi
COMPARTMENT_ID=`oci iam compartment list | jq --raw-output --arg CompartmentName $1 '.data[] | select(.name == $CompartmentName) | .id'`
echo Listing bastions from compartment ${1} with ID ${COMPARTMENT_ID} >&2
oci bastion bastion list --all --compartment-id ${COMPARTMENT_ID} | jq --raw-output '["Name", "BastionID"], (.data[] | [.name, .id]) | @tsv'
