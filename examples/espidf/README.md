# ESP-IDF Examples

## Quick build workflow
```bash
source ~/esp/esp-idf/export.sh
cd /workspace/my_project
idf.py set-target esp32p4
idf.py build
idf.py flash
idf.py monitor
```

## Example GitHub Actions workflow
See file: `examples/espidf/ci-build.yml`

## Good test checklist for ESP-IDF
- build succeeds
- target is correct
- boot logs look healthy
- GPIO works as expected
- peripherals respond
- reset/restart path works
- no memory leak patterns in logs

## Recommended practice
Keep a lightweight script in `/workspace/scripts` to automate local build/test loops.
