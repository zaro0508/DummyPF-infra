#!/usr/bin/env bash
message=$(./update_cf_stack.sh 2>&1 1>/dev/null)
error_code=$(echo $?)
if [[ $error_code -ne 0 && $message =~ .*"No updates are to be performed".* ]]; then
  echo "There are no changes that require a stack update."
  exit 0
fi
echo $message
exit $error_code
