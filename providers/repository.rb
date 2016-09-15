use_inline_resources if defined?(:use_inline_resources)

def whyrun_supported?
  true
end

action :create do
  if @current_resource.exists
    Chef::Log.info "#{@new_resource} already exists - nothing to do."
  else
    converge_by("Create #{@new_resource}") do
      dir = expand_directory_path(@new_resource.directory, @new_resource.user)
      create_repository(dir)
    end
  end
end

action :delete do
  if @current_resource.exists
    converge_by("Delete #{@new_resource}") do
      dir = expand_directory_path(@new_resource.directory, @new_resource.user)
      delete_repository(dir)
    end
  else
    Chef::Log.info "#{@current_resource} doesn't exist - can't delete."
  end
end

def load_current_resource
  directory = expand_directory_path(@new_resource.directory, @new_resource.user)
  @current_resource = Chef::Resource::PantryRepository.new(@new_resource.name)
  @current_resource.name(@new_resource.name)
  @current_resource.group(@new_resource.group)
  @current_resource.repository(@new_resource.repository)
  @current_resource.user(@new_resource.user)
  @current_resource.directory(directory)
  @current_resource.exists = repository_exists?(@current_resource.directory)
end

def create_repository(dir)
  subdirectories(dir).each do |subdirectory|
    directory subdirectory do
      action :create
      user new_resource.user
      group new_resource.group
      recursive true
    end
  end

  git dir do
    action :checkout
    group new_resource.group
    repository new_resource.repository
    revision 'master'
    user new_resource.user
  end

  execute "checkout master on #{dir}" do
    command 'git checkout master'
    cwd     dir
    user    new_resource.user
    group   new_resource.group
  end
end

def delete_repository(dir)
  directory dir do
    action :delete
    recursive true
    only_if { repository_exists?(dir) }
  end
end

def repository_exists?(path)
  Chef::Log.debug "Checking to see if this repository exists at path: '#{ path }'"
  ::File.directory?("#{path}/.git")
end

def subdirectories(dir)
  directories = []
  dir.split('/').each_with_index do |value, index|
    next if index == 0
    if index == 1
      directories.push(value)
      next
    end

    subdirectory = [directories.last, value].join('/')
    directories.push(subdirectory)
  end

  return directories.reject { |subdirectory| ::File.directory?(subdirectory) }
end

def expand_directory_path(path, machine_user)
  home_dir = ENV['HOME']
  ENV['HOME'] = Dir.home(machine_user)
  destination = ::File.expand_path(path)
  ENV['HOME'] = home_dir

  return destination
end
