#!/bin/bash
if [ $# -ne 1 ]
  then
    echo "Usage : " $(basename "$0") "<Bastion_OCID" >&2
    echo "Lists the bastion Sessions for a given bastion OCID" >&2
    echo "Bastion_OICD is the bastion to list sessions from" >&2
    echo "Command docs https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.45.0/oci_cli_docs/cmdref/bastion/session/list.html" >&2
    exit 2
fi
echo Listing bastion sessions from bastion ID $1 >&2
oci bastion session list --all --bastion-id $1 | jq --raw-output '["Name", "State", "Target", "SessionID"], (.data[] | [."display-name", ."lifecycle-state", ."target-resource-details"."target-resource-display-name", .id]) | @tsv'
