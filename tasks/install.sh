#!/bin/bash
dnf install epel-release -y
dnf clean all
dnf update -y
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

dnf install sshpass docker-ce --nobest python3 python3-virtualenv gcc git cmake make gcc vim curl libnsl -y

pip3 install --upgrade pip setuptools
pip3 install --ignore-installed PyYAML
pip3 install -r /vagrant/tasks/files/requirements.txt
systemctl start docker
systemctl enable docker
usermod -G docker vagrant
cp /vagrant/tasks/files/motd.sh /etc/profile.d/
