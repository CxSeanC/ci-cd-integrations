#!/bin/bash

# Define URL and filenames
url="https://sca-downloads.s3.amazonaws.com/cli/latest/ScaResolver-linux64.tar.gz"
filename="ScaResolver-linux64.tar.gz"
dirname="ScaResolver"

# Prepare destination paths
workDir=$(pwd) # Assuming this script runs in the root of the build directory
destinationPath="$workDir/$filename"
extractToDirectory="$workDir/$dirname"

# Download the TAR.GZ file
curl -o "$destinationPath" "$url"

# Ensure the extraction directory exists
mkdir -p "$extractToDirectory"

# Unzip the file
tar -xzf "$destinationPath" -C "$extractToDirectory"

# Set execute permissions for the ScaResolver binary
chmod +x "$extractToDirectory/ScaResolver"

# Clean up the TAR.GZ file
rm -f "$destinationPath"

# Logging the path for debugging purposes
echo "ScaResolver has been installed to: $extractToDirectory"
