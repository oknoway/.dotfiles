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

# The package iproute2mac is needed to get the current IP in use
ip=$(ip route get 8.8.8.8 || echo "ERROR")
if [ "$ip" = "ERROR" ]; then
  echo "Install iproute2mac via homebrew to run this script."
  exit 1
fi
ip="$(echo $ip | awk '{print $NF;exit}')"
echo "IP: $ip"


VBoxManage list vms | grep Win | sed 's/"\(.*\)".*/\1/' | while read name
do
  VBoxManage getextradata "$name" enumerate | grep ievms &> /dev/null
  if [ $? -eq 0 ]; then
    VBoxManage getextradata "$name" enumerate
    VBoxManage modifyvm "$name" --natdnsproxy1 off
    VBoxManage modifyvm "$name" --natdnshostresolver1 on
    #VBoxManage setextradata "$name" "VBoxInternal/Devices/e1000/0/LUN#0/Config/HostResolverMappings/mysite/HostIP" "$1"
    #VBoxManage setextradata "$name" "VBoxInternal/Devices/e1000/0/LUN#0/Config/HostResolverMappings/mysite/HostNamePattern" "$2"
    VBoxManage setextradata "$name" "VBoxInternal/Devices/e1000/0/LUN#0/Config/HostResolverMappings/mysite/HostIP" "$ip"
    VBoxManage setextradata "$name" "VBoxInternal/Devices/e1000/0/LUN#0/Config/HostResolverMappings/mysite/HostNamePattern" "local.arcgis.com"
  fi
done
