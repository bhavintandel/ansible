#!/bin/bash

# download in /opt folder
cd /opt/ && wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm

# unpack it
rpm -ivh epel-release-latest-6.noarch.rpm
