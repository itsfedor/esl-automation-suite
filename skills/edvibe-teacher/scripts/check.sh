#!/bin/sh
# Quick readiness report for the Edvibe CLI.
if ! command -v cli-anything-edvibe >/dev/null 2>&1; then
  echo "MISSING: cli-anything-edvibe is not installed."
  echo "Run the setup script next to this file: sh \"$(dirname -- \"$0\")/setup.sh\""
  exit 1
fi
cli-anything-edvibe doctor
