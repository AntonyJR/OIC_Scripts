# OIC_Scripts
Handy scripts for Oracle Cloud Infrastructure Integration (OIC)

Scripts that use OCI CLI will require the CLI to be installed and configured. The easiest way to do this is to use the [OCI Cloud Shell](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/cloudshellintro.htm) which is already set up for you.

|Command|Notes|
|-------|-----|
|OIC Lifecycle||
|[configACL.sh](bin/configACL.sh)|Apply an access control list to an OIC instance, sample ACL config file is [network-endpoint-details.json](samples/network-endpoint-details.json)|
|[getCompartmentOCID.sh](bin/getCompartmentOCID.sh)|Get a compartment OCID by name for use in other commands|
|[listIntegrationInstances.sh](bin/listIntegrationInstances.sh)|List all OIC instances in a compartment in tabular form|
|[getIntegrationInstance.sh](bin/getIntegrationInstance.sh)|Get an OIC instance details in json format|
|[createIntegrationInstance.sh](bin/createIntegrationInstance.sh)|Create an OIC instance|
|Bastion Access||
|[createBastionSession.sh](bin/createBastionSession.sh)|Create a new SSH bastion session|
|[getBastionSessionSSH.sh](bin/getBastionSessionSSH.sh)|Retrieve SSH command for use with bastion|
|[getSecret.sh](bin/getSecret.sh)|Get secret from vault|
|[listBastionSessions.sh](bin/listBastionSessions.sh)|List sessions on given bastion|
|[listBastions.sh](bin/listBastions.sh)|List bastions in given compartment|
|[listComputeResources.sh](bin/listComputeResources.sh)|List sompute resources in given compartment|
|[listSecrets.sh](bin/listSecrets.sh)|List secrets in given compartment|

## How Tos
There are a number of how to documents available
* [How to Create an SSH Connection to a Compute Node](HowTo/ConnectToComputeNodeUsingBastion.md)
* [How to Create a Bastion Session](HowTo/CreateBastionSession.md)
* [How to List Bastion Sessions](HowTo/ListBastionSessions.md)
* [How to Get a Compute Node OCID](HowTo/GetComputeNodeOCID.md)
* [How to Retrieve Secrets from a Vault](HowTo/RetrieveSecretsFromVault.md)

