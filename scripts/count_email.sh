#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${CURRENT_DIR}/helpers.sh"

check_dir=$(get_check_dir)
if [[ -d "$check_dir" ]]; then
  num=$(find $check_dir -type f | awk 'BEGIN {n=0} {n++} END {print n}')
else
  echo "#[fg=red]No such dir#[default]"
  exit 0
fi

if [[ $num -gt 0 ]]; then
  echo "#[fg=red]New mail($num)#[default]"
else
  echo "No mail"
fi

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et
