class php_fpm (
  $ensure = $php_fpm::params::ensure,
) inherits php_fpm::params {

  anchor { 'php_fpm::begin':
    before => Class['php_fpm::install'],
    notify => Class['php_fpm::service'],
  }
  class { 'php_fpm::install':
    ensure => $ensure,
    notify => Class['php_fpm::service'],
  }
  class { 'php_fpm::service': }
  anchor { 'php_fpm::end':
    require => Class['php_fpm::service'],
  }
}
