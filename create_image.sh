#!/bin/bash

container=$(buildah from fedora-toolbox:36)
apps="neovim python2.7 python3.6 git jq bat gcc gcc-c++ zsh starship"

buildah run $container yum -y update
buildah run $container yum -y install $apps
buildah run $container dnf clean all
buildah run $container rm -rf /var/cache/yum
             
buildah run $container curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
buildah run $container install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

buildah commit --format docker $container drews_dev_environment:latest
