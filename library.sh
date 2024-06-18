#!/bin/bash

PRIVATE_ENV_FILE=~/.privateenv

require_private_env() {
  local prompt=$1
  local env=$2

  touch $PRIVATE_ENV_FILE
  source $PRIVATE_ENV_FILE

  if grep -q $env "${PRIVATE_ENV_FILE}"; then
    echo "${env} already present in ${PRIVATE_ENV_FILE}"
  else
    echo $prompt
    read value
    echo "${env}=${value}" >> $PRIVATE_ENV_FILE
  fi
}
