class php_fpm(
  $ensure = 'present',
  $pid = '/var/run/php-fpm.pid',
  $error_log = '/var/log/php-fpm.log',
  $syslog_facility = 'daemon',
  $syslog_ident = 'php-fpm',
  $log_level = 'notice',
  $emergency_restart_threshold = 0,
  $emergency_restart_interval = 0,
  $process_control_timeout = 0,
  $process_max = 0,
  $daemonize = yes,
  $rlimit_files = undef,
  $rlimit_core = undef,
  $events_mechanism = undef,
){
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
