# SCCP development environment

## Install tools

build-essential vim curl wget tmux heroku
zsh prezeto
rbenv ruby2.0.0 bundler
sqlite postgres

## Vagrant usage
Install VirtualBox and Vagrant.
VirtualBox - https://www.virtualbox.org
Vagrant    - https://www.vagrantup.com

Add a Ubuntu box image from Vagrantbox List.
Vagrantbox List

- http://www.vagrantbox.es
- https://atlas.hashicorp.com/boxes/search?utf8=✓&sort=&provider=&q=ubuntu+14.04

(e.g. Ubuntu14.04 - https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box)

    vagrant box add ubuntu-14.04 https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box

Clone this repository, and change directory.

    git clone https://github.com/ababup1192/sccp_dev_env.git {YOUR WORK SPACE PATH} && cd {YOUR WORK SPACE PATH}

Starts and provisions the vagrant environment.

    vagrant up

Access vagrant environment.

    vagrant ssh

Stop virtual machine.

    vagrant halt

## Tmux
Short shortcuts and cheatsheet

https://gist.github.com/MohamedAlaa/2961058
http://qiita.com/wakaba260/items/4f43e6aa3bfb8a0992ca