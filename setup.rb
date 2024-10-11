#!/usr/bin/env ruby

def install_brew
  # WIP
end

def install_source_dependencies
  system 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
  system "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k"
  system "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting"
  system "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
end

def install_brew_depenedencies
  system "brew bundle install --file=Brewfile"
end

install_brew
install_brew_depenedencies
install_source_dependencies
