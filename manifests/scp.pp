# == Class: backhub::scp
#
class backhub::scp {

  create_resources('backhub::defines::scp', $backhub::devices_hash, $base::devices_attribute_defaults)
  
}
