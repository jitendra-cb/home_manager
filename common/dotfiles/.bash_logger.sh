#!/usr/bin/env bash

BOLD_BLUE='\033[0;1;34m'
BOLD_GREEN='\033[0;1;32m'
BOLD_YELLOW='\033[0;1;33m'
BOLD_RED='\033[0;1;31m'
BOLD_PURPLE='\033[0;1;35m'

RESET='\033[0m'

logInfo() { echo -e "${BOLD_BLUE}$1${RESET}" ; }

logSuccess() { echo -e "${BOLD_GREEN}$1${RESET}" ; }

logWarning() { echo -e "${BOLD_YELLOW}$1${RESET}" ; }

logError() { echo -e "${BOLD_RED}$1${RESET}" ; }

logVerboseInfo () {
  if [[ $_V -eq 1 ]]; then
    echo -e "${BOLD_PURPLE}$1${RESET}"
  fi
}

logVerboseWarning () {
  if [[ $_V -eq 1 ]]; then
    echo -e "${BOLD_YELLOW}$1${RESET}"
  fi
}
