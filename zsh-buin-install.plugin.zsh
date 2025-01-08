() {
  # Adds a path to the PATH environment variable
  # @usage   add_path <path>
  # @example add_path $HOME/.bun/bin
  function add_path() {
    [[ ":$PATH:" != *":$1:"* ]] && export PATH="$1:$PATH"
  }

  # Initializes and exports a variable with a default value if unset:
  # @usage   init_env <env_name> <default_value>
  # @example init_env BUN_DIR    $HOME/.bun
  function init_env() {
    [[ -z "${(P)1}" ]] && export $1="$2"
  }

  # @usage   is_installed <command_name>
  # @example is_installed bun
  function is_installed() {
    command -v "$1" >/dev/null 2>&1
  }

  # Checks if a directory exists:
  # @usage   is_dir <path>
  # @example is_dir $HOME/.bun
  function is_dir() {
    [[ -d "$1" ]]
  }

  # @see https://bun.sh/docs/installation
  function install_bun() {
    init_env BUN_DIR $HOME/.bun
    
    if ! is_dir $BUN_DIR; then
      curl -fsSL https://bun.sh/install | BUN_INSTALL=$BUN_DIR bash
    fi

    if ! is_installed bun; then
      add_path $BUN_DIR/bin
    fi
  }

  install_bun
}
