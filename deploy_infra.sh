#!/usr/bin/env bash
message=$(./aws_cf.sh 2>&1 1>/dev/null)
error_code=$(echo $?)
if [[ $error_code -ne 0 && $message =~ .*"No updates are to be performed".* ]]; then
  echo "Updates is not required"
  exit 0
fi
echo $message
exit $error_code
