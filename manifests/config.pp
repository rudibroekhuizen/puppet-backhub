# == Class: backhub:config
#
class backhub::config {

# Get configs with scp using geoffwilliams/scp module



# Setup logrotate using module yo61/logrotate
  logrotate::rule { 'backhub':
    path         => '/home/backhub/*',
    rotate       => 5,
    rotate_every => 'week',
  }
  
}
