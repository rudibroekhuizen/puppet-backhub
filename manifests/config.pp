# == Class: backhub:config
#
class backhub::config {

# Allow clear text password logins, to be able to use the backhub account to
# push files to backhub server
  augeas { 'sshd_config':
    changes => [
      'set /files/etc/ssh/sshd_config/PasswordAuthentication yes',
    ],
  }

# Setup logrotate using module yo61/logrotate
  logrotate::rule { 'backhub':
    path         => '/home/backhub/*',
    rotate       => 5,
    rotate_every => 'week',
  }

}
