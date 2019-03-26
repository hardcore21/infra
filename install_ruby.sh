#!/bin/bash

gpg --keyserver hkp://keys.gnup.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm requirements
rvm install 2.4.1
rvm use 2.4.1 --default
get install bundler -V --no-ri --no-rdoc
ruby -v
bundle -v

