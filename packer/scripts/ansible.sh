#!/usr/bin/env bash
set -u
set -e
set -x

# Install pip.
apt -y install libffi-dev python-setuptools python-dev
easy_install pip

# Install Ansible repository.
apt -y update && apt-get -y upgrade
apt -y install software-properties-common
apt-add-repository ppa:ansible/ansible

# Install Ansible.
apt -y update
apt -y install ansible
