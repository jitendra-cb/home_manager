#!/usr/bin/env bash

BOLD_BLUE='\033[0;1;34m'
BOLD_GREEN='\033[0;1;32m'
BOLD_RED='\033[0;1;31m'
BOLD_YELLOW='\033[0;1;33m'

RESET='\033[0m'

err() { echo -e "${BOLD_RED}$1${RESET}" ; }

warn() { echo -e "${BOLD_YELLOW}$1${RESET}" ; }

info() { echo -e "${BOLD_BLUE}$1${RESET}" ; }

success() { echo -e "${BOLD_GREEN}$1${RESET}" ; }

