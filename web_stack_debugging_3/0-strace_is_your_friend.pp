# Fixes the WordPress 500 error found with strace: wp-settings.php had
# its permissions set to 000, so Apache (running as www-data) got
# EACCES trying to open() it, and require_once() failed in wp-config.php
exec { 'fix-wordpress':
  command => '/bin/chmod 644 /var/www/html/wp-settings.php',
}
