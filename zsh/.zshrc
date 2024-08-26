# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~


# Set to superior editing mode

set -o vi

export VISUAL=nvim
export EDITOR=nvim

export BROWSER="firefox"

# Directories

export REPOS="$HOME/Data"
export GITUSER="hello-aaronprice"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$HOME/.dotfiles"
export SCRIPTS="$DOTFILES/bin/.local/scripts"

# Go related. In general all executables and scripts go in .local/bin

export GOBIN="$HOME/.local/bin"
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
# export GOPATH="$HOME/.local/share/go"
export GOPATH="$HOME/go/"


# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~


setopt extended_glob null_glob

path=(
    $path                           # Keep existing PATH entries
    $HOME/bin
    $HOME/.local/bin
    $HOME/dotnet
    $SCRIPTS
    $DOTFILES/zsh/zsh-completions
    /usr/local/go/bin
    /home/linuxbrew/.linuxbrew/bin
)

# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH


# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~


HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions


# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~


fpath=($DOTFILES/zsh/pure $fpath)

autoload -U promptinit; promptinit

PURE_CMD_MAX_EXEC_TIME=10

zstyle :prompt:pure:git:stash show yes

prompt pure


# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~


fpath=($DOTFILES/zsh/zsh-completions/src $fpath)

source ~/.zsh_profile

export XDG_CONFIG_HOME="$HOME/.config"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
