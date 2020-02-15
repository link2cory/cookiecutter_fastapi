#!/bin/sh

# tear down the project
cd ~/.cookiecutters/temp/fastapi_hello_world \
	&& pipenv --rm
	
cd ~/.cookiecutters/temp \
	&& rm -f -r fastapi_hello_world

#docker image rm fastapi_hello_world
