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

# create a github respository
curl -u {{cookiecutter.github_username}}:{{cookiecutter.github_password}} \
	--data '@github_repo_config.json' \
	https://api.github.com/user/repos

# remove the github_repo_config file
rm github_repo_config.json

# create a local git repo
git init
git add -A
git commit --message "initial commit"

# push the local repo up to github
git remote add origin \
	git@github.com:{{cookiecutter.github_username}}/{{cookiecutter.project_name}}.git
git push -u origin master

# create a jenkins job for this project
jenkins-jobs --conf jenkins/jenkins_jobs.ini update jenkins/job_config.yaml

# setup a github webhook to initial builds on push
curl -u {{ cookiecutter.github_username }}:{{ cookiecutter.github_password }} \
	--data '@github_hook_build_config.json' \
	https://api.github.com/repos/{{ cookiecutter.github_username }}/{{ cookiecutter.project_name }}/hooks


# return the result of the last command
exit $?
