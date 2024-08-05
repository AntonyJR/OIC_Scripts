# Create a Bastion Session
To access a compute instance on a private network we can use a bastion host. This requires us to create a session on the bastion host.

The following information is required:
* Bastion OCID
  * See [List bastions in a Compartment](#list-bastions-in-a-compartment)
* SSH Public Key File
  * See [How to Retrieve Secrets from a Vault](./RetrieveSecretsFromVault.md)
* Username
*   * For OCI Copute default username is opc.
* Target Compute OCID
  * See [How to Get the OCID of a Compute Node](./GetComputeNodeOCID.md)
## List bastions in a Compartment
List all the bastions in a given compartment.
````
listBastions.sh OICPM-UserAssistance
````
> Listing bastions from compartment OICPM-UserAssistance with ID ocid1.compartment.oc1..aaaaaaaacompartment<br/>
> Name    BastionID<br/>
> UABastion       ocid1.bastion.oc1.phx.amaaaaaaBastion

## Create a Bastion Session
Create an SSH Bastion session.
````
./createBastionSession.sh ocid1.bastion.oc1.phx.amaaaaaaBastion ~/Keys/MyPublicKey.pub opc ocid1.instance.oc1.phx.anyhqcomputenode
````
> ```text
> Creating bastion sessions from bastion ID ocid1.bastion.oc1.phx.amaaaaaaBastion using Public Key File /home/username/Keys/MyPublicKey.pub username opc target OCID ocid1.instance.oc1.phx.anyhqcomputenode
> {
>   "data": {
>     "bastion-id": "ocid1.bastion.oc1.phx.amaaaaaaBastion",
>     "bastion-name": "UABastion",
>     "bastion-public-host-key-info": null,
>     "bastion-user-name": null,
>     "display-name": "bastionsession2024-08-05-1814",
>     "id": "ocid1.bastionsession.oc1.phx.amaaaaaaSession",
>     "key-details": {
>       "public-key-content": "ssh-rsa PublicKeyValue ssh-key-2024-07-31%"
>     },
>     "key-type": "PUB",
>     "lifecycle-details": null,
>     "lifecycle-state": "CREATING",
>     "session-ttl-in-seconds": 1800,
>     "ssh-metadata": null,
>     "target-resource-details": {
>       "session-type": "MANAGED_SSH",
>       "target-resource-display-name": "Linux-UA",
>       "target-resource-id": "ocid1.instance.oc1.phx.anyhqcomputenode",
>       "target-resource-operating-system-user-name": "opc",
>       "target-resource-port": 22,
>       "target-resource-private-ip-address": "10.7.128.212"
>     },
>     "time-created": "2024-08-05T00:25:50.192000+00:00",
>     "time-updated": "2024-08-05T00:25:50.192000+00:00"
>   },
>   "opc-work-request-id": "ocid1.bastionworkrequest.oc1.phx.amaaaaaarequest"
> }
> ```

Note that the session may take a few seconds to be created hence we will want to verify it has been created by listing bastion sessions.
