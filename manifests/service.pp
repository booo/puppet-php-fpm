class php-fpm::service {
  service { 'php7.0-fpm':
    ensure   => running,
    enable   => true,
  }
}
