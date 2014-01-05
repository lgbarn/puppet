# This module allows many resources to be managed with Hiera
#include system
hiera_include('classes')

node default {
  if ($role != undef)
  {
    include "${role}"
  }
  else
  {
    include role::base
  }
}
node 'web1.ux.corp.local' {
  include role::app::server
}
node 'dbs1.ux.corp.local' {
  include role::database::server
}
