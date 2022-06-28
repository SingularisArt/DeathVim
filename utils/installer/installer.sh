#!/usr/bin/env bash
set -eo pipefail

# Set branch to master unless specified by the user
declare -r DV_BRANCH="${DV_BRANCH:-"master"}"
declare -r DV_REMOTE="${DV_REMOTE:-SingularisArt/DeathVim.git}"
declare -r INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"

declare -r XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -r XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
declare -r XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

declare -r DEATHVIM_RUNTIME_DIR="${DEATHVIM_RUNTIME_DIR:-"$XDG_DATA_HOME/deathvim"}"
declare -r DEATHVIM_CONFIG_DIR="${DEATHVIM_CONFIG_DIR:-"$XDG_CONFIG_HOME/dvim"}"
declare -r DEATHVIM_CACHE_DIR="${DEATHVIM_CACHE_DIR:-"$XDG_CACHE_HOME/dvim"}"
declare -r DEATHVIM_BASE_DIR="${DEATHVIM_BASE_DIR:-"$DEATHVIM_RUNTIME_DIR/dvim"}"

declare ARGS_LOCAL=0
declare ARGS_OVERWRITE=0
declare ARGS_INSTALL_DEPENDENCIES=1
declare INTERACTIVE_MODE=1

declare -r BOLD='\033[0;1m'
declare -r GREEN='\033[1;32m'
declare -r PURPLE='\033[1;35m'
declare -r RED='\033[1;31m'
declare -r RESET='\033[0m'
declare -r YELLOW='\033[1;33m'

declare -r LOG_LEVEL_DEBUG=5
declare -r LOG_LEVEL_NOTICE=4
declare -r LOG_LEVEL_INFO=3
declare -r LOG_LEVEL_WARNING=2
declare -r LOG_LEVEL_ERROR=1

LOG_LEVEL=$LOG_LEVEL_INFO

log_notice() {
  if [[ $LOG_LEVEL -ge $LOG_LEVEL_NOTICE ]]; then
    echo -e "$GREEN[notice] $RESET $*" > /dev/stderr
  fi
}

log_debug() {
  if [[ $LOG_LEVEL -ge $LOG_LEVEL_DEBUG ]]; then
    echo -e "$PURPLE[debug]  $RESET $*" > /dev/stderr
  fi
}

log_info() {
  if [[ $LOG_LEVEL -ge $LOG_LEVEL_INFO ]]; then
    echo -e "$BOLD[info]   $RESET $*" > /dev/stderr
  fi
}

log_warn() {
  if [[ $LOG_LEVEL -ge $LOG_LEVEL_WARNING ]]; then
    echo -e "$YELLOW[warning]$RESET $*" > /dev/stderr
  fi
}

log_error() {
  if [[ $LOG_LEVEL -ge $LOG_LEVEL_ERROR ]]; then
    echo -e "$RED[error]  $RESET $*" > /dev/stderr
  fi
}

function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}

function confirm() {
  local question="$1"
  while true; do
    msg "$question"
    read -p "[y]es or [n]o (default: no) : " -r answer
    case "$answer" in
      y | Y | yes | YES | Yes)
        return 0
        ;;
      n | N | no | NO | No | *[[:blank:]]* | "")
        return 1
        ;;
      *)
        msg "Please answer [y]es or [n]o."
        ;;
    esac
  done
}

declare -a __dvim_dirs=(
  "$DEATHVIM_RUNTIME_DIR"
  "$DEATHVIM_CONFIG_DIR"
  "$DEATHVIM_CACHE_DIR"
)

declare -a __os_deps=()

declare -a __npm_deps=(
  "vim-language-server"
  "bash-language-server"
  "vscode-langservers-extracted"
  "typescript-language-server"
  "typescript"
  "clang-format"
)

declare -a __pip_deps=(
  "python-lsp-server[all]"
  "neovim"
  "pynvim"
  "black"
  "cmake-language-server"
)

declare -a __rust_deps=(
  "texlab"
)

function usage() {
  echo "Usage: install.sh [<options>]"
  echo ""
  echo "Options:"
  echo "    -h, --help                               Print this help message"
  echo "    -y, --yes                                Disable confirmation prompts (answer yes to all questions)"
  echo "    --overwrite                              Overwrite previous LunarVim configuration (a backup is always performed first)"
  echo "    --[no]-install-dependencies              Whether to automatically install external dependencies (will prompt by default)"
  echo "    --log-level                              Log level (debug, info, warn, error)"
  echo "    --create-executable                      Only create the dvim executable"
}

function change_log_level() {
  if [[ $1 == "debug" ]]; then
    LOG_LEVEL=$LOG_LEVEL_DEBUG
  elif [[ $1 == "notice" ]]; then
    LOG_LEVEL=$LOG_LEVEL_NOTICE
  elif [[ $1 == "info" ]]; then
    LOG_LEVEL=$LOG_LEVEL_INFO
  elif [[ $1 == "warn" ]]; then
    LOG_LEVEL=$LOG_LEVEL_WARNING
  elif [[ $1 == "error" ]]; then
    LOG_LEVEL=$LOG_LEVEL_ERROR
  else
    log_error "Unknown log level: $1"
    exit 1
  fi
}

