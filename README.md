# PVZ Manager

Сервис для управления приёмкой товаров в пунктах выдачи заказов (ПВЗ).

## Стек

- Go 1.22
- PostgreSQL (без ORM, только sqlx/database/sql + squirrel)
- chi (HTTP)
- prometheus (метрики)
- zap (логирование)
- gRPC (отдельный метод)
- Docker, docker-compose

## Запуск

1. Склонируйте репозиторий
2. Запустите `docker-compose up --build`
3. HTTP API будет доступен на `localhost:8080`
4. Метрики Prometheus — на `localhost:9000/metrics`
5. gRPC сервер — на порту 3000

## Описание API

(см. ТЗ и OpenAPI, будет добавлено позже)

## Вопросы и решения

(будет дополняться по мере реализации)
