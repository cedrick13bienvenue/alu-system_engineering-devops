# Web stack debugging #1

## Description
A fresh Ubuntu container has nginx installed, but it isn't listening on
port 80. This project debugs why, and writes the minimal fix.

## Requirements
- All files interpreted on Ubuntu 20.04 LTS
- All files end with a new line
- The first line of all Bash scripts is exactly `#!/usr/bin/env bash`
- The second line of all Bash scripts is a comment explaining what it does
- All Bash script files are executable
- Bash scripts pass Shellcheck without error
- Bash scripts run without error
- `wget` is never used
