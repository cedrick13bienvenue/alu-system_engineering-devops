# Web stack debugging #4

## Description
An nginx web server is dropping a huge share of requests under load.
This project benchmarks it with ApacheBench, finds the bottleneck in the
logs, and fixes it with Puppet.

## Resources
- [ApacheBench (ab) documentation](https://httpd.apache.org/docs/2.4/programs/ab.html)
- [nginx ngx_http_limit_conn_module](https://nginx.org/en/docs/http/ngx_http_limit_conn_module.html)
- [Puppet language basics](https://www.puppet.com/docs/puppet/7/lang_summary.html)
