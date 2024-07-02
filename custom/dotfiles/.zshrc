# Workspace
export WORK="$HOME/Work"

# Aliases
source ~/.aliases
# End Aliases

# Bash Logger
source ~/.bash_logger.sh
# End Bash Logger

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search   # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# fzf
# ————
source $(fzf-share)/completion.zsh
source $(fzf-share)/key-bindings.zsh

# Brew
# ————
export PATH=/opt/homebrew/bin:$PATH

# Coinbase
# ————
export PATH="$HOME/.local/bin:$PATH"

# Ruby
# ————
export PATH="$HOME/.rbenv/shims:$PATH"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
eval "$(rbenv init - zsh)"

# Python
# ——————
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init -)"

# nvm
# ————
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Go
# ——
export GO111MODULE=on
export GO_LIB_PATH=$HOME/go
export PATH=$GO_LIB_PATH/bin:$PATH
export GOPATH=$GO_LIB_PATH:$WORK/go
export GOPROXY=https://gomodules.cbhq.net/,direct
export GONOSUMDB=github.cbhq.net
export GOPRIVATE=github.cbhq.net

download_go() {
  VERSION=$1
  go install "golang.org/dl/go${VERSION}@latest" && "go${VERSION}" download
}

switch_go() {
  local VERSION=$1
  # TODO: check if version exists or call download_go
  export GOROOT=$("go$1" env GOROOT)
  export PATH=${GOROOT}/bin:${PATH}
  go version
}

# Android
# ——
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_AVD_HOME="$HOME/.android/avd"
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/$(ls $ANDROID_HOME/ndk/ | sort -n -r | head -n 1)
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/cmdline-tools/tools/bin:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin"


# assume-role
# ———————————
[ -f $GO_LIB_PATH/bin/assume-role ] && eval "$($GO_LIB_PATH/bin/assume-role -init)"

# Github Token generated using https://github.cbhq.net/settings/tokens/new?description=cb-zsh&scopes=public_repo
# export HOMEBREW_GITHUB_API_TOKEN=

export MONOREPO_PATH="$WORK/repo"
source $MONOREPO_PATH/scripts/rc/rc.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jitu/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jitu/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jitu/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jitu/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(direnv hook zsh)"

## TODO: check this
export PATH="/opt/homebrew/opt/zip/bin:$PATH"

function preexec() {
  timer=$(($(date +%s)/1000000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s)/1000000))
    elapsed=$(($now-$timer))

    export RPROMPT="%F{cyan}${elapsed}ms %F{reset} "
    unset timer
  fi
}

DEV_UUID=addb0119-b901-5474-a94b-59d35bd8fa32
STAG_UUID=addb0119-b901-5474-a94b-59d35bd8fa32