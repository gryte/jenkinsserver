# wget is installed
describe package('wget') do
  it { should be_installed }
end

# jenkins.repo is installed
describe package('jenkins.repo') do
  it { should be_installed }
end

# jenkins.repo file exists
describe file('/etc/yum.repos.d/jenkins.repo') do
  it { should be_file }
end

# jenkinsis installed
describe package('jenkins') do
  it { should be_installed }
end
