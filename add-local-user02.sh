#!/bin/bash
#
# This script creates a new user on the local system. 
# You must supply a username as an argument to the script.
# Optionally, you can also provide a comment for the account as an argument.
# A password will be automatically generated for the account 
# The username, password, and host for the account will be displayed

# Make sure the script is bein executed with superuser privileges.

if [[ "${UID}" -ne 0 ]]
then
	echo 'Please run with sudo or as root.'
	exit 1
fi

# If they don't supply at least one argument,, them give them help.
if [[ "${#}" -lt 1 ]]
then
	echo "Usage: ${0} USERNAME [COMMENT]..."
	echo 'Create an account on the local system with the name of USERNAME and a comments field of COMMENT. '
	exit 1
fi

# The first parameter is the user name
USERNAME="${1}"

# The rest of the parameters are for the account comments.
shift
COMMENT="${@}"

# Generate a password
PASSWORD=$(date +%s%N | sha256sum | head -c48)

# Create the user with the password
useradd -c "${COMMENT}" -m ${USERNAME}

# Check to see if the useradd command succeded
# We don't want to tell the user that an account was created when it hasn't been.
if [[ "${?}" -ne 0 ]]
then
	echo 'The account could not be created.'
	exit 1
fi

# Set the password.
echo ${PASSWORD} | passwd --stdin ${USERNAME}

# Check to see if the passwd command succeded

if [[ "${?}" -ne 0 ]]
then
	echo 'The password for the account could not be set'
	exit 1
fi

# Force password change on first login
passwd -e ${USERNAME}

# Display the username, password, and the host where the user was created.

echo
echo 'username:'
echo "${USERNAME}"
echo
echo 'password'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0

