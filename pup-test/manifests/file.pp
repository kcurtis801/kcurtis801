node default {
  import class ntp
  class { 'ntp':
        servers => ['nist-time-server.eoni.com','nist1-lv.ustiming.org','ntp-nist.ldsbc.edu']
  }
}



file { default:
  ensure => file,
  mode   => '0600',
  owner  => 'kent',
  group  => 'kent',
  ;
  '/tmp/ssh_host_dsa_key':
  ;
  '/tmp/ssh_host_key':
  ;
  '/tmp/ssh_host_dsa_key.pub':
    mode => '0644',
  ;
  '/tmp/ssh_host_key.pub':
    mode => '0644',
  ;
}
