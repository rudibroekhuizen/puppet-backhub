# == Define: backhub::defines::scp
#
define backhub::defines::scp (
  $source,
  $repeat,
  ) {
  
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
