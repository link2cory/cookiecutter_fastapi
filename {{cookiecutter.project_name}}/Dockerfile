# base image
FROM {{cookiecutter.docker_base_image}}

# set working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install -r requirements.txt

# add app
COPY . /usr/src/app

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
CMD ["uvicorn", "--bind", ":5000", "main:app"]


