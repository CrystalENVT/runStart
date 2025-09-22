# RunStart
## A simple flexible docker container that runs a `start.sh` script provided by either the archive-to-download or on a mounted volume
-------------------------
<table>
  <tr>
    <td colspan=2 center> <h2><b><i>Options</i></b></h2></td>
  </tr>
  <tr>
    <td><b>SRC_ARCHIVE_URL</b></td>
    <td>Download URL to any archive format supported by <a href="https://linux.die.net/man/1/aunpack">aunpack</a>. Can optionally include the <code>start.sh</code> in this archive.</td>
  </tr>
  <tr>
    <td><b>Map a Volume</b></td>
    <td>Map a docker volume for either persistent storage, or for the <code>start.sh</code> script, or all the above. Use the format <code>/local/path/to/dir:/mnt</code> for mounting</td>
  </tr>
</table>

## Docker Hub Page
Current: https://hub.docker.com/r/CrystalENVT/runstart
Deprecated: https://hub.docker.com/r/snreloaded/runstart

## RunStart types
```
latest         : base image. Manual install for any additional requirements beyond basic shell usage
python3-latest : python3 & pip pre-installed beyond the base image
java17-latest  : java17 pre-installed beyond the base image
java8-latest   : java8 pre-installed beyond the base image
```

## Example `docker run` Command:
`docker run -d -it --name <image_name> -v /local/path/to/dir:/mnt --env SRC_ARCHIVE_URL="remote_archive_to_download" --env OTHER_VAR="Optional_Additional_Values_You_Wish_To_Map" CrystalENVT/runstart:latest`

## Potential questions:

1) <b>Q:</b> This project seems cool! How do I use it for myself?  
   <b>A:</b> There are various different container orchestration tools, such as Portainer & Rancher, that this should work with, but the simplest docker run command can be seen documented [above](#example-docker-run-command) (tagging the latest build). If you want to tag a specific version, refer to the [docker hub page](#docker-hub-page) for all the tagged versions.
