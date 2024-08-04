#!/bin/bash
if [ $# -ne 1 ]
  then
    echo "Usage : " $(basename "$0") "<Compartment_Name" >&2
    echo "Lists the secrets in a given compartment" >&2
    echo "Compartment_Name is the compartment to list secrets from" >&2
    echo "Command docs https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.45.0/oci_cli_docs/cmdref/vault/secret/list.html" >&2
    exit 2
fi
COMPARTMENT_ID=`oci iam compartment list | jq --raw-output --arg CompartmentName $1 '.data[] | select(.name == $CompartmentName) | .id'`
echo Listing secrets from compartment ${1} with ID ${COMPARTMENT_ID} >&2
oci vault secret list --all --compartment-id ${COMPARTMENT_ID} | jq --raw-output '["Name", "VaultID"], (.data[] | [."secret-name", ."vault-id"]) | @tsv'
