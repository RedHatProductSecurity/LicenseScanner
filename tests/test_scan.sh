## tests/test_scan.sh

#!/bin/bash

# Function to test the scan script
test_scan() {
  local test_input_dir="tests/test_input"
  local test_output_file="tests/test_output.json"

  # Create a test input directory and a dummy file
  mkdir -p "$test_input_dir"
  echo "dummy content" > "$test_input_dir/dummy_file.txt"

  # Run the scan script
  /usr/local/bin/scan.sh "$test_input_dir" > "$test_output_file"

  # Check if the output file is created
  if [ ! -f "$test_output_file" ]; then
    echo "Test failed: Output file not created."
    exit 1
  fi

  # Check if the output file contains expected content
  if ! grep -q '"scancode_version":' "$test_output_file"; then
    echo "Test failed: Output file does not contain expected content."
    exit 1
  fi

  echo "Test passed: Scan script works as expected."
}

# Main function to execute the test
main() {
  test_scan
}

# Execute main function
main
