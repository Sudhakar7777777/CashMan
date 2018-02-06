# Using lightweight alpine image
FROM python:3.6-alpine

# Installing packages
RUN apk update
RUN apk add --no-cache bash
RUN pip install --no-cache-dir pipenv

# Defining working directory and adding source code
WORKDIR /usr/src/app
COPY Pipfile Pipfile.lock bootstrap.sh ./
COPY cashman ./cashman

# Install API dependencies
RUN pipenv install

# Validate Installs
RUN ls -l /bin/bash
RUN ls -l /usr/src/app
RUN echo "testing"

# Start app
EXPOSE 5000
ENTRYPOINT ["/usr/src/app/bootstrap.sh"]