#!/bin/bash

# TODO: write script which will automatically create github actions to update container for each Container App

terraform output -json >> output.json

# Assign command line arguments to variables
yaml_file="github-actions-template.yml"
json_file="output.json"
output_yaml_file="frontend-update.yml"

# Copy the YAML file to a new location
cp "$yaml_file" "$output_yaml_file"

# Read each key-value pair from the JSON file
while IFS="=" read -r key value; do
  # Prepare the key to match the expected placeholder format in the YAML file
  placeholder="<${key}>"
  # Use sed to replace all occurrences of the placeholder in the YAML file
  sed -i "s/$placeholder/$value/g" "$output_yaml_file"
done < <(jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" "$json_file")

echo "Processing complete. Output available in $output_yaml_file"
