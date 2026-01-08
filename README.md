# dotfiles
Hello there! I believe that small choices in daily tools compound into big gains over time. These are tools that I love. Here is my [flake.nix](./flake.nix) and [macOS setup](mac-setup.md).

### Editors & Terminal
- **neovim** - text manipulation
- **claude, codex** - local ai
- **zed** - file explorer
- **ghostty** - terminal / multiplexer / code editor
- **fish** - shell
- **monaspace argon** - font

### Package Managers & Utils
- **nix** - primary package manager
- **homebrew** - secondary package manager on macOS

### Keyboard
- **apple magic keyboard** - keyboard
- **karabiner elements** - keyboard configurator

### Other must haves
- **amphetamine** - keeps computer awake
- **vimium** - move around the browser
- **tailscale** - easy wireguard vpn
- **stats** - monitor system
- **lima vm (may switch to vmware fusion)** - vm isolation

### GNU/Linux things
- **fzf** - fuzzy finder
- **bat** - cat + less
- **delta** - file differ
- **ripgrep** - fast grep
- **eza** - ls

### Misc
- [nixos-lima](https://github.com/nixos-lima/nixos-lima)
```
infocmp -x xterm-ghostty | limactl shell nixos tic -x -
```
