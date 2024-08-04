#!/bin/bash
if [ $# -ne 2 ]
  then
    echo "Usage : " $(basename "$0") "<Secret_Name> <Vault_OCID" >&2
    echo "Retrieves a vault secret by name from a given vault OCID" >&2
    echo "Secrwet_Name is the name of the secret to be retrieved" >&2
    echo "Vault_OICD is the vault of the OCID to retrieve the secret from" >&2
    echo "Command docs https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.45.0/oci_cli_docs/cmdref/secrets/secret-bundle/get.html" >&2
    exit 2
fi
echo Retrieving secret-name $1 from vault-id $2 >&2
oci secrets secret-bundle get-secret-bundle-by-name --secret-name $1 --vault-id $2 | jq --raw-output '.data."secret-bundle-content".content' | base64 --decode
