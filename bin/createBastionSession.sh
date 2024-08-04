#!/bin/bash
if [ $# -ne 4 ]
  then
    echo "Usage : " $(basename "$0") "<Bastion_OCID> <SSH_Public_Key_File> <Username> <Target_OCID>" >&2
    echo "Create a managed SSH bastion session in the given bastion" >&2
    echo "Bastion_OCID is the OCID of the Bsstion instance" >&2
    echo "SSH_Public_Key_File is the file holding the SSH public key of the target instance" >&2
    echo "Username is the username used to authenticate to the compute isntance" >&2
    echo "Target_OCID is the OCID of the target Compute instance" >&2
    echo "Command docs https://docs.oracle.com/en-us/iaas/tools/oci-cli/3.45.0/oci_cli_docs/cmdref/bastion/session/create-managed-ssh.html" >&2
    exit 2
fi
echo Creating bastion sessions from bastion ID $1 using Public Key File $2 username $3 target OCID $4 >&2
oci bastion session create-managed-ssh --bastion-id $1 --ssh-public-key-file $2 --target-os-username $3 --target-resource-id $4
