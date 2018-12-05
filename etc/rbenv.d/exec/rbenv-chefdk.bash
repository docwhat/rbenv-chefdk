#!/usr/bin/env bash

if [[ "$RBENV_VERSION" = chef-workstation ]]; then
  eval "$(/opt/chef-workstation/bin/chef shell-init sh)"
fi
