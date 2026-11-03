# Web stack debugging #1

## Description
A fresh Ubuntu container has nginx installed, but it isn't listening on
port 80. This project debugs why, and writes the minimal fix.

## Resources
- Web stack debugging guide (ALU concept page)

## Requirements
- All files interpreted on Ubuntu 20.04 LTS
- All files end with a new line
- The first line of all Bash scripts is exactly `#!/usr/bin/env bash`
- The second line of all Bash scripts is a comment explaining what it does
- All Bash script files are executable
- Bash scripts pass Shellcheck without error
- Bash scripts run without error
- `wget` is never used

## Debugging steps
1. Confirm nginx is actually installed:
   ```
   dpkg -l | grep nginx
   ```
2. Check whether the nginx process is running at all:
   ```
   ps aux | grep nginx
   ```
3. Check whether anything is actually bound to port 80:
   ```
   ss -tlnp | grep :80
   ```

## Root cause
nginx is installed but was never started. Containers don't run an init
system, so `apt-get install nginx` doesn't auto-start the service the way
it does on a real VM.
