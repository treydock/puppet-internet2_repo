# == Class: internet2_repo
#
# Full description of class internet2_repo here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { 'internet2_repo': }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class internet2_repo (
  $baseurl  = 'http://software.internet2.edu/rpms/$releasever/$basearch/main/',
) inherits internet2_repo::params {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2':
    ensure  => present,
    source  => 'puppet:///modules/internet2_repo/RPM-GPG-KEY-Internet2',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  gpg_key { 'Internet2':
    path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2',
    before  => Yumrepo['Internet2'],
  }

  yumrepo { 'Internet2':
    baseurl         => $baseurl,
    descr           => 'Internet2 RPM Repository - software.internet2.edu - main',
    enabled         => '1',
    protect         => '0',
    gpgcheck        => '1',
    gpgkey          => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2',
  }

}
