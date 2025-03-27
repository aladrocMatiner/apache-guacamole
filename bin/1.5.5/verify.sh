#!/bin/bash

# Verify GPG signatures (*.asc)
for asc_file in *.asc; do
    original_file=${asc_file%.asc}
    echo "Verifying GPG signature for: $original_file"
    gpg --verify "$asc_file" "$original_file"
    if [ $? -eq 0 ]; then
        echo "✅ GPG verification succeeded for $original_file"
    else
        echo "❌ GPG verification FAILED for $original_file"
    fi
done

echo -e "\n=============================\n"

# Verify SHA256 checksums (*.sha256)
for sha_file in *.sha256; do
    original_file=${sha_file%.sha256}
    echo "Checking SHA256 checksum for: $original_file"
    sha256sum --check "$sha_file"
    if [ $? -eq 0 ]; then
        echo "✅ SHA256 checksum verified for $original_file"
    else
        echo "❌ SHA256 checksum verification FAILED for $original_file"
    fi
done

