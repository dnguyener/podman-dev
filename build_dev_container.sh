#!/bin/bash

container=$(buildah from fedora-toolbox:37)
apps="neovim python2.7 python3.6 git"

buildah run $container  yum -y install $apps

buildah commit --format docker $container drews_dev_environment:latest
