#!/usr/bin/env bash
set -eo pipefail

INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"

XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

DEATHVIM_RUNTIME_DIR="${DEATHVIM_RUNTIME_DIR:-"$XDG_DATA_HOME/deathvim"}"
DEATHVIM_CONFIG_DIR="${DEATHVIM_CONFIG_DIR:-"$XDG_CONFIG_HOME/dvim"}"
DEATHVIM_CACHE_DIR="${DEATHVIM_CACHE_DIR:-"$XDG_CACHE_HOME/dvim"}"

DEATHVIM_BASE_DIR="${DEATHVIM_BASE_DIR:-"$DEATHVIM_RUNTIME_DIR/dvim"}"

function setup_shim() {
  local src="$DEATHVIM_BASE_DIR/utils/bin/dvim.template"
  local dst="$INSTALL_PREFIX/bin/dvim"

  [ ! -d "$INSTALL_PREFIX/bin" ] && mkdir -p "$INSTALL_PREFIX/bin"

  # remove outdated installation so that `cp` doesn't complain
  rm -f "$dst"

  cp "$src" "$dst"

  sed -e s"#RUNTIME_DIR_VAR#\"${DEATHVIM_RUNTIME_DIR}\"#"g \
    -e s"#CONFIG_DIR_VAR#\"${DEATHVIM_CONFIG_DIR}\"#"g \
    -e s"#CACHE_DIR_VAR#\"${DEATHVIM_CACHE_DIR}\"#"g "$src" \
    | tee "$dst" >/dev/null

  chmod u+x "$dst"
}

setup_shim "$@"

echo "You can start DeathVim by running: $INSTALL_PREFIX/bin/dvim"
