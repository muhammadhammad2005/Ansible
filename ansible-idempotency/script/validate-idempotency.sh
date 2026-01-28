#!/bin/bash
# ==========================================
# Validate Ansible Playbook Idempotency
# ==========================================

if [ -z "$1" ]; then
  echo "Usage: $0 <playbook.yml>"
  exit 1
fi

PLAYBOOK="$1"
TMP1=$(mktemp /tmp/run1.XXXX.log)
TMP2=$(mktemp /tmp/run2.XXXX.log)

echo "=== Running first playbook execution ==="
ansible-playbook "$PLAYBOOK" | tee "$TMP1"

echo ""
echo "=== Running second playbook execution ==="
ansible-playbook "$PLAYBOOK" | tee "$TMP2"

# Extract changed and failed counts from PLAY RECAP of second run
CHANGED_RUN2=$(grep -A1 "PLAY RECAP" "$TMP2" | grep -o "changed=[0-9]*" | cut -d= -f2)
FAILED_RUN2=$(grep -A1 "PLAY RECAP" "$TMP2" | grep -o "failed=[0-9]*" | cut -d= -f2)

echo ""
echo "=== Second run results ==="
echo "Changed: $CHANGED_RUN2"
echo "Failed: $FAILED_RUN2"

if [ "$CHANGED_RUN2" -eq 0 ] && [ "$FAILED_RUN2" -eq 0 ]; then
  echo "✅ IDEMPOTENCY PASSED"
else
  echo "❌ IDEMPOTENCY FAILED"
fi

# Cleanup temporary files
rm -f "$TMP1" "$TMP2"
