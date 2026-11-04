# Web stack debugging #2

## Description
Two privilege-related fixes: running a command as another user without
logging in as them, and fixing nginx so it drops root and runs as the
unprivileged nginx user.

## Requirements
- All files interpreted on Ubuntu 14.04 LTS
- All files end with a new line
- The first line of all Bash scripts is exactly `#!/usr/bin/env bash`
- The second line of all Bash scripts is a comment explaining what it does
- All Bash script files are executable
- Bash scripts pass Shellcheck without error
- Bash scripts run without error

## Why not stay logged in as root?
Root can do anything, including destroy the system with one typo. As
root, you can still run a single command as another, less privileged
user without ever leaving your root shell or needing their password.
