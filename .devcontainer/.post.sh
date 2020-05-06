#!/bin/sh
#
#  post container build startup script. This script is run the every time a shell
#  is opened inside the container. This script then checks for a folder in the home folder 
#  of coder, and if the folder dows not exist, it know to configure the container as a 
#  "FIRST RUN AFTER BUILD/REBUILD"
#  This allows for the setup of ssh credentials, gpg key import and anything else that 
#  might be needed post image creation
#
#
#
SRC=/app/.vscode
TGT=$HOME/.ssh
ZDR=$HOME/.z
PSM_CFG="$SRC/config"
PSM_KNH="$SRC/known_hosts"
PSM_PRV="$SRC/psmware"
PSM_PUB="$SRC/psmware.pub"
SSH_CFG="$TGT/config"
SSH_KNH="$TGT/known_hosts"
SSH_PRV="$TGT/id_rsa_psmware"
SSH_PUB="$TGT/id_rsa_psmware.pub"
GPG_KEY="$SRC/psmware.key"
CFGDIR=$HOME/.psmware
if 
   [ ! -d "$ZDR" ]; then
   touch "$ZDR"
fi
if [ ! -d "$CFGDIR" ]; then
    echo "Running the post container build script!"
    echo "......"
    sleep 5
    set -e
    # Setup SSH`
    SSH=$HOME/.ssh
    if [ ! -d "$SSH" ]; then
        mkdir $SSH
        cp -v "$PSM_CFG" "$SSH_CFG"
        cp -v "$PSM_KNH" "$SSH_KNH"
        cp -v "$PSM_PRV" "$SSH_PRV"
        cp -v "$PSM_PUB" "$SSH_PUB"
        # Set ssh Permissions
        chmod -fR 700 $SSH
        chmod -c 600 "$SSH_PRV"
        chmod -c 644 "$SSH_PUB"
    fi
    # Set up GPG
    gpg --import "$GPG_KEY"
    gpg  --list-secret-keys --keyid-format LONG
    #make the config directory
    mkdir "$CFGDIR"
#    IP=$(ifconfig eth0 | awk '/inet addr/ {gsub("addr:", "", $2); print $2}')
fi
