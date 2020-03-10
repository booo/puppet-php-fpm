class php_fpm::service {
  service { 'php7.2-fpm':
    ensure => running,
    enable => true,
  }
}
