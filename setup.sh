#!/bin/bash

# Check if SRC_ARCHIVE_URL is present, download & unpack if so
if [[ ! -z $SRC_ARCHIVE_URL ]]; then

    echo "Starting download of archive at: $SRC_ARCHIVE_URL"
    wget $SRC_ARCHIVE_URL -O archive
    echo "Unpacking archive"
    aunpack -q archive
    echo "Archive unpacked, checking paths for \"start.sh\" file"

    # check if the optionally mounted volume has a `start.sh` script
    if [[ ! -z $(ls /mnt | grep start.sh) ]]; then

        echo "\"start.sh\" found on mounted volume"
        chmod +x /mnt/start.sh
        cp /mnt/start.sh /runstart/

    # check the unpacked files for a singular setup.sh file
    elif [[ $(find . -name start.sh | wc -l) -eq 1 ]]; then

        echo "\"start.sh\" found in downloaded archive"
        START_FILE=$(find . -name start.sh)
        chmod +x $START_FILE
        ln -s $START_FILE ./start.sh

    # No start.sh script found
    else

        echo "Either no \"start.sh\" script provided in archive or in mounted volume, or more than 1 (therefore ambiguous)."
        echo "Exiting..."
        exit -1

    fi

# check the mounted volume for at least start.sh, but potentially other files as well
elif [[ ! -z $(ls /mnt) ]]; then

    # if only one start.sh file on mounted volume, go ahead & use it
    if [[ $(find /mnt -name start.sh | wc -l) -eq 1 ]]; then

        echo "Using files from mounted volume"
        START_FILE=$(find /mnt -name start.sh)
        chmod +x /mnt$START_FILE
        ln -s /mnt/* /runstart/

    else

        echo "Either no \"start.sh\" script provided in mounted volume, or more than 1 (therefore ambiguous)."
        exit -2

    fi

else

    echo "Either provide the SRC_ARCHIVE_URL with a start.sh script, "
    echo "  provide SRC_ARCHIVE_URL and a mounted volume with start.sh, "
    echo "  OR a mounted volume with the start.sh script (& other required components)"
    echo "Exiting..."
    exit -3

fi

/runstart/start.sh