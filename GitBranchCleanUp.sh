#! /bin/bash

# Get All git braches
# List all branches
# remove all merged branches with main

baseBranch="main"

main() 
{
    echo "Welcome to Git"
    sleep 3
    echo "Enter your choice"
    echo "1. List all branches"
    echo "2. Remove all merged branches with $baseBranch"
    echo "3. Exit"
    read choice

    case "$choice" in 

        1) 
            echo "Listing all the exisitng branches..."
            branches
            ;;
        2)
            echo "Removing all the merged Branched with $baseBranch..."
            removeBranches
            ;;
        3)
            echo "Exiting the shell.."
            breakloop=1
            ;;
        *)
            echo "Invalid Choice.."
            echo "Please choose a valid one.."
            ;;
    esac
}


branches()
{
    sleep 1
    git branch | awk '{print $1 == "*" ? $2:$1 }'
}

removeBranches()
{
    sleep 2

    git branch --merged "$baseBranch"| grep -v '^\*' | grep -v "$baseBranch\$" | xargs -n 1 git branch -d
}

while true;do
    main
    if [ "$breakloop" == 1 ]; then
        break
    fi
done



