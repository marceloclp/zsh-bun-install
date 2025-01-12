() {
  # Adds a path to the PATH environment variable
  # @usage   add_path <path>
  # @example add_path $HOME/.bun/bin
  function add_path() {
    [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
  }

  # Checks if a command is installed
  # @usage   is_installed <command_name>
  # @example is_installed bun
  function is_installed() {
    command -v "$1" >/dev/null 2>&1
  }

  # Bun installation directory:
  export BUN_DIR=${BUN_DIR:-$HOME/.bun}
  # Whether to enable bun completion:
  export BUN_COMPLETION=${BUN_COMPLETION:-true}

  # @see https://bun.sh/docs/installation
  function install_bun() {
    if ! [[ -d "$BUN_DIR" ]]; then
      curl -fsSL https://bun.sh/install | BUN_INSTALL=$BUN_DIR IS_BUN_AUTO_UPDATE=false bash
    fi

    if ! is_installed bun; then
      export BUN_INSTALL=$BUN_DIR
      add_path $BUN_INSTALL/bin
    fi
  }

  # Load bun completion if enabled
  function load_bun_completion() {
    if $BUN_COMPLETION; then
      source $BUN_DIR/_bun
    fi
  }

  install_bun
  load_bun_completion
}
