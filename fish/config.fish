alias bat='batcat'
alias ls='exa'
alias tree='exa -T'
alias less='batcat'

if status is-interactive
    # Commands to run in interactive sessions can go here
    # Set editor to neovim
    # Custom settings for "tide" theme
    set --global fish_greeting


    # Cursor settings
    set fish_cursor line
    set fish_cursor_default line
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore

    # Abbreviations
    # Editor
    abbr --add n nvim
    abbr --add se sudoedit

    # Exa
    abbr --add ll ls -l
    abbr --add la ls -la
    abbr --add lt ls -T

    # Git
    abbr --add gf git fetch
    abbr --add gp git pull
    abbr --add gP git push
    abbr --add gs git status
    abbr --add gc git commit
    abbr --add gcm --set-cursor 'git commit -m "%'
    abbr --add gd git diff
    abbr --add gds git diff --staged
    abbr --add ga git add
    abbr --add gr git restore
    abbr --add grs git restore --staged
    abbr --add gl git log
    abbr --add gl lazygit

    # Single
    abbr --add l exa
    abbr --add t tmux
    abbr --add n nvim
    abbr --add f fzf
    abbr --add c cat
    abbr --add c cat

    function matrix
      commandline "cmatrix -rb"
      commandline -f execute
    end
    bind \cd matrix

    function toggle_alacritty_transparent
      commandline "node ~/Scripts/zorin/alacrittyToggleOpacity.js"
      commandline -f execute
      commandline -f clear-screen
    end
    bind \ed toggle_alacritty_transparent

    function increase_opacity
      commandline "node ~/Scripts/zorin/alacrittyIncreaseOpacity.js"
      commandline -f execute
      commandline -f clear-screen
    end
    bind \e= increase_opacity

    function decrease_opacity
      commandline "node ~/Scripts/zorin/alacrittyDecreaseOpacity.js"
      commandline -f execute
      commandline -f clear-screen
    end
    bind \e- decrease_opacity

    function random_opacity
      commandline "node ~/Scripts/zorin/alacrittyRandomTheme.js"
      commandline -f execute
      commandline -f clear-screen
    end
    bind \et random_opacity
end

alias l='exa'
alias t='tmux'
alias n='nvim'
alias f='fzf'
alias b='bat'

set PATH ~/.local/bin $PATH

# ⋊>
set --global --export EDITOR nvim
set fzf_history_time_format %d-%m-%y
set fzf_directory_opts --bind "enter:execute($EDITOR {} &>/dev/tty)"
set --universal nvm_default_version v20
set --universal nvm_default_packages prettier typescript eslint

set -Ux fifc_editor $EDITOR 

set --global --export FZF_DEFAULT_OPTS "\
--color=fg:#f8f8f2,fg+:#d0d0d0,bg+:#262626 \
--color=hl:#bd93f9,hl+:#5fd7ff,info:#ffb86c,marker:#ff79c6 \
--color=prompt:#50fa7b,spinner:#ffb86c,pointer:#ff79c6,header:#6272a4 \
--color=border:#34414f,label:#aeaeae,query:#d9d9d9 \
--border='rounded' --border-label='' --preview-window='border-rounded' --prompt='> ' \
--marker='>' --pointer='◆' --separator='─' --scrollbar='' \
--height 35% --layout=reverse --border --preview-window=70%"

# set --global --export FZF_DEFAULT_OPTS "\
# --color=fg:#f8f8f2,fg+:#d0d0d0,bg:#282a36,bg+:#262626 \
# --color=hl:#bd93f9,hl+:#5fd7ff,info:#ffb86c,marker:#ff79c6 \
# --color=prompt:#50fa7b,spinner:#ffb86c,pointer:#ff79c6,header:#6272a4 \
# --color=border:#cccccc,label:#aeaeae,query:#d9d9d9 \
# --border='rounded' --border-label='' --preview-window='border-rounded' --prompt='> ' \
# --marker='>' --pointer='◆' --separator='─' --scrollbar='' \
# --height 35% --layout=reverse --border"

bind \cH backward-kill-word
bind \e\[3\;5~ kill-word
bind -k nul complete
bind \ck end-of-line backward-kill-line
bind \cw delete-or-exit
bind \ce _fzf_search_directory
bind \cv fish_clipboard_paste
bind \ev '_fzf_search_variables (set --show | psub) (set --names | psub)'
# bind --preset ' ' self-insert expand-abbr
# bind \t expand-abbr complete _fifc
# bind \c\r complete
# bind \t accept-autosuggestion
bind \x20 self-insert
bind \cX cancel-commandline
bind -k nul _fifc
bind \t expand-abbr forward-bigword 

bind \cC fish_clipboard_copy
bind \cc fish_clipboard_copy
bind \cx cancel-commandline
bind \cX cancel-commandline

export TERM=screen-256color

zoxide init fish | source
starship init fish | source


