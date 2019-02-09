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
brew cask install iterm2
brew install tree

# cask
brew tap caskroom/cask

# Unix
brew install "git"
brew install "openssl"
brew install "vim"
brew install "watchman"

# GitHub
brew install "hub"

# Tools
brew cask install visual-studio-code

# Communication
brew cask install skype
brew cask install slack

# Programming language prerequisites and package managers
brew install "libyaml"
brew install "coreutils"
brew install "yarn"
brew cask install "gpg-suite"


fancy_echo 'All done!'

