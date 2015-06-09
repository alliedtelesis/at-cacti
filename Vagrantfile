# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "chef/centos-7.1"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
  
     # Customize the amount of memory on the VM:
     vb.memory = "1024"
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo yum -y update
    sudo yum -y install httpd httpd-devel mariadb-server wget
    sudo yum -y install php-mysql php-pear php-common php-gd php-devel php php-mbstring php-cli
    sudo yum -y install php-snmp net-snmp-utils net-snmp-libs rrdtool
    sudo systemctl start httpd.service
    sudo systemctl start mariadb.service
    sudo systemctl start snmpd.service
    sudo systemctl enable httpd.service
    sudo systemctl enable mariadb.service
    sudo systemctl enable snmpd.service
    sudo wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
    sudo rpm -ivh epel-release-7-5.noarch.rpm
    sudo yum -y install cacti
    sudo mysqladmin -u root password vagrant
    sudo mysql -u root -pvagrant -e "create database cacti"
    sudo mysql -u root -pvagrant -e "GRANT ALL ON cacti.* TO cactiuser@localhost IDENTIFIED BY 'cactiuser'"
    sudo mysql -u root -pvagrant -e "FLUSH privileges"
    sudo mysql -u cactiuser -pcactiuser cacti < $(rpm -ql cacti | grep cacti.sql)
    sudo sed -i 's/Require host localhost/Require all granted/g' /etc/httpd/conf.d/cacti.conf
    sudo sed -i 's/Allow from localhost/Allow from all/g' /etc/httpd/conf.d/cacti.conf
    sudo systemctl restart httpd.service
    sudo sudo sed -i 's/^#//' /etc/cron.d/cacti
  SHELL
end
