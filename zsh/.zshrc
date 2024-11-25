# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~


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

# Go

export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"


# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~


setopt extended_glob null_glob

path=(
    $path                           # Keep existing PATH entries
    $HOME/bin
    $HOME/.local/bin
    $HOME/dotnet
    $SCRIPTS
    $DOTFILES/zsh/zsh-completions
    $GOPATH
    $GOBIN
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


source /home/linuxbrew/.linuxbrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ~~~~~~~~~~~~~~~ JavaScript ~~~~~~~~~~~~~~~~~~~~~~~~


# pnpm
export PNPM_HOME="/home/aaron/.dotfiles/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
. "/home/aaron/.deno/env"


# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~


fpath=($DOTFILES/zsh/zsh-completions/src $fpath)

source ~/.zsh_profile

export XDG_CONFIG_HOME="$HOME/.config"
# This is not the best idea
export XDG_DATA_HOME="$DOTFILES/.local/share"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Turso
export PATH="$PATH:/home/aaron/.turso"
