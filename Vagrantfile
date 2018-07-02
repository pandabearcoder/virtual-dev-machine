ENV["LC_ALL"] = "en_US.UTF-8"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "ubuntu"
  config.vm.network :forwarded_port, guest: 80, host: 8931, auto_correct: true
  config.vm.synced_folder "~/projects", "/opt/projects", create: true

  config.vm.provider "virtualbox" do |v|
    v.name = "PyDev - Ubuntu16.04"
    v.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.vm.provision "shell", path: "provision/setup.sh"

  config.trigger.after :up do |trigger|
    trigger.info = "IP Address"
    trigger.run_remote = {inline: "hostname -I | cut -d' ' -f2"}
  end
end
