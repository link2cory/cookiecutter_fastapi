#!/bin/sh

# since black is in pre-release we need to do this
pipenv lock --pre

# run pipenv install in the project directory
pipenv install --dev

# generate a requirements file
pipenv lock -r > requirements.txt

# build the docker image(s)
#{% if cookiecutter.docker_support == "yes" %}
#docker build . -t {{cookiecutter.project_name}}
#{% endif %}

# run the initial tests
#pytest

# create a git repository
git init
git add -A
git commit --message "initial commit"

# return the result of the last command
exit $?
