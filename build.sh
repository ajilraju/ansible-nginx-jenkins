#!/bin/bash

command ansible --version

if [ "$?" -ne 0 ]; then
    echo "Ansible is not installed"
    exit 1
else
    command ansible-playbook deploy.yaml --syntax-check
    if [ "$?" -ne 0 ]; then
        echo "Got some syntax error on the playbook."
        exit 1
    else
        command ansible-playbook deploy.yaml --private-key ${private_key}
    fi
fi
