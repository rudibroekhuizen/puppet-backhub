# == Class: backhub
#
# Full description of class backhub here.
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
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'backhub':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class backhub (
  $id_rsa = '',
  ){

  # Create directory to store files
  file { '/data':
    ensure => directory,
  }

  # Create user to push/pull configs
  user { backhub:
    managehome => true,
    password   => 'password'
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
    content => "{id_rsa}",
  }

}
