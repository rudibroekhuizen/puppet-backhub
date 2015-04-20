# == Class: backhub:config
#
class backhub::config {

# Setup logrotate on the config files
  logrotate::rule { 'logrotate':
    path         => '/home/backhub/*',
    rotate       => 5,
    rotate_every => 'week',
  }
  
}
