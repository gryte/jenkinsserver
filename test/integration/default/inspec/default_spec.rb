# wget is installed
describe package('wget') do
  it { should be_installed }
end

# jenkins.repo file exists
describe file('/etc/yum.repos.d/jenkins.repo') do
  it { should be_file }
end

# jenkins is installed
describe package('jenkins') do
  it { should be_installed }
end

# java 1.7 openjdk is installed
describe package('java-1.7.0-openjdk') do
  it { should be_installed }
end

# jenkins service is enabled and running
describe service('jenkins') do
  it { should be_installed }
  it { should be_running }
end
