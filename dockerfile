FROM tiangolo/uwsgi-nginx:python3.11
# RUN apk --update add bash nano
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \ 
    nano \
    && rm -rf /var/lib/apt/lists/*
ARG APP_FOLDER
COPY $APP_FOLDER $APP_FOLDER
COPY ./app /app
WORKDIR $APP_FOLDER
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt