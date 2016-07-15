#!/bin/sh

tmp_rbenv_chefdk="${GEM_ROOT} qQq ${GEM_HOME} qQq ${GEM_PATH}"

eval "$(/opt/chefdk/bin/chef shell-init sh)"

if [ "${tmp_rbenv_chefdk}" = "${GEM_ROOT} qQq ${GEM_HOME} qQq ${GEM_PATH}" ]; then
  echo "ERROR: You have previously run 'chef shell-init'." 1>&2
  echo "       Check your shell init scripts and remove it." 1>&2
  echo "       rbenv cannot work if has already been run." 1>&2
  exit 99
fi

echo 'Everything looks good!'
