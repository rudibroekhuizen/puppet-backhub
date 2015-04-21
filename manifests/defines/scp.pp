# == Define: backhub::defines::scp
#
define backhub::defines::scp (
  $source,
  $repeat,
  ) {

# Define schedule: run everynight between 2 and 4 am
  schedule { 'everyday':
    period => daily,
    range  => "2-4"
  }
  
# Get configs with scp using geoffwilliams/scp module
  scp { $title:
    ensure   => present,
    source   => $source,
    schedule => $repeat,
  }
  
}
