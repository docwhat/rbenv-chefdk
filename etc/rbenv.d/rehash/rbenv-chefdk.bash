#!/usr/bin/env bash


if [ -d "${RBENV_ROOT}/versions/chefdk" ]; then
  chefdk_ruby_exe="/opt/chefdk/embedded/bin/ruby"
  chefdk_ruby_lib_version=$("$chefdk_ruby_exe" -e 'puts RbConfig::CONFIG["ruby_version"]')

  make_shims "${HOME}/.chefdk/gem/ruby/${chefdk_ruby_lib_version}/bin/"*
  make_shims /opt/chefdk/bin/*
  make_shims "/opt/chefdk/embedded/lib/ruby/gems/${chefdk_ruby_lib_version}/bin/"*

  make_shims ruby
  for i in /opt/chefdk/embedded/bin/*; do
    if grep -qE '#!/opt/chefdk/embedded/bin/ruby' "$i"; then
      make_shims "$i"
    fi
  done
fi
