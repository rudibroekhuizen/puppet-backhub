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

# Define schedule: run everynight between 2 and 4 am
  schedule { 'everyday':
    period => daily,
    range  => '2-4',
    repeat => 1
  }

# Delete older configs
  tidy { "/home/backhub":
    age => "4w",
  }

}
