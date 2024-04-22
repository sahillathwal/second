#!/bin/bash

# Define the branch name
branch_name="main"

# Remove ignored files from the Git repository
git ls-files -ci --exclude-standard -z | xargs -0 git rm --cached

# Commit the changes
git commit -m "Removed ignored files from repository"

# Push the changes to the remote repository
git push origin "$branch_name"
