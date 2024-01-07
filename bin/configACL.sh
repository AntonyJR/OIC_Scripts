#!/bin/bash
if [ $# -ne 2 ]
  then
    echo "Usage : " $(basename "$0") "<Instance_OCID> <filename>" >&2
    echo "Configures an OIC instance with an access control list" >&2
    echo "Instance_OCID is the OCID of the OIC instance to have the ACL added" >&2
    echo "Filename is the list of ACLs to set on the OIC instance" >&2
    echo "Filename should be fully qualified filename starting at /" >&2
    echo "Sample file is samples/network-endpoint-details.json" >&2
    echo "Note that the ACL replaces any existing ACL on the instance" >&2
    echo "Command docs https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.37.1/oci_cli_docs/cmdref/integration/integration-instance/change-network-endpoint.html" >&2
    exit 2
fi
oci integration integration-instance change-network-endpoint --id $1 --network-endpoint-details file://$2
