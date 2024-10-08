#!/usr/bin/env ruby

require "fileutils"

TIMESTAMP = Time.now.strftime("%d%m%Y_%H%H%S")


def install_dependencies
  system "brew bundle install --file=Brewfile"
  system 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
  system "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" 
end

def link_configuration_files
  excluded_files = [
    ".DS_Store"
  ]

  Dir.glob("*", File::FNM_DOTMATCH).each do |file_name|
    next if File.directory?(file_name) || file_name == "." || file_name == ".."
    next if !file_name.start_with?(".") || excluded_files.include?(file_name)

    file = File.join(ENV["HOME"], file_name)
    file_backup = File.join(ENV["HOME"], "#{file_name}.backup_#{TIMESTAMP}")
    file_repo = File.join(Dir.pwd, file_name)

    if File.exist?(file)
      FileUtils.mv(file, file_backup)
    end

    FileUtils.ln_sf(file_repo, file)
  end
end

def link_configuration_directories
  config_directory = File.join(ENV["HOME"], ".config")
  config_directory_repo = File.join(Dir.pwd, ".config")

  Dir.foreach(config_directory_repo) do |directory|
    next if directory == "." || directory == ".."

    current_directory = File.join(config_directory, directory)
    current_directory_repo = File.join(config_directory_repo, directory)

    if Dir.exist?(current_directory)
      FileUtils.mv(current_directory, "#{current_directory}.backup_#{TIMESTAMP}")
    end

    FileUtils.ln_sf(current_directory_repo, current_directory)
  end
end

link_configuration_files
link_configuration_directories