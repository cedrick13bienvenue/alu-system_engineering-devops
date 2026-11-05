# Web stack debugging #3

## Description
A WordPress site running on a LAMP stack (Linux, Apache, MySQL, PHP) is
returning a 500 error with nothing useful in the logs. This project uses
strace to find the real cause, and fixes it with Puppet.

## Resources
- [strace(1) man page](https://man7.org/linux/man-pages/man1/strace.1.html)
- [tmux](https://github.com/tmux/tmux/wiki)
- [Puppet language basics](https://www.puppet.com/docs/puppet/7/lang_summary.html)

## Requirements
- All files interpreted on Ubuntu 14.04 LTS
- All files end with a new line
- A README.md is mandatory at the root of the project
- Puppet manifests pass `puppet-lint` version 2.1.1 without error
- Puppet manifests run without error
- The first line of every Puppet manifest is a comment explaining what it does
- Puppet manifest files end with the `.pp` extension
- Files are checked with Puppet v3.4

## Installing puppet-lint
```
apt-get install -y ruby
gem install puppet-lint -v 2.1.1
```

## Debugging steps
1. Confirm the site is actually broken:
   ```
   curl -sI 127.0.0.1
   # HTTP/1.0 500 Internal Server Error
   ```
2. Trace the actual syscalls Apache/PHP make while handling the request
   (run one in a tmux pane, curl in another):
   ```
   strace -f -e trace=openat -p <apache_worker_pid>
   curl 127.0.0.1
   ```
   This surfaces the exact failing syscall:
   ```
   openat(AT_FDCWD, "/var/www/html/wp-settings.php", O_RDONLY) = -1 EACCES (Permission denied)
   ```
