#!/usr/bin/env bash

if [[ "$RBENV_VERSION" = chefdk* ]]; then
  if [ ! -x "$RBENV_COMMAND_PATH" ]; then
    chefdk_ruby_exe="${RBENV_ROOT}/versions/${RBENV_VERSION}/bin/ruby"
    chefdk_ruby_lib_version=$("$chefdk_ruby_exe" -e 'puts RbConfig::CONFIG["ruby_version"]')
    if [ -x "${HOME}/.chefdk/gem/ruby/${chefdk_ruby_lib_version}/bin/${RBENV_COMMAND}" ]; then
      RBENV_COMMAND_PATH="${HOME}/.chefdk/gem/ruby/${chefdk_ruby_lib_version}/bin/${RBENV_COMMAND}"
    fi
  fi
fi
