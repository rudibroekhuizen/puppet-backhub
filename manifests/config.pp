# == Class: backhub:config
#
class backhub::config {

# Get configs with scp using geoffwilliams/scp module
scp { "/home/backhub/005454":
  ensure => present
  source => "fred@build.mycompany.com/var/jenkins/data/myapp_current.war",
}

# Setup logrotate using module yo61/logrotate
  logrotate::rule { 'backhub':
    path         => '/home/backhub/*',
    rotate       => 5,
    rotate_every => 'week',
  }
  
}
