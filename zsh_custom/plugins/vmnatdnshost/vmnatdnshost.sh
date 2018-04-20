#!/usr/bin/env bash

VBoxManage --version &> /dev/null

if [ $? -ne 0 ]; then
  echo "Did you install VirtualBox?"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Turn on VirtualBox DNS Host Resolver. Set custom IP/Name Patterns.";
  echo "Usage:";
  echo "    vmnatdnshost IP HostNamePattern";
fi

VBoxManage list vms | grep Win | sed 's/"\(.*\)".*/\1/' | while read name
do
  VBoxManage getextradata "$name" enumerate | grep ievms &> /dev/null
  if [ $? -eq 0 ]; then
    VBoxManage getextradata "$name" enumerate
    VBoxManage modifyvm "$name" --natdnsproxy1 off
    VBoxManage modifyvm "$name" --natdnshostresolver1 on
    #VBoxManage setextradata "$name" "VBoxInternal/Devices/e1000/0/LUN#0/Config/HostResolverMappings/mysite/HostIP" "$1"
    #VBoxManage setextradata "$name" "VBoxInternal/Devices/e1000/0/LUN#0/Config/HostResolverMappings/mysite/HostNamePattern" "$2"
    VBoxManage setextradata "$name" "VBoxInternal/Devices/e1000/0/LUN#0/Config/HostResolverMappings/mysite/HostIP" "10.195.27.179"
    #VBoxManage setextradata "$name" "VBoxInternal/Devices/e1000/0/LUN#0/Config/HostResolverMappings/mysite/HostIP" "10.0.1.45"
    VBoxManage setextradata "$name" "VBoxInternal/Devices/e1000/0/LUN#0/Config/HostResolverMappings/mysite/HostNamePattern" "local.arcgis.com"
  fi
done
