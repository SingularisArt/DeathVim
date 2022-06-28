
#!/usr/bin/env bash
set -eo pipefail

ARGS_REMOVE_BACKUPS=0

declare -r XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -r XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
declare -r XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

declare -r DEATHVIM_RUNTIME_DIR="${DEATHVIM_RUNTIME_DIR:-"$XDG_DATA_HOME/deathvim"}"
declare -r DEATHVIM_CONFIG_DIR="${DEATHVIM_CONFIG_DIR:-"$XDG_CONFIG_HOME/dvim"}"
declare -r DEATHVIM_CACHE_DIR="${DEATHVIM_CACHE_DIR:-"$XDG_CACHE_HOME/dvim"}"

declare -a __dvim_dirs=(
  "$DEATHVIM_CONFIG_DIR"
  "$DEATHVIM_RUNTIME_DIR"
  "$DEATHVIM_CACHE_DIR"
)

function usage() {
  echo "Usage: uninstall.sh [<options>]"
  echo ""
  echo "Options:"
  echo "    -h, --help                       Print this help message"
  echo "    --remove-backups                 Remove old backup folders as well"
}

function parse_arguments() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
      --remove-backups)
        ARGS_REMOVE_BACKUPS=1
        ;;
      -h | --help)
        usage
        exit 0
        ;;
    esac
    shift
  done
}

function remove_dvim_dirs() {
  for dir in "${__dvim_dirs[@]}"; do
    rm -rf "$dir"
    if [ "$ARGS_REMOVE_BACKUPS" -eq 1 ]; then
      rm -rf "$dir.{bak,old}"
    fi
  done
}

function remove_dvim_bin() {
  local legacy_bin="/usr/local/bin/dvim "
  if [ -x "$legacy_bin" ]; then
    echo "Error! Unable to remove $legacy_bin without elevation. Please remove manually."
    exit 1
  fi

  dvim_bin="$(command -v dvim 2>/dev/null)"
  rm -f "$dvim_bin"
}

function main() {
  parse_arguments "$@"
  echo "Removing DeathVim binary..."
  remove_dvim_bin
  echo "Removing DeathVim directories..."
  remove_dvim_dirs
  echo "Uninstalled DeathVim!"
}

main "$@"
