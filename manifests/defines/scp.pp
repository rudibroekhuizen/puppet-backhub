# == Define: backhub::scp
#
define backhub::scp (
  $hostname,
  $source,
  $schedule,
) {

  # Get configs with scp using geoffwilliams/scp module, data read from yaml
  scp { $hostname:
    ensure   => present
    source   => $source,
    schedule => $schedule,
  }
  
}
