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

## Example `docker run` Command:
`docker run -d -it --name <image_name> -v /local/path/to/dir:/mnt --env SRC_ARCHIVE_URL="remote_archive_to_download" --env OTHER_VAR="Optional_Additional_Values_You_Wish_To_Map" runstart:latest`

## Potential questions:

1) <b>Q:</b> Why all the "bloat" of including both Java & Python3 in this image? I could make a way slimmer image by making something purpose built.  
   <b>A:</b> Perfect! Go build that slimmed down image :) This is meant to be a general image that I could just throw my existing projects into without much thought. I could definitely slim this down if I was building purpose made containers, but this image is meant as the brute force / general solution.
2) <b>Q:</b> Why the "Temurin" JDK instead of some other JDK source?  
   <b>A:</b> Previously the "Temurin" JDK was the "AdoptOpenJDK" project, which was then acquired by Eclipse & the project name was changed. Still the same core essence, just under a different group, hence why I use this still.
3) <b>Q:</b> This project seems cool! How do I use it for myself?  
   <b>A:</b> Unfortunately for now, while I figure out how this Docker registry stuff works, you will need to clone & this image locally by yourself. Readme will be updated once you can pull from a registry :)