#!/usr/bin/env sh

/start.sh

git config --global core.sshCommand "ssh -v -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no -l $INPUT_SSH_USERNAME"
git remote add mirror "$INPUT_TARGET_REPO_URL"
git push --tags --force --prune mirror "refs/remotes/origin/*:refs/heads/*"