#!/bin/bash

# Define branch names
JAVID_BRANCH="javid"
MAIN_BRANCH="main"

# Ensure you are on the main branch
echo "Switching to the $MAIN_BRANCH branch..."
git checkout "$MAIN_BRANCH"

# Pull the latest changes from the remote main branch
echo "Pulling the latest changes from the $MAIN_BRANCH branch..."
git pull origin "$MAIN_BRANCH"

# Delete the local javid branch
if git branch --list "$JAVID_BRANCH" > /dev/null 2>&1; then
  echo "Deleting the local branch $JAVID_BRANCH..."
  git branch -d "$JAVID_BRANCH" || {
    echo "The branch $JAVID_BRANCH could not be deleted (it may not be fully merged)."
    exit 1
  }
else
  echo "Branch $JAVID_BRANCH does not exist locally."
fi

# Add and commit any changes
echo "Adding and committing changes..."
git add .

if git status --porcelain | grep '^?? ' > /dev/null; then
  git commit -m "Committing changes before pushing to origin"
else
  echo "No changes to commit."
fi

# Push the changes to the remote main branch
echo "Pushing changes to the $MAIN_BRANCH branch on the remote repository..."
git push origin "$MAIN_BRANCH"

echo "Script completed successfully."





