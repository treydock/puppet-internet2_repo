# puppet-internet2_repo

[![Build Status](https://travis-ci.org/treydock/puppet-internet2_repo.svg?branch=master)](https://travis-ci.org/treydock/puppet-internet2_repo)

## Overview

This is a Puppet module that installs the Internet2 repositories.

The default behavior of this module is to install and enable the main Internet2 repository, and install and disable the web100 kernel repository.

## Usage

To enable just the Internet2 repository and install and disable the web100 kernel repository.

    include '::internet2_repo'

To enable the web100 kernel repository

    class { '::internet2_repo':
      web100_kernel_enabled => '1',
    }

## Reference

### Classes

#### Public Classes

* `internet2_repo`: Install and manage the Internet2 repos

### Parameters

The following parameters are available in the `::internet2_repo` class:

####`baseurl`

Specifies the baseurl used for the main Internet2 repository.  Default value is based on operating system version

Default: `http://software.internet2.edu/rpms/el${::operatingsystemmajrelease}/\$basearch/main/`

####`web100_kernel_enabled`

Specifies if the web100 kernel repository should be enabled or disabled.  Default value: `'0'`

####`web100_kernel_baseurl`

Specifies the baseurl used for the web100 kernel repository.  Default value: `'absent'`

####`web100_kernel_mirrorlist`

Specifies the mirrorlist used for the web100 kernel repository.  Default value is based on operating system version

Default: `http://software.internet2.edu/web100_kernel/rpms/el${::operatingsystemmajrelease}/mirrors-Internet2-web100_kernel`

## Development

### Testing

Testing requires the following dependencies:

* rake
* bundler

Install gem dependencies

    bundle install

Run unit tests

    bundle exec rake test

If you have Vagrant >= 1.2.0 installed you can run system tests

    bundle exec rake beaker

## Further Information

* http://software.internet2.edu/
