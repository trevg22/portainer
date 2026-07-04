
#!/usr/bin/env bash

LIST_FILE="$1"
DEST_DIR="$2"

if [[ -z "$LIST_FILE" || -z "$DEST_DIR" ]]; then
  echo "Usage: $0 filelist.txt /path/to/destination"
  exit 1
fi

while IFS= read -r file; do
  [[ -z "$file" ]] && continue

  if [[ -f "$file" ]]; then
    # Create destination directory structure
    dest_path="$DEST_DIR/$(dirname "$file")"
    mkdir -p "$dest_path"

    # Move the file
    mv -v "$file" "$dest_path/"
  else
    echo "Skipping (not found): $file"
  fi
done < "$LIST_FILE"

