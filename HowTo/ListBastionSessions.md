# Listing Existing Bastion Sessions
To reuse existing Active Bastion Sessions we can list Bastion Sessions
## List existing Bastion sessions
````
./listBastionSessions.sh ocid1.bastion.oc1.phx.amaaaaaajfhkgfya6ms6qo63yix5ds5ugahbg4addnoicdqhg3u4mgdtw63a
````
> Listing bastion sessions from bastion ID ocid1.bastion.oc1.phx.amaaaaaajfhkgfya6ms6qo63yix5ds5ugahbg4addnoicdqhg3u4mgdtw63a<br/>
> Name    State   Target  SessionID<br/>
> bastionsession2024-08-05-1375   ACTIVE  Linux-UA        ocid1.bastionsession.oc1.phx.amaaaaaaSession

The session ID can be used to retrieve the SSH command assocaited with the session.
