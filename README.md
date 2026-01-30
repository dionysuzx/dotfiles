# dotfiles
Hello there! I believe that small choices in daily tools compound into big gains over time. These are tools that I love. Here is my [flake.nix](./flake.nix) and [macOS setup](mac-setup.md).

### Editors & Terminal
- **neovim** - text manipulation (see [here](https://github.com/dionysuzx/astronvim) for astronvim config)
- **claude, codex** - local ai
- **ghostty** - terminal / multiplexer / code editor
- **fish** - shell
- **jetbrains mono** - font

### Package Managers & Utils
- **nix** - primary package manager
- **homebrew** - secondary package manager on macOS

### Keyboard
- **apple magic keyboard** - keyboard
- **karabiner elements** - keyboard configurator

### Other must haves
- **amphetamine** - keeps computer awake (see [here](https://github.com/x74353/Amphetamine-Power-Protect/issues/6#issuecomment-3747401635) for standard/admin setup)
- **vimium** - move around the browser
- **tailscale** - easy wireguard vpn
- **stats** - monitor system
- **lima vm** - vm isolation

### GNU/Linux things
- **fd** - find
- **fzf** - fuzzy finder
- **bat** - cat + less
- **delta** - file differ
- **ripgrep** - fast grep
- **eza** - ls

### Misc
```
limactl create --name=ubuntu ./lima.yaml
infocmp -x xterm-ghostty | limactl shell ubuntu tic -x -
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
nix profile add nixpkgs#neovim nixpkgs#eza nixpkgs#fzf nixpkgs#bat nixpkgs#delta nixpkgs#ripgrep nixpkgs#nodejs
sudo apt update && sudo apt install -y fish
```
- install claude code
- install codex
