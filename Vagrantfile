VAGRANT_BOX = 'bobfraser1/alpine315'
VM_HOSTNAME = 'router'
VM_NETWORK = 'vboxnet1'
VM_IP = '192.168.60.2'
VM_MEMORY = '2048'
VM_CPUS = '2'
PUBLIC_NET = 'eth0'
PRIVATE_NET = 'eth1'
INTERFACE = 'eth1'
DOMAIN = 'example.com'
DHCP_RANGE = '192.168.60.100,192.168.60.254,12h'

Vagrant.configure('2') do |config|
  config.vm.box = VAGRANT_BOX
  config.vm.hostname = VM_HOSTNAME
  config.vm.network 'private_network', name: VM_NETWORK, ip: VM_IP
  config.vm.provision 'shell',
                      path: 'scripts/iptables.sh',
                      env: {
                        'PUBLIC_NET' => PUBLIC_NET,
                        'PRIVATE_NET' => PRIVATE_NET
                      }
  config.vm.provision 'shell',
                      path: 'scripts/dnsmasq.sh',
                      env: {
                        'INTERFACE' => INTERFACE,
                        'DOMAIN' => DOMAIN,
                        'DHCP_RANGE' => DHCP_RANGE
                      }
  config.vm.provision 'shell', path: 'scripts/dhcp-hosts.sh'
  config.vm.provider 'virtualbox' do |vm|
    vm.name = VM_HOSTNAME
    vm.memory = VM_MEMORY
    vm.cpus = VM_CPUS
  end
end
