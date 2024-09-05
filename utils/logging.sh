#!/bin/bash

source "utils/colors.sh"

# Prints with a newline
function log() {
  printf "$1\n"
}

# Logs in red
function error() {
  log "$(red "Error: $1")"
}
