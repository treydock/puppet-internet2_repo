require 'spec_helper_acceptance'

describe 'internet2_repo class' do
  context 'default parameters' do
    it 'should run successfully' do
      pp =<<-EOS
        class { 'internet2_repo': }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    # Enabled by default
    describe yumrepo('Internet2') do
      it { should exist }
      it { should be_enabled }
    end

    # Disabled by default
    describe yumrepo('Internet2-web100_kernel') do
      it { should exist }
      it { should_not be_enabled }
    end
  end
end
