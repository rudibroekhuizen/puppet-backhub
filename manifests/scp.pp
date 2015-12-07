# == Class: backhub::scp
#
class backhub::scp {

  create_resources('backhub::defines::scp', $backhub::scp_hash)

}

# $base::devices_attribute_defaults
