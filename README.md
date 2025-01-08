# `zsh-bun-install`

> Zsh plugin for installing and loading Bun

## Installation

This plugin was built to be used with [Antidote](https://antidote.sh/), but
should also work with any Zsh plugin manager.

### Using Antidote

Add the following to your `.zsh_plugins.txt` file:

```txt
marceloclp/zsh-bun-install
```

Or manually bundle the plugin in your `.zshrc`:

```zsh
antidote bundle marceloclp/zsh-bun-install
```

### Options

In your `.zshrc` file, the following options can be used to customize the plugin:

```zsh
# Customize where Bun will be installed:
export BUN_DIR="$HOME/.bun"
```
