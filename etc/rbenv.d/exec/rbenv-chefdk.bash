#!/usr/bin/env bash

if [[ "$RBENV_VERSION" = chefdk ]]; then
  eval "$(/opt/chefdk/bin/chef shell-init sh)"
fi
