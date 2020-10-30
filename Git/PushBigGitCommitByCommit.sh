#!/bin/bash.sh
#
# push a big git repository commit by commit to not run into timeouts
# this is for example needed if you have some bigger binary files inside the repository and
# run into timeouts while pushing the repo into a new remote url.
#
# to run this script please ensure that:
#   1. you are able to push to your remote url via ssh (without password authentication)
#   2. you put this file into the directory above your git repo and open a bash inside your repo's directory
#   3. this file is executable, if you are unsure about this run:
#      sudo chmod +x ../PushBigGitCommitByCommit.sh
#   3. you call this script by: 
#      . ../PushBigGitCommitByCommit.sh

# set target branch to push to
TargetBranch="refs/heads/master"
# get list of all commit-IDs
ListOfGitCommitIDs=$(git log --pretty=format:"%h")
NumberOfGitCommitIDs=$(echo ${ListOfGitCommitIDs} | wc -w)

# output information for user
echo "Found following list of git ${NumberOfGitCommitIDs} commit IDs :"
echo "${ListOfGitCommitIDs}"
echo "Loop over all git commits from latest to newest"

# reverse commits for to loop from oldest to newest
ListOfGitCommitIDs=$(echo ${ListOfGitCommitIDs} | rev)

# loop over commit IDs
for CommitID in ${ListOfGitCommitIDs}; do
    # reverse every commit id back to original string
    CommitID=$(echo ${CommitID} | rev)

    # try to push everything from beginning to current commit ID
    echo "Trying to push commit ${CommitID}"
    git push origin ${CommitID}:${TargetBranch}
done
