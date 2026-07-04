find "$SOURCE_DIR" -type f \( \
    -iname "*.mp4" -o \
    -iname "*.mov" -o \
    -iname "*.mkv" -o \
    -iname "*.avi" -o \
    -iname "*.mpg" -o \
    -iname "*.mpeg" -o \
    -iname "*.webm" \
\) -exec mv --parents {} "$TARGET_DIR" \;

