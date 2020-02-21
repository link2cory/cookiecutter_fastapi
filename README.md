# cookiecutter_fastapi
a cookiecutter template for fastapi 

This cookiecutter includes post-generation hooks that will:
- create a new github repo using the given project name
- create a new multibranch pipeline in your jenkins instance
- create a push event hook in the new github repo to trigger jenkins builds on push events
- deploy built docker images to dockerhub

I think that this project could be useful for making microservice architecture more practical for individuals and small teams by taking the pain away from setting up infrastructure for a new service.

Some next steps include:
- ec2/ecs/eks deployment via Jenkins pipeline database options
- container orchestration 
- JWT authentication
- Expand service integrations to include more selections.  ex: Bitbucket instead of Github, GCP or Azure instead of AWS, etc
- Smoke test suite to verify the rendered project will work out of the box and encourage the user to develop with TDD/BDD
- Maybe not limit the src to be FastAPI or even python specific?
- Other cool features people are interested in :)
