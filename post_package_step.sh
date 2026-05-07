#!/usr/bin/env bash

echo "The script you are running has:"
echo "basename: [$(basename "$0")]"
echo "dirname : [$(dirname "$0")]"
echo "pwd     : [$(pwd)]"

cd /D $(dirname "$0")
/usr/bin/python3 "$(dirname "$0")/releases/noteGetter.py"
/usr/bin/python3 "$(dirname "$0")/docsdata/gen/main.py"