function parse_arguments() {
  while [ "$#" -gt 0 ]; do
    case "$1" in
      -l | --local)
        ARGS_LOCAL=1
        ;;
      -L | --log-level)
        change_log_level "$2"
        ;;
      -y | --yes)
        INTERACTIVE_MODE=0
        ;;
      --install-dependencies)
        ARGS_INSTALL_DEPENDENCIES=1
        ;;
      --no-install-dependencies)
        ARGS_INSTALL_DEPENDENCIES=0
        ;;
      --create-executable)
        create_executable()
        ;;
      -h | --help)
        usage
        exit 0
        ;;
    esac
    shift
  done
}

function detect_platform() {
  OS="$(uname -s)"
  case "$OS" in
    Linux)
      if [ -f "/etc/arch-release" ] || [ -f "/etc/artix-release" ]; then
        RECOMMEND_INSTALL="sudo pacman -S"
      elif [ -f "/etc/fedora-release" ] || [ -f "/etc/redhat-release" ]; then
        RECOMMEND_INSTALL="sudo dnf install -y"
      elif [ -f "/etc/gentoo-release" ]; then
        RECOMMEND_INSTALL="emerge -tv"
      else # assume debian based
        RECOMMEND_INSTALL="sudo apt install -y"
      fi
      ;;
    FreeBSD)
      RECOMMEND_INSTALL="sudo pkg install -y"
      ;;
    NetBSD)
      RECOMMEND_INSTALL="sudo pkgin install"
      ;;
    OpenBSD)
      RECOMMEND_INSTALL="doas pkg_add"
      ;;
    Darwin)
      RECOMMEND_INSTALL="brew install"
      ;;
    *)
      log_error "OS $OS is not currently supported."
      exit 1
      ;;
  esac
}

function check_if_installed() {
  if [[ -f "/usr/bin/$1" ]]; then
    return 0
  else
    log_error "Please install $1 with the following command: '$RECOMMEND_INSTALL $1'"
    return 1
  fi
}

function install_os_dependencies() {
  for dep in "${__os_deps[@]}"; do
    "$RECOMMEND_INSTALL" "$dep"
  done
}

function install_nodejs_dependencies() {
  if [[ $(check_if_installed "npm") ]]; then
    return
  fi

  for dep in "${__npm_deps[@]}"; do
    sudo npm install --location=global "$dep"
  done
}

function install_python_dependencies() {
  if [[ $(check_if_installed "pip3") ]]; then
    return
  fi

  for dep in "${__pip_deps[@]}"; do
    pip3 install "$dep"
  done
}

function install_rust_dependencies() {
  if [[ $(check_if_installed "cargo") ]]; then
    return
  fi

  for dep in "${__rust_deps[@]}"; do
    cargo install "$dep"
  done
}

function check_neovim_min_version() {
  local verify_version_cmd='if !has("nvim-0.7") | cquit | else | quit | endif'

  # exit with an error if min_version not found
  if ! nvim --headless -u NONE -c "$verify_version_cmd"; then
    echo "[ERROR]: DeathVim requires at least Neovim v0.7 or higher"
    exit 1
  fi
}

function verify_dvim_dirs() {
  if [ "$ARGS_OVERWRITE" -eq 1 ]; then
    for dir in "${__dvim_dirs[@]}"; do
      [ -d "$dir" ] && rm -rf "$dir"
    done
  fi

  for dir in "${__dvim_dirs[@]}"; do
    mkdir -p "$dir"
  done
}

function backup_old_config() {
  local src="$DEATHVIM_CONFIG_DIR"
  if [ ! -d "$src" ]; then
    return
  fi
  mkdir -p "$src.old"
  touch "$src/ignore"
  msg "Backing up old $src to $src.old"
  if command -v rsync &>/dev/null; then
    rsync --archive -hh --stats --partial --copy-links --cvs-exclude "$src"/ "$src.old"
  else
    OS="$(uname -s)"
    case "$OS" in
      Linux | *BSD)
        cp -r "$src/"* "$src.old/."
        ;;
      Darwin)
        cp -R "$src/"* "$src.old/."
        ;;
      *)
        echo "OS $OS is not currently supported."
        ;;
    esac
  fi
  msg "Backup operation complete"
}

function clone_dvim() {
  msg "Cloning DeathVim configuration"
  git clone --branch "$DV_BRANCH" \
    --depth 1 "https://github.com/$DV_REMOTE" "$DEATHVIM_BASE_DIR"
  cd "$DEATHVIM_BASE_DIR"
  msg "Updating submodules"
  git submodule update --init --recursive
}

