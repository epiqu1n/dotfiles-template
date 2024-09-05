#!/bin/bash

source "utils/logging.sh"
source "utils/colors.sh"

THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_REPO_DIR="$(realpath "$THIS_DIR/..")"

# Appends the contents of the file from the first filepath argument to the second one
function append-file-to-file() {
  set -e

  local sourceFile=$1
  local targetFile=$2
  local newlines=""
  local leadingText="#####################################\n### Appended from GitHub dotfiles ###\n#####################################\n"
  local trailingText="\n#####################################\n#####################################\n"

  if [ -f "$sourceFile" ]; then
    if [ -f "$targetFile" ]; then
      # Add extra blank line if appending content
      leadingText="\n$leadingText"
    fi

    echo -e "$leadingText" >> "$targetFile"
    cat "$sourceFile" >> "$targetFile"
    echo -e "$trailingText" >> "$targetFile"
  else
    error "Could not append source file $sourceFile' to '$targetFile':\n  Source file '$sourceFile' could not be found."
    return 1
  fi

  if [ ! -f "$targetFile" ]; then
    log "Copied $(cyan "$sourceFile") to $(cyan "$targetFile")"
  else
    log "Appended $(cyan "$sourceFile") to $(cyan "$targetFile")"
  fi
}

# Gets all files in source-files and appends them to the same file in $HOME (creating if needed)
function extend-source-files() {
  local targetDotfilesDir="$HOME"
  local sourceFilesDir="$DOTFILES_REPO_DIR/source-files"
  local sourceDotfiles=($(ls -A "$sourceFilesDir" | grep "^\."))

  log "Appending/copying source dotfiles to target files in $targetDotfilesDir:"
  log "  $(cyan "${sourceDotfiles[*]}")"


  for filename in "${sourceDotfiles[@]}"; do
    append-file-to-file "$sourceFilesDir/$filename" "$targetDotfilesDir/$filename"
  done
}
