# Devbox

```
$ brew cask install virtualbox
$ brew cask install vagrant
$ brew install packer
$ brew install ansible
$ git clone git@github.com:traintracks/devbox.git
$ cd devbox
$ packer build devbox.json
$ cd ..
$ vagrant box add devbox packer/builds/devbox.box
$ vagrant up
``` 
