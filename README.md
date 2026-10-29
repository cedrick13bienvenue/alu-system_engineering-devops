# ALU System Engineering & DevOps

Linux system administration and DevOps projects for the ALU Web
Infrastructure track.

## Projects
| Project | Description |
| --- | --- |
| [`ssh`](ssh/) | Connect to a remote server with SSH RSA keys, and configure the local SSH client |
| [`web_server`](web_server/) | Install and configure nginx: static pages, redirects, a custom 404 |
| [`load_balancer`](load_balancer/) | Double the web server fleet and balance traffic across them with HAProxy |

## Conventions
- A README.md is mandatory at the root of every project folder
- The first line of all Bash scripts is exactly `#!/usr/bin/env bash`
- The second line of all Bash scripts is a comment explaining what it does
- All Bash script files are executable
- Bash scripts pass Shellcheck without error
- `systemctl` is never used for restarting a process
