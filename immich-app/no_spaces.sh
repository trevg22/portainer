#!/bin/bash

# Root directory to start renaming
ROOT_DIR="/home/trevor/stack_data/pictures/FamilyPhotos"

# Find all directories, deepest first, to avoid conflicts
find "$ROOT_DIR" -depth -type d | while IFS= read -r dir; do
    # Extract base name and parent directory
    base=$(basename "$dir")
    parent=$(dirname "$dir")
    
    # Replace spaces with hyphens
    newbase=${base// /-}
    
    # Only rename if the name changed
    if [[ "$base" != "$newbase" ]]; then
        mv -v "$dir" "$parent/$newbase"
    fi
done

