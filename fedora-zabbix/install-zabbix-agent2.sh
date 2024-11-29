#!/bin/bash

dnf update -y


dnf install -y https://repo.zabbix.com/zabbix/6.0/rhel/8/x86_64/zabbix-release-6.0-4.el8.noarch.rpm
dnf clean all
dnf install -y zabbix-agent2

sed -i 's/Server=127.0.0.1/Server=192.168.1.1/' /etc/zabbix/zabbix_agent2.conf
sed -i 's/Hostname=Zabbix server/Hostname=jirasek/' /etc/zabbix/zabbix_agent2.conf

systemctl enable zabbix-agent2
systemctl start zabbix-agent2