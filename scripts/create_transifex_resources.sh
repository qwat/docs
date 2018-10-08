#!/usr/bin/env bash

# Exit on error
set -e

GNUMAKE="make"
if [[ "${OSTYPE,,}" =~ bsd* ]] || [[ "$OSTYPE" =~ darwin* ]]; then
    GNUMAKE="gmake"
fi

${GNUMAKE} clean gettext

tx push -s
