require 'spec_helper'

describe 'internet2_repo' do
  on_supported_os.each do |os, default_facts|
    context "on #{os}" do
      let(:facts) { default_facts }

      it { should create_class('internet2_repo') }
      it { should contain_class('internet2_repo::params') }

      it do
        should contain_yumrepo('Internet2').with({
          :baseurl  => "http://software.internet2.edu/rpms/el#{default_facts[:operatingsystemmajrelease]}/$basearch/main/",
          :descr    => "Internet2 RPM Repository - software.internet2.edu - main",
          :enabled  => '1',
          :protect  => '0',
          :gpgcheck => '1',
          :gpgkey   => 'http://software.internet2.edu/rpms/RPM-GPG-KEY-Internet2',
        })
      end

      it do
        should contain_yumrepo('Internet2-web100_kernel').with({
          :baseurl    => 'absent',
          :mirrorlist => "http://software.internet2.edu/web100_kernel/rpms/el#{default_facts[:operatingsystemmajrelease]}/mirrors-Internet2-web100_kernel",
          :descr      => "Internet2 Web100 Kernel RPM Repository - software.internet2.edu - main",
          :enabled    => '0',
          :protect    => '0',
          :gpgcheck   => '1',
          :gpgkey     => 'http://software.internet2.edu/rpms/RPM-GPG-KEY-Internet2',
        })
      end
    end
  end
end
