#!/bin/bash
set -e

# Get the input text
INPUT_TEXT="$INPUT_TEXT"

# If no text is provided through INPUT_TEXT, use the first argument
if [ -z "$INPUT_TEXT" ]; then
  INPUT_TEXT="$1"
fi

# Default text if nothing is provided
if [ -z "$INPUT_TEXT" ]; then
  INPUT_TEXT="Hello World"
fi

# Run figlet and capture the output
ASCII_ART=$(figlet "$INPUT_TEXT")

# Output the ASCII art
echo "$ASCII_ART"

# Set the output for GitHub Actions
echo "ascii-art<<EOF" >> $GITHUB_OUTPUT
echo "$ASCII_ART" >> $GITHUB_OUTPUT
echo "EOF" >> $GITHUB_OUTPUT