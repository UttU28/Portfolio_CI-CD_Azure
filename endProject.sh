#!/bin/bash

echo "Destroying Available Infra"
terraform destroy --auto-approve

echo "Gaadi Wala aya Ghar Se Kachra Nikal"
rm -f terraform*
rm -rf .terraform*

dirName="Portfolio"

if [ -d "$dirName" ]; then
    echo "Deleting --> $dirName <-- this Dir :)"
    rm -rf "$dirName"
fi

echo "13-4M Deactivated"