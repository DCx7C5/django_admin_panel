FROM python:3.11-alpine

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies
RUN apk update && apk add \
    gcc \
    python3-dev \
    musl-dev \
    postgresql-client \
    postgresql-dev

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

COPY docker.env /docker.env
RUN chmod 600 /docker.env

WORKDIR /project

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt \
    && rm -rf /root/.cache

WORKDIR /project/admin_panel

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]