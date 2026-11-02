# Firewall

## Description
Installing and configuring `ufw` on web-01 to block all incoming traffic
except SSH, HTTP, and HTTPS.

## Resources
- [What is a firewall](https://www.cloudflare.com/learning/security/what-is-a-firewall/)
- [UFW essentials](https://wiki.ubuntu.com/UncomplicatedFirewall)

## Learning Objectives
By the end of this project, you should be able to explain, without Google:
- What a firewall is and why it matters
- How to check whether a socket is open with `telnet`
- How `ufw` default policies and allow rules interact

## Requirements
- All files interpreted on Ubuntu 16.04 LTS
- All files end with a new line
- The first line of all Bash scripts is exactly `#!/usr/bin/env bash`
- The second line of all Bash scripts is a comment explaining what it does
- All Bash script files are executable
- Bash scripts pass Shellcheck without error
- Only web-01 is graded for this task, though the script is safe to run on
  lb-01 and web-02 too

## Warning
`ufw`'s default incoming policy blocks port 22 (SSH). Always allow 22
*before* setting the default-deny policy and enabling `ufw`, or you will
lock yourself out of the server with no way to reconnect.

## Debugging tip
Check whether a port is open from another host with `telnet`:
```
telnet web-01.example.com 22    # succeeds if the port is reachable
telnet web-01.example.com 2222  # hangs/refuses if the port is blocked
```

## Tasks
| File | Description |
| --- | --- |
| `0-block_all_incoming_traffic_but` | Configures `ufw` to block all incoming traffic except TCP 22, 80, and 443 |
