```helmantov/borg-server``` is a minimal docker image of an SSH server with [Borg Backup](https://borgbackup.readthedocs.io/) support.  

It's useful when you want to store Borg repositories on a computer, and you want to use Borg's efficient backup-over-SSH feature, but you don't want to expose that computer to "real" SSH connections.  
  

## Usage  
  
  

### Using Docker CLI  
  

```  
docker run \  
  -v /home/john/borg-repos:/repos \  
  -p 22:22 \  
  -e USERNAME=john \  
  -e PASSWORD=6b6f96ba060700b79d0b \  
  -e PUID=$UID \  
  -e PGID=$GROUPS \  
  -d \  
  helmantov/borg-server  
```  
  

### Using Docker-Compose
  

```  
---  
version: "3"  
services:  
  borg-server:  
    image: helmantov/borg-server  
    ports:  
      - "22:22"  
    volumes:  
      - /home/john/borg-repos:/repos  
    environment:  
      - USERNAME=john  
      - PASSWORD=6b6f96ba060700b79d0b  
      - PUID=${UID}  
      - PGID=${GROUPS}  
```  

## Parameters  
  

In order to use `borg-server` you need to configure the following parameters:  

1. The SSH connection settings (username and password to connect with;  port number)  
2. Which Borg repositories to expose via SSH;  
3. Which Linux UserID and GroupID to use when writing files to the repository.  
 (You usually want to the UserID to be equal to the `$UID` environment variable, and the GroupID to the `$GROUPS` environment variable. Note that wrong values of UserID and GroupID may cause permission problems, and make the Borg repository inaccessible for your user.) 

Here is how you configure these parameters in the Docker CLI:
  

| Parameter | Function |  
| ---- | --- |  
|  `-v <path>:/repos`  | Path to the Borg repositories |  
|  `-p "<port>:22"`  | SSH port |  
|  `-e USERNAME=<username>`  | Username for the SSH connection (default: `user`) |  
|  `-e PASSWORD=<password>`  | Password for the SSH connection (default: `password`) |  
|  `-e PUID=<uid>`  | UserID (default: 1000) |  
|  `-e PGID=<gid>`  | GroupID (default: 1000) |

