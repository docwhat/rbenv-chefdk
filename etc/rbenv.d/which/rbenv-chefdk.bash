#!/usr/bin/env bash

if [[ "$RBENV_VERSION" = chef-workstation ]]; then
  if [ ! -x "$RBENV_COMMAND_PATH" ]; then
    chef_workstation_ruby_exe="/opt/chef-workstation/embedded/bin/ruby"
    chef_workstation_ruby_lib_version=$("$chef_workstation_ruby_exe" -e 'puts RbConfig::CONFIG["ruby_version"]')
    if [ -x "${HOME}/.chef-workstation/gem/ruby/${chef_workstation_ruby_lib_version}/bin/${RBENV_COMMAND}" ]; then
      RBENV_COMMAND_PATH="${HOME}/.chef-workstation/gem/ruby/${chef_workstation_ruby_lib_version}/bin/${RBENV_COMMAND}"
    elif [ -x "/opt/chef-workstation/bin/${RBENV_COMMAND}" ]; then
      RBENV_COMMAND_PATH="/opt/chef-workstation/bin/${RBENV_COMMAND}"
    elif [ -x "/opt/chef-workstation/embedded/bin/${RBENV_COMMAND}" ]; then
      RBENV_COMMAND_PATH="/opt/chef-workstation/embedded/bin/${RBENV_COMMAND}"
    elif [ -x "/opt/chef-workstation/embedded/lib/ruby/gems/${chef_workstation_ruby_lib_version}/bin/${RBENV_COMMAND}" ]; then
      RBENV_COMMAND_PATH="/opt/chef-workstation/embedded/lib/ruby/gems/${chef_workstation_ruby_lib_version}/bin/${RBENV_COMMAND}"
    fi
  fi
fi
