autoload -U compinit promptinit
compinit
promptinit; prompt gentoo

zstyle ':completion::complete:*' use-cache 1

# create a zkbd compatible hash;
# # to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	 	autoload -Uz add-zle-hook-widget
 		function zle_application_mode_start { echoti smkx }
 		function zle_application_mode_stop { echoti rmkx }
 		add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
 		add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
# Clean up some BS
export ZDOTDIR="$HOME/.config/zsh"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
# Settings Defaults
export EDITOR="emacs"
export TERMINAL="kitty"
export BROWSER="firefox"

# Aliases
alias nano=nvim
alias nvim='nvim -u /home/xavier/.config/nvim/.init.vim'
alias l='lsd -lA'
alias steam='steam -noverifyfiles'
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100
setopt autocd
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/xavier/.zshrc'
export PATH="/home/xavier/.local/bin/AppImages:$PATH"
export PATH="/home/xavier/.local/bin:$PATH"
export PATH="/home/xavier/.builds/pidswallow-2.0:$PATH"
autoload -Uz promptinit
promptinit
prompt gentoo
autoload -U compinit
compinit
if [ "$TERM" = "linux" ]; then
         printf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
         printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
         printf %b '\e]P0282a36'    # redefine 'black'          as 'dracula-bg'
         printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
         printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
         printf %b '\e]P9ff7777'    # redefine 'bright-red'     as '#ff7777'
         printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
         printf %b '\e]PA70fa9b'    # redefine 'bright-green'   as '#70fa9b'
         printf %b '\e]P3f1fa8c'    # redefine 'brown'          as 'dracula-yellow'
         printf %b '\e]PBffb86c'    # redefine 'bright-brown'   as 'dracula-orange'
         printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-purple'
         printf %b '\e]PCcfa9ff'    # redefine 'bright-blue'    as '#cfa9ff'
         printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-pink'
         printf %b '\e]PDff88e8'    # redefine 'bright-magenta' as '#ff88e8'
         printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
         printf %b '\e]PE97e2ff'    # redefine 'bright-cyan'    as '#97e2ff'
         printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-fg'
         printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
         clear
 fi
source ~/.zplug/init.zsh
zplug "dracula/zsh",as:theme
zplug load
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
eval "$(starship init zsh)"
