# Load balancer

## Description
Doubling the web server fleet and placing both servers behind an HAProxy
load balancer, so traffic keeps flowing if one web server goes down.

## Resources
- [Introduction to load-balancing and HAProxy](https://www.digitalocean.com/community/tutorials/an-introduction-to-haproxy-and-load-balancing-concepts)
- [HTTP header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers)
- [Debian/Ubuntu HAProxy packages](https://haproxy.debian.net/)

## Learning Objectives
By the end of this project, you should be able to explain, without Google:
- What is a load balancer, and why it matters for redundancy
- What the roundrobin algorithm does
- How to add a custom HTTP response header in nginx
- How to manage a service via a SysV init script

## Requirements
- All files interpreted on Ubuntu 16.04 LTS
- All files end with a new line
- The first line of all Bash scripts is exactly `#!/usr/bin/env bash`
- The second line of all Bash scripts is a comment explaining what it does
- All Bash script files are executable
- Bash scripts pass Shellcheck without error

## Tasks
| File | Description |
| --- | --- |
| `0-custom_http_response_header` | Installs nginx and adds an `X-Served-By` header set to the server's hostname |
| `1-install_load_balancer` | Installs and configures HAProxy to roundrobin traffic across web-01 and web-02 |

## Usage
```
./0-custom_http_response_header   # run on web-01 and web-02
./1-install_load_balancer         # run on lb-01
```
