# Log Archive Tool

A simple Bash script that archives log files by compressing them into a `.tar.gz` file with a timestamp.

This project is useful for learning how to work with files, directories, and the command line — important skills in cybersecurity and system administration.

## Features

- Accepts a log directory as a command-line argument
- Compresses all files in the given directory
- Creates an archive with the current date and time in the filename
- Stores the archive in a folder called `archived_logs`
- Keeps a history of when archives were created

## Requirements

- Linux or macOS
- Bash shell
- `tar` command (usually pre-installed)

## How to Use

1. Make the script executable:

```bash
chmod +x log-archive.sh
