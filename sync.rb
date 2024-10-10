#!/usr/bin/env ruby

require "fileutils"

TIMESTAMP = Time.zone.now.strftime("%d%m%Y_%H%H%S")
EXCLUDED_FILES = [
  ".DS_Store"
]
EXCLUDED_DIRECTORIES = []

def link_configuration_files
  Dir.glob("*", File::FNM_DOTMATCH).each do |file_name|
    next if File.directory?(file_name) || file_name == "." || file_name == ".."
    next if !file_name.start_with?(".") || EXCLUDED_FILES.include?(file_name)

    file_home = File.join(ENV["HOME"], file_name)
    file_backup = File.join(ENV["HOME"], "#{file_name}.backup_#{TIMESTAMP}")
    file_repo = File.join(Dir.pwd, file_name)

    to_backup_file = if File.symlink?(file_home)
      File.readlink(file_home)
    else
      file_home
    end

    FileUtils.cp(to_backup_file, file_backup) if File.exist?(to_backup_file)
    FileUtils.ln_sf(file_repo, file_home) if File.readlink(file_home) != file_repo
  end
end

def link_configuration_directories
  config_directory = File.join(ENV["HOME"], ".config")
  config_directory_repo = File.join(Dir.pwd, ".config")

  Dir.foreach(config_directory_repo) do |directory_name|
    next if directory_name == "." || directory_name == ".."
    next if EXCLUDED_DIRECTORIES.include?(directory_name)

    directory_home = File.join(config_directory, directory_name)
    directory_backup = "#{directory_home}.backup_#{TIMESTAMP}"
    directory_repo = File.join(config_directory_repo, directory_name)

    to_backup_directory = if File.symlink?(directory_home)
      File.readlink(directory_home)
    else
      directory_home
    end

    FileUtils.cp_r(to_backup_directory, directory_backup) if Dir.exist?(to_backup_directory)
    FileUtils.ln_sf(directory_repo, directory_home) if File.readlink(directory_home) != directory_repo
  end
end

link_configuration_files
link_configuration_directories
