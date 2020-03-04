class php_fpm::install($ensure) {
  package { 'php-fpm':
    ensure => $ensure,
  }
  file { '/etc/php/7.0/fpm/php-fpm.conf':
    ensure  => $ensure,
    content => template('php_fpm/php-fpm.conf.erb'),
    require => Package['php-fpm'],
    notify  => Service['php7.0-fpm'],
  }
}
