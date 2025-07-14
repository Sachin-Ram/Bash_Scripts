#! bin/bash

# Get All git braches
# List all branches
# remove all merged branches with main

baseBranch="main"

echo "All available local Branches are"

git branch | awk (print $1 == "*"?$2:$1) 