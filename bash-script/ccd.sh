#!/bin/bash
# Default to current directory if no argument is provided
directory="${1:-.}"

cd "$(find $directory -type d | fzf)"
