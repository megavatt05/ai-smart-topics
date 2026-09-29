# Workspace Applications

## Purpose
This directory is for custom local projects, experiments, and apps that are part of your personal developer workflow.

## Recommended structure
```text
workspace/
├── apps/
│   ├── my-app/
│   ├── ai-tools/
│   └── experiments/
├── scripts/
│   ├── setup.sh
│   ├── run_app.sh
│   └── healthcheck.sh
└── README.md
```

## Typical workflow
### 1. Create a new app folder
```bash
mkdir -p /workspace/apps/my-app
cd /workspace/apps/my-app
```

### 2. Create a Python venv
```bash
python3 -m venv .venv
. .venv/bin/activate
pip install --upgrade pip
```

### 3. Install project packages
```bash
pip install requests fastapi uvicorn pytest
```

### 4. Create app structure
```text
my-app/
├── app.py
├── requirements.txt
├── README.md
├── tests/
│   └── test_app.py
├── .venv/
└── scripts/
```

## Helpful shell aliases
```bash
alias ws='cd /workspace'
alias ws-app='cd /workspace/apps'
alias ws-scripts='cd /workspace/scripts'
```

## Running services from workspace
```bash
cd /workspace/apps/my-app
. .venv/bin/activate
python app.py
```

## Best practices
- Keep local experiments separate from production code
- Put environment files in a safe location
- Use a dedicated venv for each app
- Keep project documentation next to code
- Write tests early for core logic

## Summary
The `workspace` directory is the place where you create your own tools, experiments, and personal developer utilities without polluting the main repository.
