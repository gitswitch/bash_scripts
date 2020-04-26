#!/bin/bash

# This script displays various information to the screen

# Display 'Hello'
echo 'Hello'

#Assign a value to a variable
WORD='script'

#Display that value using the variable.
echo "Hello $WORD"

#Demonstrate that single quote not expand

echo '$WORD'

#Display the content of the variable using an alternative syntax

echo "This is a shell ${WORD}"

#Append text to the variable

echo "${WORD}ing is fun"

#Show how not to append text to a variable
#this doesn't work

echo "$WORDing is fun!"

#Create a new variable
ENDING='ed'

#Combine the two variables.

echo "this is ${WORD}${ENDING}."

#Change the value stored in the Ending variable (Reassignment)

ENDING='ing'
echo "$WORD$ENDING is fun"

#Reassing value to ENDING

ENDING='s'
echo "You are going to write many $WORD$ENDING in this class"

