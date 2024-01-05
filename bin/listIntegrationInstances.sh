#!/bin/bash
if [ $# -ne 1 ]
  then
    echo "Expected compartment OCID" >&2
    echo "Usage : " $(basename "$0") "<Compartment_OCID>" >&2
    echo "Retrieves a list of OIC instances with their name and OCID from a given compartment" >&2
    echo "Compartment_OCID is the compartment from which to list instances"
    echo "Command docs https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.37.1/oci_cli_docs/cmdref/integration/integration-instance/list.html"
    exit 2
fi
# oci integration integration-instance list --compartment-id $1 --query 'data[].{"name" : "display-name", "network" : "network-endpoint-details"}'
# oci integration integration-instance list --compartment-id $1
oci integration integration-instance list --compartment-id $1 --query 'data[].{"Name" : "display-name", "ID": "id", "State": "lifecycle-state", "Edition": "integration-instance-type", "Shape": "shape", "MP": "message-packs", "BYOL": "is-byol"}' --output table
