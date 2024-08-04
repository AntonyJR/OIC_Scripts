# How to Retrieve Secrets from a Vault
To access a compute instance we will need both the private and public SSH keys.
The following shows you how to download a key and store it in a file.
## Find Secret
List all the secrets in a given compartment.
```
listSecrets.sh CompartmentName
````
> Listing secrets from compartment CompartmentName with ID ocid1.compartment.oc1..aaaaaaaacompartment<br/>
> Name    VaultID<br/>
> My-Public-Key     ocid1.vault.oc1.phx.eftkvpbeaabvaultkey<br/>
> My-Private-Key    ocid1.vault.oc1.phx.eftkvpbeaabvaultkey
# Download Secret
To use the secret we need to download the contents into a file.
````
getSecret.sh Linux-UA-Public-Key ocid1.vault.oc1.phx.eftkvpbeaabvaultkey >~/Keys/MyPublicKey.pub
````
> Retrieving secret-name Linux-UA-Public-Key from vault-id ocid1.vault.oc1.phx.eftkvpbeaab7o.abyhqljtopuospuhg5lgd7kufamsiv3ehzedm3mlkiozoppj772c2uqdckna

The secret is now in the file MyPublicKey.oub which can be verified by using cat command
````
cat ~/Keys/MyPublicKey.pub
````
> ssh-rsa PublicKeyValue%

Both the public and private key should be set to be only accessible by user.
````
ls -l /Keys
````
> total 4<br/>
-rw-r--r--. 1 user oci 400 Aug  4 18:03 MyPublicKey.pub
````
chmod go-r ~/Keys/MyPublicKey.pub
ls -l /Keys
````
> total 4<br/>
-rw-------. 1 user oci 400 Aug  4 18:04 MyPublicKey.pub
