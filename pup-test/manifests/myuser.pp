# This is for creating users
#

include profile::accounts::user

node default {
  accounts::user { 'dan': }
}
# test
#  class { 'apache': }
#  ::apache { 'myApache':
#   ensure         => installed,
#    apache_version => '2.4.52',
#    require        => Package['java-11-openjdk'],
#  }
    #apache::mod::version{2.4.52}
#  service { 'httpd24':
##    ensure     => running,
#   enable     => true,
##   hasrestart => true,
#   hasstatus  => true,
#  }
        # pattern    => 'httpd24':
$packages = ['vim', 'git', 'curl']

package { $packages:
  ensure => 'installed'
}
  user { 'kent' :
    ensure     => present,
    managehome => true,
    home       => '/home/kent',
    shell      => '/bin/zsh',
  }


  #  sshkeys => [
  #    'ssh-rsa AAAAB3Nza...== jeff@puppetlabs.com',
  #    'ssh-dss AAAAB3Nza...== jeff@metamachine.net',
  #  ],


