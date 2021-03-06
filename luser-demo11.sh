#!/bin/bash

# This script generates a random password
# This user can set the password lenght with -l and add a special character with -s.
# Verbose mode can be enabled with -v

usage () {
	echo "Usage: ${0} [-vs] [-l LENGHT]" >&2
	echo 'Generate a random password.'
	echo ' -l LENGHT Specify the password lenght.'
	echo ' -s	Append a special character to the password.'
	echo ' -v	Increase verbosity.'
	exit 1
}
log() {
  local MESSAGE="${@}"
  if [[ "${VERBOSE}" = 'true' ]]
then
	echo "${MESSAGE}"
fi
}

# Set a default password lenght
LENGHT=48

while getopts vl:s OPTION
do
	case ${OPTION} in
	v)
	 VERBOSE='true'
	 log 'Verbose mode on.'
	 ;;
	l)
	 LENGHT="${OPTARG}"
	 ;;
	s)
	 USE_SPECIAL_CHARACTER='true'
	 ;;
	?)
	 usage
 	 ;;
	esac
done

echo "Number of args: ${#}"
echo "All args: ${@}"
echo "First arg: ${1}"
echo "Second arg: ${2}"
echo "Third arg: ${3}"

# Inspect OPTInd
echo "OPTIND: ${OPTIND}"

#Remove the options while leaving the remaining arguments.
shift "$(( OPTIND -1 ))"

echo 'After the shift:'

log 'Generating a password.'

PASSWORD=$(date +%s%N{RANDOM}{RANDOM} | sha256sum | head -c${LENGHT})

# Append a special character if requested to do so

if [[ "${USE_SPECIAL_CHARACTER}" = 'true' ]]
then
	log ' Selecting a random special character.'
	SPECIAL_CHARACTER=$(echo '!@#$%^&*()-*=' | fold -w1 | shuf | head -c1)
	PASSWORD="${PASSWORD}${SPECIAL_CHARACTER}"
fi

log 'Done.'
log 'Here is the password:'

#Display the password.
echo "${PASSWORD}"

exit 0
