FROM tiangolo/uwsgi-nginx:python3.11
# RUN apk --update add bash nano
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \ 
    nano \
    && rm -rf /var/lib/apt/lists/*
ENV STATIC_URL /static
ENV STATIC_PATH /var/www/html/app/static
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
COPY ./app /app