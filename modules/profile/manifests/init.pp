# == Class: profile
#
# Full description of class profile here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { profile:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class profile {
}
class profile::base {
  include custom
  include etc_issue
  include system
  include dnsclient
  include users::unix_admins
  file { '/etc/ssh/sshd_config':
      checksum    => ctime
  }
  exec { '/sbin/service sshd restart':
      subscribe    => File["/etc/ssh/sshd_config"],
      refreshonly    => true,
  }
}
class profile::oracle_admins {
  include users::oracle_admins
}
class profile::app::admin {
  include users::app::admin
}
