# Netboot Service

## Overview

This Docker service provides a bootable network server; this allows you to
install operating systems on new machines (including Virtual Machines).

## DHCP Server Configuration

There are two properties you need to set on your DHCP server for network
booting work.

* ```066 Boot Server Host Name``` - this can be the hostname or IP address of your Bootable Network Server (in our case the hostname or IP of the Docker machine).
* ```067 Bootfile Name``` - this is the name of the network boot image; in our case it should be set to ```netboot.xyz.kpxe```. 

### Windows DHCP Configuration

If you use Windows DHCP you can configure the two settings using the DHCP Manager;
they can be found under your scope under 'Scope Options'.

![Windows DHCP Scope Options Dialog](https://github.com/dhmuir/docker/raw/master/services/netboot/images/Windows-AD-DHCP.png "Windows DHCP Scope Options Dialog")

Right-click in the window and select ```Configure Options```.
