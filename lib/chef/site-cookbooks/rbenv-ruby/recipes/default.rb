#
# Cookbook Name:: rbenv-ruby
# Recipe:: default
#
# Copyright 2013, Hayato OKUMOTO
#
# All rights reserved - Do Not Redistribute
#

git '/usr/local/rbenv' do
  repository 'git://github.com/sstephenson/rbenv.git'
  reference 'master'
  action :sync
end

%w{/usr/local/rbenv/shims /usr/local/rbenv/versions}.each do |dir|
  directory dir do
    action :create
  end
end

git '/usr/local/ruby-build' do
  repository 'git://github.com/sstephenson/ruby-build.git'
  reference 'master'
  action :sync
end

bash 'install_ruby_build' do
  cwd '/usr/local/ruby-build'
  code <<-CMD
    ./install.sh
  CMD
end

template 'rbenv.sh' do
  source 'rbenv.sh.erb'
  path '/etc/profile.d/rbenv.sh'
  owner 'root'
  group 'root'
  mode '0644'
end

ruby_block 'initialize_rbenv' do
  block do
    ENV['RBENV_ROOT'] = "/usr/local/rbenv"
    ENV['PATH'] = "/usr/local/rbenv/bin:#{ENV['PATH']}"
  end
end

%w{make gcc gcc-c++ zlib-devel openssl-devel readline-devel ncurses-devel gdbm-devel db4-devel libffi-devel libyaml-devel}.each do |pkg|
  yum_package pkg do
    action :install
  end
end

execute 'rbenv install' do
  command "rbenv install #{node['rbenv-ruby']['ruby-version']}"
  action :run
  not_if { ::File.exists?("/usr/local/rbenv/versions/#{node['rbenv-ruby']['ruby-version']}") }
end

execute 'rbenv global' do
  command "rbenv global #{node['rbenv-ruby']['ruby-version']}"
  action :run
end

execute 'rbenv rehash' do
  command 'rbenv rehash'
  action :run
end

node['rbenv-ruby']['gems'].each do |gem|
  gem_package gem do
    gem_binary '/usr/local/rbenv/shims/gem'
    action :install
  end
end

execute 'rbenv rehash' do
  command 'rbenv rehash'
  action :run
end