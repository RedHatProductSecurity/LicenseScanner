#!/bin/bash

# Default input directory
DEFAULT_INPUT_DIR="/input"

# Function to run predefined license scanning commands
run_scan() {
  local input_dir=$1
  echo "Running license scan on directory: $input_dir"
  
  # Example predefined scan command using scancode-toolkit
  scancode --license --json-pp - $input_dir
}

# Main function
main() {
  local input_dir=${1:-$DEFAULT_INPUT_DIR}
  
  if [ ! -d "$input_dir" ]; then
    echo "Error: Input directory $input_dir does not exist."
    exit 1
  fi
  
  run_scan "$input_dir"
}

# Execute main function with provided arguments
main "$@"
