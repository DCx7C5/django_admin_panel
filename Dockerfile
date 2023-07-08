FROM python:3.11-alpine

WORKDIR /project

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev

COPY admin_panel .
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt \
    && rm -rf /root/.cache