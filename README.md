# OIC_Scripts
Handy scripts for Oracle Cloud Infrastructure Integration (OIC)

Scripts that use OCI CLI will require the CLI to be installed and configured. The easiest way to do this is to use the [OCI Cloud Shell](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/cloudshellintro.htm) which is already set up for you.

|Command|Notes|
|-------|-----|
|[configACL.sh](bin/configACL.sh)|Apply an access control list to an OIC instance, sample ACL config file is [network-endpoint-details.json](samples/network-endpoint-details.json)|
|[getCompartmentOCID.sh](bin/getCompartmentOCID.sh)|Get a compartment OCID by name for use in other commands|
|[listIntegrationInstances.sh](bin/listIntegrationInstances.sh)|List all OIC instances in a compartment in tabular form|
|[getIntegrationInstance.sh](bin/getIntegrationInstance.sh)|Get an OIC instance details in json format|
