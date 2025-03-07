# Figlet ASCII Art GitHub Action

This GitHub Action generates ASCII art from text using figlet tool.

## Inputs

### `text`

**Required**: The text to convert to ASCII art. Default: "Hello World".

## Outputs

### `ascii-art`

The generated ASCII art.

## Example usage

```yaml
name: Generate ASCII Art
on: [push]

jobs:
  ascii-job:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      
      - name: Generate ASCII Art
        uses: ./
        id: ascii
        with:
          text: "GitHub Actions!"
      
      - name: Print ASCII Art
        run: echo "${{ steps.ascii.outputs.ascii-art }}"
```

## Local Development

To build and test this action locally:

```bash
# Build the Docker image
docker build -t figlet-action .

# Run the Docker container
docker run -e INPUT_TEXT="Hello GitHub" figlet-action
```