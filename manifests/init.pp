# == Class: internet2_repo
class internet2_repo (
  $baseurl                  = $internet2_repo::params::baseurl,
  $web100_kernel_enabled    = '0',
  $web100_kernel_baseurl    = $internet2_repo::params::web100_kernel_baseurl,
  $web100_kernel_mirrorlist = $internet2_repo::params::web100_kernel_mirrorlist,
) inherits internet2_repo::params {

  case $::osfamily {
    'RedHat': {
      yumrepo { 'Internet2':
        baseurl  => $baseurl,
        descr    => 'Internet2 RPM Repository - software.internet2.edu - main',
        enabled  => '1',
        protect  => '0',
        gpgcheck => '1',
        gpgkey   => 'http://software.internet2.edu/rpms/RPM-GPG-KEY-Internet2',
      }

      yumrepo { 'Internet2-web100_kernel':
        baseurl    => $web100_kernel_baseurl,
        mirrorlist => $web100_kernel_mirrorlist,
        descr      => 'Internet2 Web100 Kernel RPM Repository - software.internet2.edu - main',
        enabled    => $web100_kernel_enabled,
        protect    => '0',
        gpgcheck   => '1',
        gpgkey     => 'http://software.internet2.edu/rpms/RPM-GPG-KEY-Internet2',
      }
    }
    default: {}
  }
}
