#!/bin/bash
# Default to current directory if no argument is provided
directory="${1:-.}"
cd $directory
fzf | xargs nvim
