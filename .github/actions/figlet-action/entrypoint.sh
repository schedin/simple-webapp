#!/bin/bash
set -e

# Get the input text from environment variable
INPUT_TEXT="${INPUT_TEXT:-Hello World}"

# Run figlet and capture the output
ASCII_ART=$(figlet "$INPUT_TEXT")

# Output the ASCII art
echo "$ASCII_ART"

echo "$GITHUB_OUTPUT"

# Set the output for GitHub Actions
echo "ascii_art<<EOF" >> $GITHUB_OUTPUT
echo "$ASCII_ART" >> $GITHUB_OUTPUT
echo "EOF" >> $GITHUB_OUTPUT
