#!/bin/sh

set -e

src=$1
dst=$2

GIT_SSH_COMMAND="ssh -v"

echo "src=$src"
echo "dst=$dst"

git clone --mirror "$src" && cd `basename "$src"`
git remote set-url --push origin "$dst"
git fetch -p origin
git for-each-ref --format 'delete %(refname)' refs/pull | git update-ref --stdin
git push --mirror
