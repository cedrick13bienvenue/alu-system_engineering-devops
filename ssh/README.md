# SSH

## Description
Connecting to a remote Ubuntu server over SSH using an RSA key pair, and
configuring the local SSH client to use it without a password.

## Resources
- [SSH essentials](https://www.hostinger.com/tutorials/ssh-tutorial-how-does-ssh-work)
- [SSH Config File](https://linuxize.com/post/using-the-ssh-config-file/)
- [Public Key Authentication for SSH](https://www.ssh.com/academy/ssh/public-key-authentication)
- [How Secure Shell Works](https://www.ssh.com/academy/ssh/protocol)

## Learning Objectives
By the end of this project, you should be able to explain, without Google:
- What is a server, and where servers usually live
- What is SSH
- How to create an SSH RSA key pair
- How to connect to a remote host using an SSH RSA key pair
- The advantage of using `#!/usr/bin/env bash` instead of `/bin/bash`

## Requirements
- All files interpreted on Ubuntu 20.04 LTS
- All files end with a new line
- The first line of all Bash scripts is exactly `#!/usr/bin/env bash`
- The second line of all Bash scripts is a comment explaining what it does
- All Bash script files are executable

## Tasks
| File | Description |
| --- | --- |
| `0-use_a_private_key` | Connects to the server as `ubuntu` using the `school` private key |
| `1-create_ssh_key_pair` | Generates a 4096-bit RSA key pair named `school`, passphrase-protected |
| `2-ssh_config` | SSH client config: use the `school` key, refuse password authentication |

## Usage
```
./1-create_ssh_key_pair
cp 2-ssh_config ~/.ssh/config
./0-use_a_private_key
```
