# Fixes nginx dropping requests under load: a per-IP connection limit
# was set far too low for benchmarking tools that open many concurrent
# connections from a single client, so this removes it and reloads nginx
exec { 'fix--for-nginx':
  command => "sed -i '/limit_conn addr 2;/d' /etc/nginx/sites-available/default && service nginx restart",
  path    => ['/bin', '/usr/sbin', '/usr/bin'],
}
