#!/bin/bash

# Display the UID and username of the user executing this script
# Display if the user is the root user or not

#Display the UID
echo "Your you UID is ${UID}"

#Display the username

USERNAME=$(id -un)
#old method USERNAME=`id -un`
echo "your username is $USERNAME"


#Display if the user is root or not
if [[ "${UID}" -eq 0 ]]
then
   echo 'You are root'
else
   echo 'You are not root'
fi




