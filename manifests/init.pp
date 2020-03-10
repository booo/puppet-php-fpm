class php_fpm (
  $ensure = $php_fpm::params::ensure,
  $pid = $php_fpm::params::pid,
  $error_log = $php_fpm::params::error_log,
  $syslog_facility = $php_fpm::params::syslog_facility,
  $syslog_ident = $php_fpm::params::syslog_ident,
  $log_level = $php_fpm::params::log_level,
  $emergency_restart_threshold = $php_fpm::params::emergency_restart_threshold,
  $emergency_restart_interval = $php_fpm::params::emergency_restart_interval,
  $process_control_timeout = $php_fpm::params::process_control_timeout,
  $process_max = $php_fpm::params::process_max,
  $daemonize = $php_fpm::params::daemonize,
  $rlimit_files = $php_fpm::params::rlimit_files,
  $rlimit_core = $php_fpm::params::rlimit_core,
  $events_mechanism = $php_fpm::params::events_mechanism,
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
