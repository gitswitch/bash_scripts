#!/bin/bash

#this script generates a list of random passwords.

#A random number as a password

PASSWORD="${RANDOM}"

echo "${PASSWORD}"

#Three random number togheter

echo "${PASSWORD}${PASSWORD}${PASSWORD}"

#Use the current date/time as basis for the password
PASSWORD=$(date +%s)
echo "${PASSWORD}"

PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

#a better passwrod

PASSWORD=$(date +%s%N | sha256sum | head -c32)

echo "${PASSWORD}"

#even better password

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha512sum | head -c64)

echo "${PASSWORD}"

#Append a special character to the password.

SPECIALCHARACTER=$(echo '!.;,_£$%&()=?' | fold -w1 | shuf | head -c3)
echo "${PASSWORD}${SPECIALCHARACTER}"



