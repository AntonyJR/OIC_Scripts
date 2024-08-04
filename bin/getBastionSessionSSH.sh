#!/bin/bash
if [ $# -ne 1 ]
  then
    echo "Usage : " $(basename "$0") "<Bastion_Session_OCID>" >&2
    echo "Retrieves a bastion session SSH command from a bastion session OCID" >&2
    echo "Bastion_Session_OCID is the OCID of the Bastion Session" >&2
    echo "Command docs https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.45.0/oci_cli_docs/cmdref/bastion/session/get.html" >&2
    exit 2
fi
echo Get bastion session SSH command from bastion session ID $1 >&2
oci bastion session get --session-id $1 | jq --raw-output '.data."ssh-metadata".command'
