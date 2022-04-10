#nginx
# Class: nginx
#
#
class nginx {
  include profile::nginx

  package{'nginx':
    ensure         => latest,
    manage_repo    => true,
    package_source => 'nginx-mainline'
  }

  nginx::resource::server { 'puppet':
    ensure               => present,
    server_name          => ['puppet'],
    listen_port          => 8140,
    ssl                  => true,
    ssl_cert             => '/var/lib/puppet/ssl/certs/lnv-h1m.pem',
    ssl_key              => '/var/lib/puppet/ssl/private_keys/lnv-h1m.pem',
    ssl_port             => 8140,
    server_cfg_append    => {
      'passenger_enabled'      => 'on',
      'passenger_ruby'         => '/usr/bin/ruby',
      'ssl_crl'                => '/var/lib/puppet/ssl/ca/ca_crl.pem',
      'ssl_client_certificate' => '/var/lib/puppet/ssl/certs/ca.pem',
      'ssl_verify_client'      => 'optional',
      'ssl_verify_depth'       => 1,
    },
    www_root             => '/etc/puppet/rack/public',
    use_default_location => false,
    access_log           => '/var/log/nginx/puppet_access.log',
    error_log            => '/var/log/nginx/puppet_error.log',
    passenger_cgi_param  => {
      'HTTP_X_CLIENT_DN'     => '$ssl_client_s_dn',
      'HTTP_X_CLIENT_VERIFY' => '$ssl_client_verify',
    },
  }
}
