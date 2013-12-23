# == Class: users
#
# Full description of class users here.
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
#  class { users:
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
class users {
}

class users::oracle_acct {
    group { 'dba':
      ensure => 'present',
      gid    => '201',
    }
    user { 'oracle':
      ensure           => 'present',
      gid              => '201',
      home             => '/home/oracle',
      managehome       => true,
      password_max_age => '99999',
      password_min_age => '0',
      shell            => '/bin/bash',
      uid              => '201',
    }
    Group["dba"] -> User["oracle"]
}
class users::virtual {
        define localuser ($uid,$gid,$realname,$pass="",$sshkey="") {
 
                if ( $pass != "" ) {
                user { $title:
                        ensure  =>      "present",
                        uid     =>      $uid,
                        gid     =>      $gid,
                        shell   =>      "/bin/bash",
                        home    =>      "/home/$title",
                        comment =>      $realname,
                        password =>     $pass,
                        managehome =>   true,
                }
                }
                else {
                user { $title:
                        ensure  =>      "present",
                        uid     =>      $uid,
                        gid     =>      $gid,
                        shell   =>      "/bin/bash",
                        home    =>      "/home/$title",
                        comment =>      $realname,
                        managehome =>   true,
                }
                }
 
                if ( $sshkey != "" ) {
                 ssh_authorized_key { $title:
                         ensure  =>      "present",
                         type    =>      "ssh-rsa",
                         key     =>      "$sshkey",
                         user    =>      "$title",
                         require =>      User["$title"],
                         name    =>      "$title",
                 }
                }
        }
}
class users::unix_admins {
include users::virtual
 
        @users::virtual::localuser { "lgbarn":
                uid         =>      "118",
                gid         =>      "users",
                realname    =>      "Luther Barnum",
                pass        => '$6$UrlK5K4L$5qH4mzrW9UbHEdlkLJ7IoxJLRtvVyf3V8Wec.lodeMIMDNxhjVtF1xFGoRMYb476/u.ptmBvPW27ynUFlaOEN/',
                sshkey      =>      "AAAAB3NzaC1yc2EAAAABJQAAAIB2DILblEw0fsdyW2WebZcuEsjWCgV1ZrGv38K1WimK5iul1MTF0rctuYkLOQXDrgR/adJrVokng5DHMydoh/kq4qLjabXmTufK8mtcl8rP9Qyhu5KyoJ2jEH69XoWkij1X1jKDWZGCj5zfZhL7Yd2m0gf6B+6IaYIRkQvyRJEtyw==",
        }
        @users::virtual::localuser { "jmdunn":
                uid         =>      "134",
                gid         =>      "users",
                realname    =>      "Jim Dunn",
        }
        @users::virtual::localuser { "johnm":
                uid         =>      "140",
                gid         =>      "users",
                realname    =>      "John Marlett",
                pass        => '$6$hwEoaOy7$bqipFq6btIzJV2pmfewqS7lVpLY1c6tzssGSL91wEAABYS1sRebvTFsu9iWi7Z.p.TBJE2LN8SPYROD9gE0yX/',
                sshkey      => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDIo7PFsRbcNQa62Xv47lp3WsVK3UsDPTuHSENhWF3khgzQXb8+bhfsw3yaWAKkAMJaiSBS4R6YZvPMKHteaSf5aZRXlH4qLB/ILu9sJiMXkpElfmOwjY7AYP4M2CzZ0mnQjhukufz/5ylMPiCJoojEDgv2FWEsKua2Tw2H7saYRXIBDMD2bxVxB8C1ka4il0yACVOp2kRF5RyqhW3ufofPudbtYwwe4oPSFjxR3hMWPCpukeCZYhYL0sXSVDZX5fHFOhXvc7qvWk2jvEbMXo07d2jhMCmpcyVHRsRyIJF0eepxdWc17NE+EGZkhzgTuDoclJob8bD41H9lbQYoygWL",
        }
        @users::virtual::localuser { "seans":
                uid         =>      "142",
                gid         =>      "users",
                realname    =>      "Sean Sullivan",
        }
        @users::virtual::localuser { "scottj":
                uid         =>      "143",
                gid         =>      "users",
                realname    =>      "Scott Jernigan",
        }
  realize (
      Users::Virtual::Localuser["lgbarn"],
      Users::Virtual::Localuser["jmdunn"],
      Users::Virtual::Localuser["johnm"],
      Users::Virtual::Localuser["seans"],
      Users::Virtual::Localuser["scottj"],
  )

 
}
# Fully sponsored accounts of interest as virtual resources
class users::oracle_admins {
  include users::virtual 
  @users::virtual::localuser {"sbbara":
    uid        => "114",
    gid        => "100",
    realname    => "Syndee Barakat",
  }
  @users::virtual::localuser {"samart":
    uid        => "133",
    gid        => "100",
    realname    => "Scott Martel",
  }
  @users::virtual::localuser {"hjmurp":
    uid        => "115",
    gid        => "100",
    realname    => "Heidi Murphy",
  }
  @users::virtual::localuser {"kasree":
    uid        => "138",
    gid        => "100",
    realname    => "Krishna",
  }
  @users::virtual::localuser {"lpgerm":
    uid        => "144",
    gid        => "100",
    realname    => "Larry P Germain",
  }
  realize (
      Users::Virtual::Localuser["sbbara"],
      Users::Virtual::Localuser["samart"],
      Users::Virtual::Localuser["hjmurp"],
      Users::Virtual::Localuser["kasree"],
      Users::Virtual::Localuser["lpgerm"],
  )
}
class users::app::admin {
  include users::virtual 
  @users::virtual::localuser {"mspate":
    uid        => "127",
    gid        => "100",
    realname    => "Mahendra Patel",
  }
  @users::virtual::localuser {"mxsing":
    uid        => "137",
    gid        => "100",
    realname    => "Manoj Singh",
  }
  @users::virtual::localuser {"snaredla":
    uid        => "190",
    gid        => "100",
    realname    => "Sravan Naredla",
  }
  realize (
      Users::Virtual::Localuser["mspate"],
      Users::Virtual::Localuser["mxsing"],
      Users::Virtual::Localuser["snaredla"],
  )
}
