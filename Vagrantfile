Vagrant.configure("2") do |config|
  config.vm.box = "bobfraser1/alpine312"
  config.vm.hostname = "router"
  config.vm.network "private_network", ip: "192.168.1.2", name: "vboxnet1"
  config.vm.provision "shell", path: "scripts/iptables.sh", env: { "PUBLIC_NET" => "eth0", "PRIVATE_NET" => "eth1" }
  config.vm.provision "shell", path: "scripts/dnsmasq.sh", reboot: true, env: { "INTERFACE" => "eth1", "DOMAIN" => "example.com", "DHCP_RANGE" => "192.168.1.100,192.168.1.254,12h" }
  config.vm.provider "virtualbox" do |v|
    v.name = "router"
  end
end
