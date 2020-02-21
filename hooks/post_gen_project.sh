#!/bin/sh

# go get the gitignore template from github
# it is important that this file not exist until project render time because 
# there are files in the template that are intended to stay on the local 
# machine, but git will pickup gitignores from any directory and remove
# them from the template entirely
curl -o .gitignore https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore

./scripts/bootstrap

# return the result of the last command
exit $?
