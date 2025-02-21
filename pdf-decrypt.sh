#!/bin/bash

__NAME__=pdf-decrypt

function pdf-decrypt() {
  function pdf-decrypt-error-handler() {
    local errno=$1
    if [ $errno -gt 0 ]; then
      echo "The program 'qpdf' exited with code $errno!" >&2
      echo "Press Enter to exit." >&2
      read
      exit $errno
    fi
  }

  case $1 in
    -h|--help|'')
      echo "Usage: \"$0 [file]\"."
      echo "Removes password-protection from PDF file called [file]."
      exit 0
      ;;
  esac

  if [ -f "$1" ]; then
    local file="$1"
    local qpdf_path="/c/Program Files/qpdf 11.10.1/bin/qpdf.exe"
    local encryptionStatus="$("$qpdf_path" --show-encryption "$file" 2>/dev/null)"
    local tempFile=""
    local password=""

    if [[ "$encryptionStatus" == "File is not encrypted" ]]; then
      echo "$encryptionStatus."
    else
      echo "Password: "
      read -s password

      tempFile=$(mktemp).pdf
      "$qpdf_path" --password="$password" --decrypt "$file" "$tempFile" && \
      mv "$tempFile" "$file"
      pdf-decrypt-error-handler $?
    fi
  else
    echo "\"$1\" is not a file." >&2
    exit 1
  fi
}

if [[ $0 == *${__NAME__}* ]]; then
  pdf-decrypt "$@"
fi
