# Workspace

Этот каталог для локальной рабочей среды и собственных приложений.

## Структура
```text
workspace/
├── apps/
│   └── my-app
├── scripts/
│   └── setup.sh
├── .venv/
└── README.md
```

## Как установить своё приложение в workspace
```bash
mkdir -p /workspace/apps/my-app
cd /workspace/apps/my-app

python3 -m venv .venv
. .venv/bin/activate
pip install -U pip
pip install requests fastapi uvicorn
```

## Как добавить в PATH
```bash
echo 'export PATH="/workspace/apps/my-app:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

## Как создать локальный скрипт
```bash
mkdir -p /workspace/scripts
cat > /workspace/scripts/run_app.sh <<'EOF'
#!/usr/bin/env bash
cd /workspace/apps/my-app
. .venv/bin/activate
python app.py
EOF

chmod +x /workspace/scripts/run_app.sh
```

## Правило
В `workspace/` хранятся:
- локальные проекты;
- пользовательские приложения;
- служебные скрипты;
- настройки окружения.
