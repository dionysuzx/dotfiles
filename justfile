local_fish := env("HOME") / ".config/fish/config.fish"
repo_fish := justfile_directory() / "config.fish"

# Install dependencies (delta, etc.)
setup:
    brew install git-delta

# Show diff between repo (baseline) and local fish config
check:
    @if diff -q "{{repo_fish}}" "{{local_fish}}" > /dev/null 2>&1; then \
        echo "Fish config is in sync."; \
    else \
        echo "Fish config is out of sync:"; \
        delta "{{repo_fish}}" "{{local_fish}}" || true; \
    fi

# Pull repo fish config to local machine
pull:
    cp "{{repo_fish}}" "{{local_fish}}"
    @echo "Pulled repo -> local"

# Push local fish config to repo
push:
    cp "{{local_fish}}" "{{repo_fish}}"
    @echo "Pushed local -> repo"
