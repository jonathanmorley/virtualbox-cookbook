describe package('VirtualBox-4.3') do
  it { should be_installed }
end

describe command('vboxmanage --version') do
  its('stdout') { should match /4.3/ }
  its('stdout') { should_not match /WARNING: The vboxdrv kernel module is not loaded./ }
end
