#!/bin/bash

###
### Script: rmproject.sh
###

echo "Please provide project name:"
read name

# Convert upper case to lower case and set variable "lowerCase"
lowerCase=`echo "$name" | tr '[:upper:]' '[:lower:]'`

# Convert underscore to hyphen and set variable "projectName"
projectName=`echo "$lowerCase" |tr '_' '-'`

# Set variable devGroup
devGroup="$projectName-developers"

echo -e "\nRemoving group: $devGroup\n"
#oc delete group $devGroup

echo -e "\nDeleting project: $projectName\n"
#oc delete project $projectName

echo -e "\nSuccessfully removed project: $projectName"
