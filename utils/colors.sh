#!/bin/bash

BLACK='\e[30m'
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
MAGENTA='\e[35m'
CYAN='\e[36m'
WHITE='\e[37m'

RESET='\e[0m'

function black() {
  printf "${BLACK}$1${RESET}"
}

function red() {
  printf "${RED}$1${RESET}"
}

function green() {
  printf "${GREEN}$1${RESET}"
}

function yellow() {
  printf "${YELLOW}$1${RESET}"
}

function blue() {
  printf "${BLUE}$1${RESET}"
}

function magenta() {
  printf "${MAGENTA}$1${RESET}"
}

function cyan() {
  printf "${CYAN}$1${RESET}"
}

function white() {
  printf "${WHITE}$1${RESET}"
}
