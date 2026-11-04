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

## Debugging nginx's privileges
1. Check who nginx's master and worker processes actually run as:
   ```
   ps auxff | grep ngin[x]
   ```
2. Check the `user` directive in `/etc/nginx/nginx.conf`: it had been
   overridden to `user root;`, and the init script always launches the
   master process as root regardless of that directive, so the only way
   to get the master process itself running as `nginx` is to start the
   `nginx` binary directly as that user instead of going through the
   init script.

## Tasks
| File | Description |
| --- | --- |
| `0-iamsomeoneelse` | Runs `whoami` as the user given in the first argument |
| `1-run_nginx_as_nginx` | Fixes nginx to run as the `nginx` user, listening on port 8080 |

## Usage
```
./0-iamsomeoneelse www-data

./1-run_nginx_as_nginx
ps auxff | grep ngin[x]
nc -z 0 8080
```
