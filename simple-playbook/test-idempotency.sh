#!/bin/bash
# ===================================================================
# Script: test-idempotency.sh
# Purpose: Verify that the webserver-setup.yml playbook is idempotent
# ===================================================================

PLAYBOOK="playbooks/webserver-setup.yml"
INVENTORY="inventory"
FIRST_RUN_LOG="first-run.log"
SECOND_RUN_LOG="second-run.log"

echo "=== Testing Playbook Idempotency ==="
echo "Running playbook first time..."
ansible-playbook -i $INVENTORY $PLAYBOOK | tee $FIRST_RUN_LOG

echo ""
echo "Running playbook second time..."
ansible-playbook -i $INVENTORY $PLAYBOOK | tee $SECOND_RUN_LOG

echo ""
echo "Checking for changes in second run..."
if grep -q "changed=0" $SECOND_RUN_LOG; then
    echo "✓ PASS: Playbook is idempotent"
else
    echo "✗ FAIL: Playbook made unexpected changes"
    echo "Detected changes:"
    grep "changed:" $SECOND_RUN_LOG
fi

echo ""
echo "=== Summary of Runs ==="
echo "First run recap:"
grep "PLAY RECAP" -A 10 $FIRST_RUN_LOG
echo ""
echo "Second run recap:"
grep "PLAY RECAP" -A 10 $SECOND_RUN_LOG
