#!/bin/bash
echo 'Are you sure you want to delete all branches besides master and develop? (y/N)'
read response
if [[ $response == "N" ]]
then
    exit 1
elif [[ $response == "y" ]]
then
    git checkout master
    echo "--- NUKING BRANCHES ---"
    for branch in $(git for-each-ref --format '%(refname:short)' refs/heads/)
    do
        if [[ $branch != "master" && $branch != "develop" ]]
        then 
            git branch -D $branch
        fi
    done
else
    nuke-branches.sh
fi
