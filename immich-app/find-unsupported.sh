#!/usr/bin/env bash

ROOT="${1:-.}"

# Supported extensions (lowercase, without dots)
SUPPORTED_EXTENSIONS=(
  avif bmp gif heic heif jp2
  jpeg jpg jpe insp jxl png psd raw rw2 svg tif tiff webp
  3gp 3gpp avi flv m4v mkv mts m2ts m2t mp4 insv mpg mpe mpeg mov webm wmv
)

# Build regex like: (jpg|png|mp4|...)
EXT_REGEX=$(printf "|%s" "${SUPPORTED_EXTENSIONS[@]}")
EXT_REGEX="${EXT_REGEX:1}"

find "$ROOT" -type f | while read -r file; do
  ext="${file##*.}"
  ext="${ext,,}"   # lowercase

  # files without extension OR unsupported extension
  if [[ "$file" != *.* ]] || ! [[ "$ext" =~ ^($EXT_REGEX)$ ]]; then
    echo "$file"
  fi
done

