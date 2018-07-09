#!/bin/bash

###
### Script: mkproject.sh
###

echo "Please provide project name:"
read name

# Convert upper case to lower case and set variable "lowerCase"
lowerCase=`echo "$name" | tr '[:upper:]' '[:lower:]'`

# Convert underscore to hyphen and set variable "projectName"
projectName=`echo "$lowerCase" |tr '_' '-'`

echo -e "\nProvisioning project: $projectName\n"
#oc new-project $projectName

# Set variable devGroup
devGroup="$projectName-developers"

echo -e "\nConfiguring group: $devGroup\n"
#oc adm groups new $devGroup
#oc adm policy add-role-to-group edit $devGroup -n $projectName

echo -e "\nSuccessfully provisioned project: $projectName"
