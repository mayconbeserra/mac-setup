# Welcome to MB laptop script!
# Be prepared to turn your laptop (or desktop)
# into an awesome development machine.

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

append_to_file() {
  local file="$1"
  local text="$2"

  if ! grep -qs "^$text$" "$file"; then
    printf "\n%s\n" "$text" >> "$file"
  fi
}

create_zshrc_and_set_it_as_shell_file() {
  if [ ! -f "$HOME/.zshrc" ]; then
    touch "$HOME/.zshrc"
  fi
  shell_file="$HOME/.zshrc"
}

# Install Homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if [ ! -d "$HOME/.bin/" ]; then
  mkdir "$HOME/.bin"
fi


# create config file
create_zshrc_and_set_it_as_shell_file

# brew
brew update

# install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# update zsh config
append_to_file "$shell_file" 'export PATH="$HOME/.bin:$PATH"'
append_to_file "$shell_file" 'export ZSH="$HOME/.oh-my-zsh"'
append_to_file "$shell_file" 'ZSH_THEME="robbyrussell"'
append_to_file "$shell_file" 'source $ZSH/oh-my-zsh.sh'

# cool bash
brew install --cask iterm2
brew install tree

# cask
brew tap homebrew/cask

# Unix
brew install "git"
brew install "openssl"
brew install "vim"
brew install "watchman"

# iTerm stuff
brew install zsh-syntax-highlighting
brew install zsh-completions

# GitHub
brew install "hub"

# Tools
brew install --cask visual-studio-code
brew install --cask azure-data-studio
brew install --cask postman
brew install --cask firefox
brew install --cask docker
brew install --cask timeular
brew install --cask keepassxc
brew install --cask drawio

# Communication
brew install --cask skype
brew install --cask slack

# Programming language prerequisites and package managers
brew install "libyaml"
brew install "coreutils"
brew install "yarn"
brew install --cask "gpg-suite"


fancy_echo 'All done!'

