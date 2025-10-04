# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Necessary tools

For all of Mason's package management to run appropriately,
you must have the following installed before running nvim:

1. nodejs (specifically npm)

## Useful tweaks

### SSH keys for managing GitHub authentication

Add the following to your `~/.bashrc` file:

```bash
# Necessary on Omarchy Linux for `nvm` to work properly
set -h

# Check for a running ssh-agent
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval "$(ssh-agent -s)"
fi

# Add your private key to your ssh-agent for GitHub authentication
ssh-add ~/.ssh/private_key_file
```
