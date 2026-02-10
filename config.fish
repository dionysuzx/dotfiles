if status is-interactive
    alias vim "nvim"
    alias x "exit"
    alias dc "cd"
    alias ls "eza --group-directories-first -l"
    alias cx "codex"
    alias cc "claude"
    alias gemini "gemini --yolo"
    alias sonnet "claude --model sonnet"
    alias haiku "claude --model haiku"
    alias agents "vim ~/.codex/AGENTS.md" 
    alias wt "worktree"
    alias zed "zed"
    alias config "vim ~/.config/fish/config.fish"
    alias ghost "vim ~/.config/ghostty/config"
    alias reload "source ~/.config/fish/config.fish"
    alias fvim "fzf --bind 'enter:become(nvim {})'"
    alias fbat "fzf --bind 'enter:become(bat {})'"
    alias lima "limactl shell --shell /usr/bin/fish ubuntu"
    alias notes "vim ~/notes"
    alias gui "gitui"
    alias axonup "cargo install --path /Users/lucy/fun/axon"

    # copy files/directories to the lima ubuntu VM's home directory
    function limacopy
        limactl copy -r $argv ubuntu:/home/lucy.linux/
    end
end

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PATH $HOME/.local/bin $PATH
set -gx LIMA_WORKDIR /home/lucy.linux
set -gx CLAUDE_CODE_HIDE_ACCOUNT_INFO 1
set -gx IS_DEMO true

# auto-enter lima VM if on host (not inside the VM)
if command -q limactl
    lima
end
