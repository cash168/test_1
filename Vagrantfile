# -*- mode: ruby -*-    
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"
  config.ssh.forward_agent = true
  config.ssh.insert_key = false
  config.hostmanager.enabled = true

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  (1..6).each do |i|
    config.vm.define "server-#{i}" do |config|

      config.vm.provider "virtualbox" do |vb|
        # Customize the amount of memory on the VM.
        vb.memory = "512"
      end

      config.vm.hostname = "server-#{i}"
      config.vm.network :private_network, ip: "172.21.12.#{100+i}"
      config.vm.provision :shell,
      privileged: true,
      inline: <<-SHELL
        cat /etc/os-release
        cd /tmp
        export DEBIAN_FRONTEND=noninteractive
        chown -R _apt /var/lib/apt
        chown -R _apt /var/lib/update-notifier
        apt-get update && sudo apt-get install -yq python python-apt nginx
        cp /home/vagrant/.ssh/authorized_keys /root/.ssh/
        echo ">> All done."
      SHELL
    end
  end

end
