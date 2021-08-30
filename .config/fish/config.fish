bass source /etc/profile
# BS Cleanup
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

### Set Bat as the Manpager
set fish_greeting
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set TERMINAL "alacritty"
set BROWSER "firefox"
set EDITOR "nvim"
set VISUAL "nvim"
export YTFZF_PLAYER="devour mpv"
# Aliases
alias nano=nvim
alias l='lsd'
alias steam='steam -noverifyfiles'
alias sxiv='devour sxiv'
alias feh='devour feh'
alias zathura='devour zathura'
alias nvim='nvim -u ~/.config/nvim/.init.vim'
alias update='doas su -lc "emerge --sync && emerge --update --newuse --changed-use --deep --with-bdeps=y @world"'
alias config='/usr/bin/git --git-dir=/home/xavier/Git/Dotfiles --work-tree=$HOME'
# Path Exportation
set PATH "/home/xavier/.local/bin/AppImages:$PATH"
set PATH "/home/xavier/.local/bin:$PATH"

fish_vi_key_bindings
starship init fish | source
