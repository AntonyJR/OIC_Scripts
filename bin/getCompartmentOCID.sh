#!/bin/bash
if [ $# -ne 1 ]
  then
    echo "Expected compartment name" >&2
    echo "Usage : " $(basename "$0") "<Compartment_Name>" >&2
    echo "Seaches a tenancy for the given compartment name and returns it for use in other commands" >&2
    echo "Compartment_Name is the name of the compartment to search for" >&2
    echo "Command docs https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.37.1/oci_cli_docs/cmdref/iam/compartment/list.html" >&2
    exit 2
fi
oci iam compartment list --name $1 --compartment-id-in-subtree true --query 'data[0].id' | sed -e 's/^"//' -e 's/"$//'
