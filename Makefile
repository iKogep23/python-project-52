.PHONY: install collectstatic migrate build setup run render-start

install:
	uv sync --locked

collectstatic:
	uv run python manage.py collectstatic --noinput

migrate:
	uv run python manage.py migrate

build-css:
	uv run python manage.py tailwind build

build:
	./build.sh

setup: install collectstatic migrate
	@echo "setup complete."

run:
	uv run python manage.py runserver

render-start:
	uv run gunicorn task_manager.wsgi
