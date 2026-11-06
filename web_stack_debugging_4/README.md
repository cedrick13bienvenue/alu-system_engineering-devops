# Web stack debugging #4

## Description
An nginx web server is dropping a huge share of requests under load.
This project benchmarks it with ApacheBench, finds the bottleneck in the
logs, and fixes it with Puppet.

## Resources
- [ApacheBench (ab) documentation](https://httpd.apache.org/docs/2.4/programs/ab.html)
- [nginx ngx_http_limit_conn_module](https://nginx.org/en/docs/http/ngx_http_limit_conn_module.html)
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
1. Baseline the server under load:
   ```
   ab -c 100 -n 2000 localhost/
   ```
   A large chunk of the 2000 requests come back as failures or non-2xx
   responses, even though the server is barely doing any real work.
