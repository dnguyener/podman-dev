#!/bin/bash

podman stop dev >/dev/null 2>&1
podman rm dev >/dev/null 2>&1
toolbox create dev -i drews_dev_environment 
