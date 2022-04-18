#Class kent
class ruby::r193 {

  package { 'ruby1.9.3':
    ensure => present,
  }

  # Will also update gem, irb, rdoc, rake, etc.
  alternatives { 'ruby':
    path    => '/usr/bin/ruby1.9.3',
    require => Package['ruby1.9.3'],
  }
}

# magic!
include ruby::r193
