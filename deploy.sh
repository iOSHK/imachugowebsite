#!/bin/sh

# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo -t dot # if using a theme, replace with `hugo -t dot`

# I included my login details to github to avoid authentication error
git config user.email "mobileseunhongkong@gmail.com"
git config user.name "ioshk"

# Go To Public folder
cd public


# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
