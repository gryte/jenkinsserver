#
# Cookbook Name:: jenkinsserver
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# install wget
package 'wget' do
  action :install
end

# download nux-dextop rpm
remote_file 'jenkinsrepo_download' do
  not_if { ::File.exist?('/etc/yum.repos.d/jenkins.repo') }
  path '/etc/yum.repos.d/jenkins.repo'
  source 'http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo'
end

# import jenkins repo
execute 'jenkinsrepo_import' do
  command 'rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key'
end

# install jenkins
package 'jenkins' do
  action :install
end

# install java 1.7 OpenJDK
package 'java-1.7.0-openjdk' do
  action :install
end

# jenkins service
service 'jenkins' do
  action [:enable, :start]
end
