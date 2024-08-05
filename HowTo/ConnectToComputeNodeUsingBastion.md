# Connect to a Compute Node Using a Bastion Host
To connect to a compute node not accessible from the Internet we need to use a bastion.

Before connecting we need to [create a new Bastion Session](CreateBastionSession.md) or use an existing one by [listing Bastion Sessions](ListBastionSessions.md) and choosing an active session.
Once we have an active session we can retrieve the appropriate SSH command.
## Retrieving the SSH Command for a Bastion SSH Session
Request the SSH command.
````
./getBastionSessionSSH.sh ocid1.bastionsession.oc1.phx.amaaaaaaSession
````
> Get bastion session SSH command from bastion session ID ocid1.bastionsession.oc1.phx.amaaaaaaSession<br/>
> ssh -i <privateKey> -o ProxyCommand="ssh -i <privateKey> -W %h:%p -p 22 ocid1.bastionsession.oc1.phx.amaaaaaaSession@host.bastion.us-phoenix-1.oci.oraclecloud.com" -p 22 opc@10.7.128.212
## Using the SSH Command
To use the generated SSH command we need to replace the two <privateKey> references with references to the private key file. See [How to Retrieve Secrets from Vault](./RetrieveSecretsFromVault.md).
We can use the SSH command directly from OCI cloud shell or a Linux machine. Using it from Windows desktop requires using Windows Subsystem for Linux, cygwin or Putty.
Note that putty needs some effort to make work as it can't execute the ssh command directly.
