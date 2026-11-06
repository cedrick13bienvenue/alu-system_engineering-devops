# Web stack debugging #4

## Description
An nginx web server is dropping a huge share of requests under load: a
per-IP connection limit of 2 was tripping instantly under benchmarking.
This project finds it in the logs and fixes it with Puppet.

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

## Why this matters
A single misconfigured rate limit can look exactly like a capacity
problem: CPU and memory stay idle while the server quietly refuses
traffic. Benchmarking before and after a fix is the only way to tell
"slow" from "actively rejecting requests" apart.

## Debugging steps
1. Baseline the server under load:
   ```
   ab -c 100 -n 2000 localhost/
   ```
   A large chunk of the 2000 requests come back as failures or non-2xx
   responses, even though the server is barely doing any real work.
2. Check nginx's error log while the benchmark runs:
   ```
   tail -f /var/log/nginx/error.log
   ```
   It fills up with one message, repeated hundreds of times:
   ```
   limiting connections by zone "addr", client: 127.0.0.1, ...
   ```

## Root cause
`/etc/nginx/sites-available/default` had `limit_conn addr 2;`, capping
every client IP at 2 concurrent connections. A benchmarking tool (or any
real client making several parallel requests) immediately trips that
limit, and nginx answers the excess connections with an error response
instead of serving them.

## Caution
This fix removes the limit outright. In production, a per-IP connection
limit can be a legitimate defense against abuse; the real fix there is
raising it to a sane value for your actual traffic, not deleting it.

## Tools used
`ab` (ApacheBench), nginx's own error log, and `puppet`.

## Tasks
| File | Description |
| --- | --- |
| `0-the_sky_is_the_limit_not.pp` | Puppet manifest that removes the per-IP connection limit and reloads nginx |

## Usage
```
ab -c 100 -n 2000 localhost/            # Failed requests: > 0
puppet apply 0-the_sky_is_the_limit_not.pp
ab -c 100 -n 2000 localhost/            # Failed requests: 0
```

Check the manifest itself with:
```
puppet-lint 0-the_sky_is_the_limit_not.pp
```
