# == Define: backhub::defines::scp
#
define backhub::defines::scp (
  $save_as,
  $source,
  $run,
  ) {
  
$timestamp = strftime("%Y%m%d%H%M")

# Define schedule: run everynight between 2 and 4 am
  schedule { 'everyday':
    period => daily,
    range  => "2-4",
    repeat => 1
  }
  
# Get configs with scp using geoffwilliams/scp module
  scp { $title:
    ensure   => present,
    source   => $source,
    name     => "/home/backhub/${timestamp}_${title}_${save_as}",
    schedule => $run,
  }
  
}
