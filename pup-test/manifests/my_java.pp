# DONT USE !   USE THE ONE ON THE MAC MINI
node default {

}

  class { 'java':
    package               => 'jdk-8u25-linux-x64',
    java_alternative      => 'jdk1.8.0_25',
    java_alternative_path => '/usr/java/jdk1.8.0_25/jre/bin/java',
  }

  #class { 'java':
  #  distribution => 'jdk',
  #  version      => 'latest',
  #}

  alternatives { 'cc':
    path => '/usr/bin/gcc',
  }

  java::download { 'java-11-openjdk-headless' :
    ensure       => 'present',
    java_se      => 'jdk',
    version      => '11.0.14',
    basedir      => '/usr/lib/jvm',
    package_type => 'rpm',
    url          => 'http://mirror.centos.org/centos/7/updates/x86_64/Packages/java-11-openjdk-headless-11.0.14.0.9-1.el7_9.x86_64.rpm'
    #symlink_name => '',
  }

  -> alternative_entry { '/usr/lib/jvm/jre-11-openjdk/bin/java' :
    ensure  => 'present',
    altlink => '/usr/bin/java',
    altname => 'java',
  }

  alternative_entry {'/usr/bin/gcc-4.4':
    ensure   => present,
    altlink  => '/usr/bin/gcc',
    altname  => 'gcc',
    priority => 10,
    require  => Package['gcc-4.4-multilib'],
  }


