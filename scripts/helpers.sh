#!/usr/bin/env bash

get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value="$(tmux show-option -gqv "$option")"

  if [[ -n "$option_value" ]]; then
    echo "$option_value"
  else
    echo "$default_value"
  fi
}

set_tmux_option() {
  local option="$1"
  local value="$2"

  tmux set-option -gq "$option" "$value"
}

get_check_dir() {
  local default_check_dir="${HOME}/Maildir/me/new"
  local check_dir_option="@check_dir"
  local optional_check_dir="$(tmux show-option -gqv "$check_dir_option")"

  if [[ -n "$optional_check_dir" ]]; then
    echo "$optional_check_dir"
  else
    echo "$default_check_dir"
  fi
}

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et
