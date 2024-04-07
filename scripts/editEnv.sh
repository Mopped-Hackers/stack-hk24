#!/bin/bash

# Check if an input file was provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <path_to_env_file>"
  exit 1
fi

input_file="$1"
output_file="${input_file}.tmp"

# Process the input file and write to output_file
while IFS= read -r line || [[ -n "$line" ]]; do
  # Use sed to remove spaces around "=" that are not inside quotes
  echo "$line" | sed -E ':a; s/^([^"=]*("[^"]*")?[^"=]*) =/\1=/; ta' | sed -E ':a; s/= ([^"=]*(("[^"]*")?[^"=]*)$)/=\1/; ta' >> "$output_file"
done < "$input_file"

# Replace the original file with the processed one
mv "$output_file" "$input_file"

echo "Processing complete. Spaces around '=' outside quotes have been removed."
