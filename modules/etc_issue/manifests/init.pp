# == Class: etc_issue
#
# This class is only used to modify /etc/issue on each server to the approved Trinet
# Corporate login banner
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
#  class { etc_issue:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <luther.barnum@trinet.com>
#
# === Copyright
#
# Copyright 2013 Luther Barnum, unless otherwise noted.
#
class etc_issue {
file { '/etc/issue':
  path  => '/etc/issue',
  ensure  => present,
  mode    => '644',
  content => "*******************************************************************
                         WARNING NOTICE
*******************************************************************
This system is restricted solely to TRINET authorized users
for legitimate business purposes only. The actual or attempted
unauthorized access, use, or modification of this system is
strictly prohibited by TRINET. Unauthorized users are subject
to Company disciplinary proceedings and or criminal and civil
penalties under state, federal, or other applicable domestic and
foreign laws. The use of this system may be monitored and recorded
for administrative and security reasons. Anyone accessing this
system expressly consents to such monitoring and is advised that if
monitoring reveals possible evidence of criminal activity, TRINET
may provide the evidence of such activity to law enforcement
officials. All users must comply with TRINET instructions
regarding the protection of TRINET information assets.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                         $hostname
",
}
}

