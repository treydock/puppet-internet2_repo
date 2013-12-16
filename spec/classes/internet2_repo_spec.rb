require 'spec_helper'

describe 'internet2_repo' do
  include_context :defaults

  let(:facts) { default_facts }

  it { should create_class('internet2_repo') }
  it { should contain_class('internet2_repo::params') }

  it do
    should contain_file('/etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2').with({
      'ensure'  => 'present',
      'source'  => 'puppet:///modules/internet2_repo/RPM-GPG-KEY-Internet2',
      'owner'   => 'root',
      'group'   => 'root',
      'mode'    => '0644',
    })
  end

  it do
    should contain_gpg_key('Internet2').with({
      'path'    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2',
      'before'  => 'Yumrepo[Internet2]',
    })
  end

  it do
    should contain_yumrepo('Internet2').with({
      'baseurl'         => 'http://software.internet2.edu/rpms/$releasever/$basearch/main/',
      'descr'           => "Internet2 RPM Repository - software.internet2.edu - main",
      'enabled'         => '1',
      'protect'         => '0',
      'gpgcheck'        => '1',
      'gpgkey'          => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Internet2',
    })
  end
end
