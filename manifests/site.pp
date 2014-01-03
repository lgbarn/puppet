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
node "br3partest.ux.corp.local" {
    class { 'puppetdb::master::config':
      puppetdb_server => 'br3partest3.ux.corp.local',
    }
    class { '::mcollective':
    client  => true,
    middleware       => true,
    middleware_hosts => [ 'br3partest.ux.corp.local' ],
  }
}
node "br3partest2.ux.corp.local" {
    class { 'puppetdb::database::postgresql':
      listen_addresses => 'br3partest2',
    }
  class { '::mcollective':
    client  => true,
    middleware_hosts => [ 'br3partest.ux.corp.local' ],
  }
  include role::database::server
}
node "br3partest3.ux.corp.local" {
    class { 'puppetdb::server':
      database_host => 'br3partest2',
    }
  class { '::mcollective':
    client  => true,
    middleware_hosts => [ 'br3partest.ux.corp.local' ],
  }
  include role::app::server
}
node "web1.ux.corp.local" {
  include role::database::server
}
