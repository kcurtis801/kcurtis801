#include ::nginx
##include apache
notify { 'greeting':
  message => 'Hello, world!'
}
#class { 'apache': }

#class { 'apache':
#  apache_name  => 'httpd24u',
#  dev_packages => 'httpd24u-devel',
#}
#include apache::dev
# this is a line with a lot of characters in it possible more that 70 but needs to be 90 or more
-> package {'puppet-lint':
  ensure   => 'installed',
  provider => 'gem'
}

-> package { 'puppet-sec-lint':
  ensure   => 'installed',
  provider => 'gem'
}

#class { 'puppetdb':
#    listen_address => '127.0.0.1'
#}

#class{'nginx': }

# puppet_service.pp
#-> service { 'puppet':
#  ensure   => 'stopped',
#  enable   => false,
#  provider => 'puppet_service',
#}


