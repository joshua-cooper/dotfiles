set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_DESKTOP_DIR "$HOME/desktop"
set -Ux XDG_DOWNLOAD_DIR "$HOME/downloads"
set -Ux XDG_TEMPLATES_DIR "$HOME/templates"
set -Ux XDG_PUBLICSHARE_DIR "$HOME/public"
set -Ux XDG_DOCUMENTS_DIR "$HOME/documents"
set -Ux XDG_MUSIC_DIR "$HOME/music"
set -Ux XDG_PICTURES_DIR "$HOME/pictures"
set -Ux XDG_VIDEOS_DIR "$HOME/videos"

set -Ux EDITOR nvim
set -Ux VISUAL nvim
set -Ux PAGER less
set -Ux BROWSER firefox
set -Ux SUDO_EDITOR "$EDITOR"

set -Ux DOCKER_BUILDKIT 1
set -Ux MOZ_ENABLE_WAYLAND 1
set -Ux GRIM_DEFAULT_DIR "$XDG_PICTURES_DIR/screenshots"
set -Ux FZF_DEFAULT_OPTS "--height=15 --layout=reverse"
set -Ux BEMENU_OPTS "-i -l 10 --tb=#1d2021 --tf=#ebdbb2 --nb=#1d2021 --nf=#a89984 --hb=#1d2021 --hf=#ebdbb2 --fb=#1d2021 --ff=#a89984" 

set -Ux fish_user_paths "$HOME/.local/bin"
set -a fish_user_paths "$XDG_CONFIG_HOME/bin"

alias e "$EDITOR"
alias se "sudoedit"
alias cat "bat"
alias ls "exa"
alias mv "mv -iv"
alias cp "cp -iv"
alias rm "rm -v"
alias mkdir "mkdir -v"
alias tmux "tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
alias work "tmux new -ADs workspace"
alias cdt "cd (mktemp -d)"

abbr g "git"
abbr ga "git add"
abbr gb "git branch"
abbr gbd "git branch -d"
abbr gc "git commit"
abbr gco "git checkout"
abbr gd "git diff"
abbr gi "git init"
abbr gl "git log"
abbr gm "git merge"
abbr gr "git rebase"
abbr gs "git status"
abbr pi "package install"
abbr pr "package remove"
abbr pu "package update"

fish_vi_key_bindings

if type -q ssh-agent && test -z (pgrep ssh-agent)
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

if test -z "$DISPLAY" && test (tty) = "/dev/tty1" && command -q "sway"
  exec sway
end
