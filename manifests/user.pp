# == Class: backhub::user
#
class backhub::user {
 
# Create user to push/pull configs
  user { backhub:
    managehome => true,
    password   => 'password'
  } 

# Create group
  group { backhub: 
    ensure => present, 
  }

# Create homedirectory
  file { "/home/backhub": 
    ensure  => directory, 
    owner   => "backhub", 
    group   => "backhub", 
    mode    => '0700',
    require => Group["backhub"],
  } 

# Create .ssh directory
  file { "/home/backhub/.ssh":
    ensure  => directory,
    owner   => "backhub",
    group   => "backhub",
    mode    => '0600',
    require => File["/home/backhub"],
  }

# Create authorized_keys directory
 file { "/home/backhub/.ssh/authorized_keys":
    ensure  => present,
    owner   => "backhub",
    group   => "backhub",
    mode    => '0600',
    require => File["/home/backhub/.ssh"],
    }

# Add public key
  ssh_authorized_key { backhub:
    ensure  => present,
    user    => "backhub",
    type    => ssh-rsa,
    key     => "AAAAB3NzaC1yc2EAAAADAQABAAABAQClZqmBO9TEHXq1PcHvCqg7QEaRvNwftEYKk0s2XHBiiIkr6SStO7sX6DCTVXRFpB5CbsJHnJgYr3aeHWgBGd7dLugAuP+MWizMfECD7r3qcig3XKpAAXVf9siLRIb4mG6ABG4l5PJ9MiAqExljEx96YBbQvmmp85uECBlAhQnvzV+SMJ1485qLbRRtwxhnq5yxh/L6sZhEjcJJMBI7GwwwgLhXTWxRmkNT4Ba8vQAfR+V6lHVXQDwf1yjaNVa9m5vpWzNROpZqC05rYBuc9AooFQRTyYJyDyQc+QTqivdIcKMNBY0EWD1ssFqTuEtl+vyhg5JoqYrG2F2jDSD1vqq/",
    require => File["/home/backhub/.ssh/authorized_keys"],
  }

# Add private key
  file { "/home/backhub/.ssh/id_rsa":
    owner   => "backhub",
    group   => "backhub",
    mode    =>  0600,
    content => "{backhub::id_rsa}",
  }
  
}
