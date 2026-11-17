#!/bin/bash

# ==============================
# Log Archive Tool
# ==============================

# 1. Check if the user provided a directory
if [ -z "$1" ]; then
    echo "Error: Please provide a log directory."
    echo "Usage: ./log-archive.sh <log-directory>"
    exit 1
fi

LOG_DIR=$1

# 2. Check if the directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist."
    exit 1
fi

# 3. Create a folder to store the archives
ARCHIVE_DIR="archived_logs"
mkdir -p "$ARCHIVE_DIR"

# 4. Create a filename with current date and time
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
ARCHIVE_PATH="$ARCHIVE_DIR/$ARCHIVE_NAME"

# 5. Compress the logs
echo "Archiving logs from: $LOG_DIR"
tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" .

# 6. Check if the archive was created successfully
if [ $? -eq 0 ]; then
    echo "Success! Archive created: $ARCHIVE_PATH"
else
    echo "Error: Failed to create archive."
    exit 1
fi

# 7. Save the date and time to a log file
echo "Archive created on $(date) -> $ARCHIVE_NAME" >> archive_history.log

echo "Done."