function link_local_dvim() {
  echo "Linking local DeathVim repo"

  # Detect whether it's a symlink or a folder
  if [ -d "$DEATHVIM_BASE_DIR" ]; then
    echo "Removing old installation files"
    rm -rf "$DEATHVIM_BASE_DIR"
  fi

  echo "   - $BASEDIR -> $DEATHVIM_BASE_DIR"
  ln -s -f "$BASEDIR" "$DEATHVIM_BASE_DIR"
}

function remove_old_cache_files() {
  local packer_cache="$DEATHVIM_CONFIG_DIR/plugin/packer_compiled.lua"
  if [ -e "$packer_cache" ]; then
    msg "Removing old packer cache file"
    rm -f "$packer_cache"
  fi

  if [ -e "$DEATHVIM_CACHE_DIR/luacache" ] || [ -e "$DEATHVIM_CACHE_DIR/dvim_cache" ]; then
    msg "Removing old startup cache file"
    rm -f "$DEATHVIM_CACHE_DIR/{luacache,dvim_cache}"
  fi
}

function setup_dvim() {
  remove_old_cache_files

  msg "Installing DeathVim example configuration"

  mkdir -p "$HOME"/.config/dvim/lua
  cp "$DEATHVIM_BASE_DIR/utils/installer/config.example.lua" "$DEATHVIM_CONFIG_DIR/lua/config.lua"

  echo "Preparing Packer setup"

  "$INSTALL_PREFIX/bin/dvim" --headless \
    -c 'autocmd User PackerComplete quitall'

  echo "Packer setup complete"
}

function validate_deathvim_files() {
  local verify_version_cmd='if v:errmsg != "" | cquit | else | quit | endif'
  if ! "$INSTALL_PREFIX/bin/dvim" --headless -c 'DvimUpdate' -c "$verify_version_cmd" &>/dev/null; then
    msg "Removing old installation files"
    rm -rf "$DEATHVIM_BASE_DIR"
    clone_dvim
  fi
}

function create_executable() {
  msg "Creating DeathVim executable"

  local src="$DEATHVIM_BASE_DIR/utils/bin/dvim.template"
  local dst="$INSTALL_PREFIX/bin/dvim"

  if [[ -f $dst ]]; then
    rm -rf "$dst"
  fi

  cp "$src" "$dst"
  chmod +x "$dst"
}

function print_logo() {
  cat <<'EOF'
 /$$$$$$$                        /$$     /$$       /$$    /$$ /$$              
| $$__  $$                      | $$    | $$      | $$   | $$|__/              
| $$  \ $$  /$$$$$$   /$$$$$$  /$$$$$$  | $$$$$$$ | $$   | $$ /$$ /$$$$$$/$$$$ 
| $$  | $$ /$$__  $$ |____  $$|_  $$_/  | $$__  $$|  $$ / $$/| $$| $$_  $$_  $$
| $$  | $$| $$$$$$$$  /$$$$$$$  | $$    | $$  \ $$ \  $$ $$/ | $$| $$ \ $$ \ $$
| $$  | $$| $$_____/ /$$__  $$  | $$ /$$| $$  | $$  \  $$$/  | $$| $$ | $$ | $$
| $$$$$$$/|  $$$$$$$|  $$$$$$$  |  $$$$/| $$  | $$   \  $/   | $$| $$ | $$ | $$
|_______/  \_______/ \_______/   \___/  |__/  |__/    \_/    |__/|__/ |__/ |__/
EOF
}

function main() {
  parse_arguments "$@"

  print_logo

  msg "Detecting platform for managing any additional dependencies"
  detect_platform

  if [ "$ARGS_INSTALL_DEPENDENCIES" -eq 1 ]; then
    if [ "$INTERACTIVE_MODE" -eq 1 ]; then
      if confirm "Would you like to install DeathVim's OS dependencies?"; then
        install_os_dependencies
      fi
      if confirm "Would you like to install DeathVim's NodeJS dependencies?"; then
        install_nodejs_dependencies
      fi
      if confirm "Would you like to install DeathVim's Python dependencies?"; then
        install_python_dependencies
      fi
      if confirm "Would you like to install DeathVim's Rust dependencies?"; then
        install_rust_dependencies
      fi
    else
      install_nodejs_dependencies
      install_python_dependencies
      install_rust_dependencies
    fi
  fi

  backup_old_config

  verify_dvim_dirs

  if [ "$ARGS_LOCAL" -eq 1 ]; then
    link_local_dvim
  elif [ -d "$DEATHVIM_BASE_DIR" ]; then
    validate_deathvim_files
  else
    clone_dvim
  fi

  create_executable
  setup_dvim

  msg "Thank you for installing DeathVim! :)"

  log_info "You can start it by running: $INSTALL_PREFIX/bin/dvim"
  log_info "Do not forget to use a font with glyphs (icons) support [https://github.com/ryanoasis/nerd-fonts]"
}

main "$@"
