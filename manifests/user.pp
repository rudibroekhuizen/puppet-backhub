# == Class: backhub::user
#
class backhub::user {

# Create user
  user { 'backhub':
    managehome => true,
    password   => $backhub::password,
  }

# Create group
  group { 'backhub':
    ensure => present,
  }

# Create homedirectory
  file { '/home/backhub':
    ensure  => directory,
    owner   => 'backhub',
    group   => 'backhub',
    mode    => '0700',
    require => Group['backhub'],
  }

# Create .ssh directory
  file { '/home/backhub/.ssh':
    ensure  => directory,
    owner   => 'backhub',
    group   => 'backhub',
    mode    => '0600',
    require => File['/home/backhub'],
  }

# Add private key to backhub account to be able to scp to devices
  file { '/home/backhub/.ssh/id_rsa':
    owner   => 'backhub',
    group   => 'backhub',
    mode    => '0600',
    content => $backhub::id_rsa,
  }

}
