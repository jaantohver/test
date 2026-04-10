#!/bin/bash

# Shift all commits back by 3 days
git filter-branch --env-filter '
# Get original dates
orig_author_date="$GIT_AUTHOR_DATE"
orig_committer_date="$GIT_COMMITTER_DATE"

# Shift by -3 days
new_author_date=$(date -d "$orig_author_date -3 days" +"%Y-%m-%d %H:%M:%S")
new_committer_date=$(date -d "$orig_committer_date -3 days" +"%Y-%m-%d %H:%M:%S")

export GIT_AUTHOR_DATE="$new_author_date"
export GIT_COMMITTER_DATE="$new_committer_date"
' --tag-name-filter cat -- --all
