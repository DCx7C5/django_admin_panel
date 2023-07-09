# Django Admin Panel
### Setup with Docker
- run `docker-compile (...)` to start python and postgres container
- wait until deployed then run the following commands with `docker exec (...)`


- `python manage.py createsuperuser`
- `python manage.py makemigrations`
- `python manage.py migrate`
- `python manage.py collectstatic`
