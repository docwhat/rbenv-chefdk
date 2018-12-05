#!/usr/bin/env bash


if [ -d "${RBENV_ROOT}/versions/chef-workstation" ]; then
  chef_workstation_ruby_exe="/opt/chef-workstation/embedded/bin/ruby"
  chef_workstation_ruby_lib_version=$("$chef_workstation_ruby_exe" -e 'puts RbConfig::CONFIG["ruby_version"]')

  make_shims "${HOME}/.chef-workstation/gem/ruby/${chef_workstation_ruby_lib_version}/bin/"*
  make_shims /opt/chef-workstation/bin/*
  make_shims "/opt/chef-workstation/embedded/lib/ruby/gems/${chef_workstation_ruby_lib_version}/bin/"*

  make_shims ruby
  for i in /opt/chef-workstation/embedded/bin/*; do
    if grep -qE '#!/opt/chef-workstation/embedded/bin/ruby' "$i"; then
      make_shims "$i"
    fi
  done
fi
