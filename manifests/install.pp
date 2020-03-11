class php_fpm::install (
  $ensure                      = $php_fpm::params::ensure,
  $pid                         = $php_fpm::params::pid,
  $error_log                   = $php_fpm::params::error_log,
  $syslog_facility             = $php_fpm::params::syslog_facility,
  $syslog_ident                = $php_fpm::params::syslog_ident,
  $log_level                   = $php_fpm::params::log_level,
  $emergency_restart_threshold = $php_fpm::params::emergency_restart_threshold,
  $emergency_restart_interval  = $php_fpm::params::emergency_restart_interval,
  $process_control_timeout     = $php_fpm::params::process_control_timeout,
  $process_max                 = $php_fpm::params::process_max,
  $daemonize                   = $php_fpm::params::daemonize,
  $rlimit_files                = $php_fpm::params::rlimit_files,
  $rlimit_core                 = $php_fpm::params::rlimit_core,
  $events_mechanism            = $php_fpm::params::events_mechanism,
) inherits php_fpm::params {
  package { 'php-fpm':
    ensure => $ensure,
  }
  file { '/etc/php/7.2/fpm/php-fpm.conf':
    ensure  => $ensure,
    content => template('php_fpm/php-fpm.conf.erb'),
    require => Package['php-fpm'],
    notify  => Service['php7.2-fpm'],
  }
}
