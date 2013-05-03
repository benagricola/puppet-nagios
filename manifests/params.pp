# Class: nagios::params
#
# This class defines default parameters used by the main module class nagios
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to nagios class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class nagios::params {

  $install_prerequisites = hiera('nagios::install_prerequisites',true)

  # Default nagiosadmin password is 'example42'
  $nagiosadmin_password = hiera('nagios::nagiosadmin_password','B5dPQYYjf.jjA')
  $nagiosadmin_email = hiera('nagios::nagiosadmin_email','root@localhost')
  $nagiosadmins_members = hiera('nagios::nagiosadmins_members','nagiosadmin')

  $grouplogic = hiera('nagios::grouplogic','')

  $check_external_commands = hiera('nagios::check_external_commands',true)

  $plugins = hiera('nagios::plugins',true)

  $use_ssl = hiera('nagios::use_ssl',true)

  $cachedir = hiera('nagios::cachedir',$::operatingsystem ? {
    /(?i:RedHat|Centos|Scientific|Fedora|Amazon|Linux)/ => '/var/log/nagios',
    /(?i:Debian|Ubuntu|Mint)/                           => '/var/cache/nagios3',
    default                                             => '/var/cache/nagios',
  })

  $resourcefile = hiera('nagios::resourcefile',$::operatingsystem ? {
    /(?i:RedHat|Centos|Scientific|Fedora|Amazon|Linux)/ => '/etc/nagios/private/resource.cfg',
    /(?i:Debian|Ubuntu|Mint)/                           => '/etc/nagios3/resource.cfg',
    default                                             => '/etc/nagios/resource.cfg',
  })

  $statusfile = hiera('nagios::statusfile',$::operatingsystem ? {
    /(?i:RedHat|Centos|Scientific|Fedora|Amazon|Linux)/ => '/var/log/nagios/status.dat',
    /(?i:Debian|Ubuntu|Mint)/                           => '/var/cache/nagios3/status.dat',
    default                                             => '/var/lib/nagios/status.dat',
  })

  $commandfile = hiera('nagios::commandfile',$::operatingsystem ? {
    /(?i:RedHat|Centos|Scientific|Fedora|Amazon|Linux)/ => '/var/spool/nagios/cmd',
    /(?i:Debian|Ubuntu|Mint)/                           => '/var/lib/nagios3/rw/nagios.cmd',
    default                                             => '/var/lib/nagios/rw/nagios.cmd',
  })

  $resultpath = hiera('nagios::resultpath',$::operatingsystem ? {
    /(?i:RedHat|Centos|Scientific|Fedora|Amazon|Linux)/ => '/var/log/nagios/spool/checkresults',
    /(?i:Debian|Ubuntu|Mint)/                           => '/var/lib/nagios3/spool/checkresults',
    default                                             => '/var/lib/nagios/spool/checkresults',
  })

  $retentionfile = hiera('nagios::retentionfile',$::operatingsystem ? {
    /(?i:RedHat|Centos|Scientific|Fedora|Amazon|Linux)/ => '/var/log/nagios/retention.dat',
    /(?i:Debian|Ubuntu|Mint)/                           => '/var/lib/nagios3/retention.dat',
    default                                             => '/var/lib/nagios/retention.dat',
  })

  $p1file  = $::operatingsystem ? {
    /(?i:RedHat|Centos|Scientific|Fedora|Amazon|Linux)/ => '/usr/sbin/p1.pl',
    /(?i:Debian|Ubuntu|Mint)/                           => '/usr/lib/nagios3/p1.pl',
    default                                             => '/usr/lib/nagios/p1.pl',
  })

  $nrpepluginpackage = hiera('nagios::nrpepluginpackage',$::operatingsystem ? {
    /(?i:RedHat|Centos|Scientific|Fedora|Amazon|Linux)/ => 'nagios-plugins-nrpe',
    default                                             => 'nagios-nrpe-plugin',
  })

  $pluginspackage = hiera('nagios::pluginspackage',$::operatingsystem ? {
    /(?i:RedHat|Centos|Scientific|Fedora|Amazon|Linux)/ => 'nagios-plugins-all',
    default                                             => 'nagios-plugins',
  })

  $htpasswdfile = hiera('nagios::htpasswdfile',$::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/nagios3/htpasswd.users',
    default                   => '/etc/nagios/htpasswd.users',
  })


  ### Application related parameters

  $package = hiera('nagios::package',$::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'nagios3',
    default                   => 'nagios',
  })

  $service = hiera('nagios::service',$::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'nagios3',
    default                   => 'nagios',
  })

  $service_status = hiera('nagios::service_status',$::operatingsystem ? {
    default => true,
  })

  $process = hiera('nagios::process',$::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'nagios3',
    default                   => 'nagios',
  })

  $process_args = hiera('nagios::process_args',$::operatingsystem ? {
    default => '',
  })

  $process_user = hiera('nagios::process_user',$::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'nagios',
    default                   => 'nagios',
  })

  $config_dir = hiera('nagios::config_dir',$::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/nagios3',
    default                   => '/etc/nagios',
  })

  $config_file = hiera('nagios::config_file',$::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/nagios3/nagios.cfg',
    default                   => '/etc/nagios/nagios.cfg',
  })

  $config_file_mode = hiera('nagios::config_file_mode',$::operatingsystem ? {
    /(?i:RedHat|Scientific|Centos|Amazon|Linux)/ => '0664',
    default                                      => '0644',
  })

  $config_file_owner = hiera('nagios::config_file_owner',$::operatingsystem ? {
    /(?i:RedHat|Scientific|Centos|Amazon|Linux)/ => 'nagios',
    default                                      => 'root',
  })

  $config_file_group = hiera('nagios::config_file_group',$::operatingsystem ? {
    /(?i:RedHat|Scientific|Centos|Amazon|Linux)/ => 'nagios',
    default                                      => 'root',
  })

  $config_file_init = hiera('nagios::config_file_init',$::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/nagios3',
    default                   => '/etc/sysconfig/nagios',
  })

  $pid_file = hiera('nagios::pid_file',$::operatingsystem ? {
    /(?i:RedHat|Scientific|Centos|Amazon|Linux)/ => '/var/run/nagios.pid',
    /(?i:Debian|Ubuntu|Mint)/                    => '/var/run/nagios3/nagios3.pid',
    default                                      => '/var/run/nagios/nagios.pid',
  })

  $data_dir = hiera('nagios::data_dir',$::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/lib/nagios3',
    default                   => '/var/lib/nagios',
  })

  $log_dir = hiera('nagios::log_dir',$::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/log/nagios3',
    default                   => '/var/log/nagios',
  })

  $log_file = hiera('nagios::log_file',$::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/var/log/nagios3/nagios.log',
    default                   => '/var/log/nagios/nagios.log',
  })

  # General Settings
  $my_class = hiera('nagios::my_class','')
  $source = hiera('nagios::source','')
  $source_dir = hiera('nagios::source_dir','')
  $source_dir_purge = hiera('nagios::source_dir_purge',false)
  $template = hiera('nagios::template','nagios/nagios.cfg.erb')
  $options = hiera('nagios::options','')
  $service_autorestart = hiera('nagios::service_autorestart',true)
  $version = hiera('nagios::version','present')
  $absent = hiera('nagios::absent',false)
  $disable = hiera('nagios::disable',false)
  $disableboot = hiera('nagios::disableboot',false)

  ### General module variables that can have a site or per module default
  $monitor = hiera("nagios::monitor",hiera("monitor",false))
  $monitor_tool = hiera("nagios::monitor_tool",hiera("monitor_tool",""))
  $monitor_target = hiera("nagios::monitor_target",$::ipaddress)
  $puppi = hiera("nagios::puppi",hiera("puppi",false))
  $puppi_helper = hiera("nagios::puppi_helper","standard")
  $audit_only = hiera("nagios::audit_only",false)

  $bool_install_prerequisites = any2bool($install_prerequisites)
  $bool_check_external_commands=any2bool($check_external_commands)
  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  
}
