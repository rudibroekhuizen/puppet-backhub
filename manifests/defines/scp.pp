# == Define: backhub::scp
#
define backhub::scp (
  $hostorip,
  $source,
  $schedule,
) {

  # Get configs with scp using geoffwilliams/scp module
  scp { $hostorip:
    ensure   => present
    source   => $source,
    schedule => $schedule,
  }
  
}
