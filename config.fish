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

    function is_lima -d 'Check if running inside the Lima VM'
        not command -q limactl
    end

    # inside the VM, save cwd so new splits can inherit it
    if is_lima
        function __save_lima_cwd --on-variable PWD
            echo $PWD > /tmp/.lima-cwd
        end
        __save_lima_cwd
    end
end

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PATH $HOME/.local/bin $PATH
set -gx CLAUDE_CODE_HIDE_ACCOUNT_INFO 1
set -gx IS_DEMO true
set -gx COLORTERM truecolor

# auto-enter lima VM if on host (not inside the VM)
if not is_lima
    set -l vm_cwd (limactl shell ubuntu -- cat /tmp/.lima-cwd 2>/dev/null)
    if test -n "$vm_cwd"
        limactl shell --workdir "$vm_cwd" --shell /usr/bin/fish ubuntu
    else
        lima
    end
end
