#!/usr/bin/env bash
set -e

WORKSPACE_DIR="/workspace"
APP_DIR="$WORKSPACE_DIR/apps"
SCRIPT_DIR="$WORKSPACE_DIR/scripts"

mkdir -p "$APP_DIR" "$SCRIPT_DIR"

cat > "$SCRIPT_DIR/README.md" <<'EOF'
# Scripts

This directory stores useful automation scripts for your workspace.

## Example script
```bash
#!/usr/bin/env bash
cd /workspace/apps/my-app
. .venv/bin/activate
python app.py
```
EOF

echo "Workspace directories initialized successfully."
echo "Apps folder: $APP_DIR"
echo "Scripts folder: $SCRIPT_DIR"
