ARG APP_FOLDER=testing_if_this_works

FROM python:3.12-rc-alpine3.17
# RUN apk --update add bash nano
# RUN apt-get update && apt-get install -y --no-install-recommends \
RUN rm -rf /var/lib/apt/lists/*
ARG APP_FOLDER

# This is the folder where THE MAIN app will be copied
# Not necessary since the docker-compose volume is used and it overides from host to contianer
# COPY $APP_FOLDER $APP_FOLDER

# This is the folder where the docker image is looking for prestart.sh by default
# COPY ./app /app
WORKDIR $APP_FOLDER
COPY ./flask_app/requirements.txt requirements.txt
RUN pip install -r requirements.txt
