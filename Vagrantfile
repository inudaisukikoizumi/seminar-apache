# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'lucid64-lamp'
  config.vm.box_url = 'https://dl.dropbox.com/u/14741389/vagrantboxes/lucid64-lamp.box'

  config.vm.network :private_network, ip: '10.10.10.10'
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    # vb.gui = true

    vb.customize [
      'modifyvm', :id,
      '--memory', [ENV['APACHE_VM_MEM'].to_i, 1024].max,
      '--cpus', [ENV['APACHE_VM_CPUS'].to_i, 1].max
    ]
  end

  config.vm.provision :shell, path: 'setup/application.sh'
  cmd = <<-CMD
    su -c 'bash -x /vagrant/setup/server.sh' vagrant
  CMD
  config.vm.provision :shell, inline: cmd

  config.vm.synced_folder './', '/vagrant'
end
