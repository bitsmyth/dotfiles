#!/usr/bin/env ruby

def install_brew
  # WIP
end

def install_source_dependencies
  system 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
end

def install_brew_depenedencies
  system "brew bundle install --file=Brewfile"
end

install_brew
install_brew_depenedencies
install_source_dependencies
