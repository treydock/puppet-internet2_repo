# == Class: internet2_repo::params
class internet2_repo::params {

  case $::osfamily {
    'RedHat': {
      $baseurl                  = "http://software.internet2.edu/rpms/el${::operatingsystemmajrelease}/\$basearch/main/"
      $web100_kernel_baseurl    = 'absent'
      $web100_kernel_mirrorlist = "http://software.internet2.edu/web100_kernel/rpms/el${::operatingsystemmajrelease}/mirrors-Internet2-web100_kernel"
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only support osfamily RedHat")
    }
  }

}
