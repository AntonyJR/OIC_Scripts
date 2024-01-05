#!/bin/bash
if [ $# -ne 2 ]
  then
    echo "Usage : " $(basename "$0") "<Instance_OCID> <filename>" >&2
    echo "Configures an OIC instance with an access control list"
    echo "Instance_OCID is the OCID of the OIC instance to have the ACL added"
    echo "Filename is the list of ACLs to set on the OIC instance"
    echo "Filename should be fully qualified filename starting at /"
    echo "Note that the ACL replaces any existing ACL on the instance"
    echo "Command docs https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.37.1/oci_cli_docs/cmdref/integration/integration-instance/change-network-endpoint.html"
    exit 2
fi
oci integration integration-instance change-network-endpoint --id $1 --network-endpoint-details file://$2
