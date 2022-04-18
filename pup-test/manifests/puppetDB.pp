# test
node default {
  # Configure puppetdb and its underlying database
  class { 'puppetdb':
    postgresql_ssl_on       => true,
    #database_host           => 'kmc_wsl',
    database_listen_address => '172.0.0.0',
  }

  # Configure the Puppet master to use puppetdb
  class { 'puppetdb::master::config':

  }
}

