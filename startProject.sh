#!/bin/bash

echo "Gaadi Wala aya Ghar Se Kachra Nikal"
rm -f terraform*
rm -rf .terraform*

echo "Destroying Infra if Available"
terraform destroy --auto-approve

dirName="Portfolio"
repoURL="https://github.com/UttU28/Portfolio.git"

if [ -d "$dirName" ]; then
    echo "Deleting Existing Directory: $dirName"
    rm -rf "$dirName"
fi

echo "Cloning Repo: $repoURL into directory: $dirName"
git clone -b deployment "$repoURL"

echo "Activating 13-4M"
terraform init -input=false
terraform apply -input=false --auto-approve