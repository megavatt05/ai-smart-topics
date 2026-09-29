# 02. ESP-IDF: как запускать и тестировать проекты

## Введение
ESP-IDF — это официальный SDK для ESP32 и других микроконтроллеров Espressif. Ключевая задача при разработке — не только собрать прошивку, но и провести правильную проверку: сборку, запуск, тестирование на железе, минимальную валидацию логики и стабильность работы.

## Основной рабочий цикл
```bash
# 1. Подготовить окружение
source ~/esp/esp-idf/export.sh

# 2. Перейти в проект
cd /workspace/my_project

# 3. Выбрать целевой чип
idf.py set-target esp32p4

# 4. Сборка
idf.py build

# 5. Загрузка на устройство
idf.py flash

# 6. Мониторинг
idf.py monitor
```

## Как быстро проверить проект
Минимальный smoke test:
- проект собирается без ошибок;
- нет warnings critical;
- устройство отвечает по UART;
- основной функциональный сценарий запускается;
- нет зависаний после старта;
- конфигурация корректна.

## Полезные команды
```bash
idf.py build
idf.py reconfigure
idf.py fullclean
idf.py flash monitor
idf.py -p /dev/ttyUSB0 monitor
idf.py size
idf.py menuconfig
```

## Как сделать сборку и тестирование повторяем��ми
Лучше всего хранить команды в `Makefile` или `scripts/`:
```bash
#!/usr/bin/env bash
set -e
source ~/esp/esp-idf/export.sh
cd /workspace/my_project
idf.py set-target esp32p4
idf.py build
idf.py flash
idf.py monitor
```

## Как проверять корректность проекта
1. Сборка без ошибок
2. Проверка логов boot
3. Проверка инициализации компонентов
4. Проверка GPIO / UART / Wi-Fi / BLE / I2C
5. Проверка стабильности после 30–60 минут работы
6. Проверка восстановления после ресета

## CI для ESP-IDF
Пример GitHub Actions:
```yaml
name: espidf-build

on:
  push:
    branches: [ main ]
  pull_request:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Install ESP-IDF deps
        run: |
          sudo apt-get update
          sudo apt-get install -y git wget python3 python3-pip cmake ninja-build ccache

      - name: Build project
        run: |
          mkdir -p ~/esp
          git clone --depth 1 --branch v5.4.4 https://github.com/espressif/esp-idf.git ~/esp/esp-idf
          . ~/esp/esp-idf/export.sh
          cd $GITHUB_WORKSPACE
          idf.py set-target esp32p4
          idf.py build
```

## Практическая рекомендация
Для embedded-систем не ограничивайтесь только “собралось”. Проверяйте:
- время старта;
- стабильность памяти;
- утечки;
- поведение при сбросе;
- логичность работы по таймеру и событиям.

## Вывод
ESP-IDF проект — это не просто “файл и прошивка”. Это система, где критически важны:
- корректная конфигурация,
- воспроизводимый сборочный процесс,
- тестирование на реальном железе,
- контроль логов и состояний.
