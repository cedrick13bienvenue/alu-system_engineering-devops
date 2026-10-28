# ALU System Engineering & DevOps

Linux system administration and DevOps projects for the ALU Web
Infrastructure track.

## Resources
- [How the web works](https://web.stanford.edu/class/cs98si/slides/overview.html)
- [Nginx](https://www.nginx.com/resources/glossary/nginx/)
- [How to Configure Nginx](https://www.digitalocean.com/community/tutorials/understanding-nginx-server-and-location-block-selection-algorithms)
- [HTTP redirection](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections)

## Learning Objectives
By the end of this project, you should be able to explain, without Google:
- What is the main role of a web server
- What is a child process, and why web servers have a parent and children
- What are the main HTTP requests
- What DNS stands for and what its main role is
- DNS record types: A, CNAME, TXT, MX

## Requirements
- All files interpreted on Ubuntu 16.04 LTS
- All files end with a new line
- The first line of all Bash scripts is exactly `#!/usr/bin/env bash`
- The second line of all Bash scripts is a comment explaining what it does
- All Bash script files are executable
- Bash scripts pass Shellcheck without error
- `systemctl` is never used for restarting a process

## Tasks
| File | Description |
| --- | --- |
| `web_server/0-transfer_file` | Transfers a local file to a remote server's home directory via `scp` |
| `web_server/1-install_nginx_web_server` | Installs nginx and serves a page containing "Holberton School" |
| `web_server/3-redirection` | Installs nginx and 301-redirects `/redirect_me` |
| `web_server/4-not_found_page_404` | Installs nginx with a custom 404 page |
| `web_server/5-design_a_beautiful_404_page.html` | A custom-designed 404 page |

## Usage
Run any configuration script as root on a fresh Ubuntu machine:
```
./web_server/1-install_nginx_web_server
./web_server/3-redirection
./web_server/4-not_found_page_404
```

Transfer a file to a remote server:
```
./web_server/0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY
```
