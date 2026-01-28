#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 playbook.yml"
  exit 1
fi

PLAYBOOK=$1
TMP1=/tmp/run1.log
TMP2=/tmp/run2.log

echo "Running first playbook execution..."
ansible-playbook "$PLAYBOOK" > "$TMP1" 2>&1

echo "Running second playbook execution..."
ansible-playbook "$PLAYBOOK" > "$TMP2" 2>&1

# Extract changed count ONLY from PLAY RECAP
CHANGED_RUN2=$(grep -A1 "PLAY RECAP" "$TMP2" | grep -o "changed=[0-9]*" | cut -d= -f2)

FAILED_RUN2=$(grep -A1 "PLAY RECAP" "$TMP2" | grep -o "failed=[0-9]*" | cut -d= -f2)

echo "Second run results:"
echo "Changed: $CHANGED_RUN2"
echo "Failed: $FAILED_RUN2"

if [ "$CHANGED_RUN2" -eq 0 ] && [ "$FAILED_RUN2" -eq 0 ]; then
  echo "✅ IDEMPOTENCY PASSED"
else
  echo "❌ IDEMPOTENCY FAILED"
fi
