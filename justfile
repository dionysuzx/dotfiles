local_fish := env("HOME") / ".config/fish/config.fish"
repo_fish := env("HOME") / "dotfiles/config.fish"
local_just := env("HOME") / "justfile"
repo_just := env("HOME") / "dotfiles/justfile"

# Update AI coding tools
ai:
    claude update
    bun add -g @openai/codex
    bun add -g @google/gemini-cli

# Install nix packages
setup:
    nix profile add nixpkgs#neovim nixpkgs#eza nixpkgs#fzf nixpkgs#bat nixpkgs#delta nixpkgs#ripgrep nixpkgs#nodejs nixpkgs#yazi

# Update everything
update: ai
    nix profile upgrade --all

# Pull dotfiles repo -> local machine
pull:
    git pull origin main
    cp "{{repo_fish}}" "{{local_fish}}"
    cp "{{repo_just}}" "{{local_just}}"
    @echo "Pulled repo -> local"
    exec fish

# Push local machine -> dotfiles repo
push:
    cp "{{local_fish}}" "{{repo_fish}}"
    cp "{{local_just}}" "{{repo_just}}"
    @echo "Pushed local -> repo"

# Clone all repos into ~/
repos:
    #!/usr/bin/env bash
    set -euo pipefail
    dir="$HOME"
    clone() {
        local repo="$1" dest="$2"
        if [ -d "$dir/$dest" ]; then
            echo "skip $dest (exists)"
        else
            git clone "$repo" "$dir/$dest"
        fi
    }
    clone git@github.com:dionysuzx/astronvim.git astronvim
    clone git@github.com:dionysuzx/axon.git axon
    clone git@github.com:dionysuzx/clean.git clean
    clone git@github.com:dionysuzx/dionysuz-xyz.git dionysuz-xyz
    clone git@github.com:dionysuzx/dotfiles.git dotfiles
    clone git@github.com:dionysuzx/forkcast.git forkcast
    clone git@github.com:futurekittylabs/website.git futurekittylabs-com
    clone git@github.com:futurekittylabs/homebrew-tap.git homebrew-tap
    clone git@github.com:futurekittylabs/kittynode.git kittynode
    clone git@github.com:dionysuzx/protocol-support.git octopus
    clone git@github.com:dionysuzx/resume.git resume
    clone git@github.com:dionysuzx/worktree.git worktree
