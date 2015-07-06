#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

email_notifier="#(${CURRENT_DIR}/scripts/count_email.sh)"
email_notifier_interpolation_string="\#{email_notifier}"

source "${CURRENT_DIR}/scripts/helpers.sh"

do_interpolation() {
  local string="$1"
  local interpolated="${string/$email_notifier_interpolation_string/$email_notifier}"

  echo "$interpolated"
}

update_tmux_option() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"

  set_tmux_option "$option" "$new_option_value"
}

update_tmux_option "status-right"
update_tmux_option "status-left"

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et
