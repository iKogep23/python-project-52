#!/usr/bin/env bash
# очтановка деплоя с понятным выводом ошибки в случае падения команд из этого скрипта
set -o errexit

# скачиваем uv только ели его нет в системе
if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
  source "$HOME/.local/bin/env"
fi

# здесь добавьте все необходимые команды для установки вашего проекта
# команду установки зависимостей, сборки статики, применения миграций и другие
make install && make build-css && make collectstatic && make migrate
