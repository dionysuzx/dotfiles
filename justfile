local_fish := env("HOME") / ".config/fish/config.fish"
repo_fish := justfile_directory() / "config.fish"

# Install dependencies (delta, etc.)
setup:
    nix profile add nixpkgs#neovim nixpkgs#eza nixpkgs#fzf nixpkgs#bat nixpkgs#delta nixpkgs#ripgrep nixpkgs#nodejs

# Show diff between repo (baseline) and local fish config
check:
    @if diff -q "{{repo_fish}}" "{{local_fish}}" > /dev/null 2>&1; then \
        echo "Fish config is in sync."; \
    else \
        echo "Fish config is out of sync:"; \
        echo "  left = dotfiles (repo)"; \
        echo "  right = local (machine)"; \
        echo ""; \
        delta --side-by-side "{{repo_fish}}" "{{local_fish}}" || true; \
    fi

# Pull repo fish config to local machine
pull:
    cp "{{repo_fish}}" "{{local_fish}}"
    @echo "Pulled repo -> local"

# Push local fish config to repo
push:
    cp "{{local_fish}}" "{{repo_fish}}"
    @echo "Pushed local -> repo"

# Clone all repos into ~/fun
pull-repos:
    #!/usr/bin/env bash
    set -euo pipefail
    dir="$HOME/fun"
    clone() {
        local repo="$1" dest="$2"
        if [ -d "$dir/$dest" ]; then
            echo "skip $dest (exists)"
        else
            git clone "$repo" "$dir/$dest"
        fi
    }
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
