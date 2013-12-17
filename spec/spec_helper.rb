require 'puppetlabs_spec_helper/module_spec_helper'

min_version = Gem::Version.create('3.0.0')
max_version = Gem::Version.create('3.1.0')
puppet_version = Gem::Version.create(`puppet --version`.strip)

if puppet_version > min_version and puppet_version < max_version
  $:.unshift File.join(File.dirname(__FILE__),  'fixtures', 'modules', 'stdlib', 'lib')
  $:.unshift File.join(File.dirname(__FILE__),  'fixtures', 'modules', 'gpg_key', 'lib')
end

shared_context :defaults do
  let(:node) { 'foo.example.tld' }

  let :default_facts do
    {
      :kernel                 => 'Linux',
      :osfamily               => 'RedHat',
      :operatingsystem        => 'CentOS',
      :operatingsystemrelease => '6.4',
      :architecture           => 'x86_64',
    }
  end
end
