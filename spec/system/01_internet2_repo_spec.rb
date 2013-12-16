require 'spec_helper_system'

describe 'internet2_repo class:' do
  context 'with default parameters' do
    it 'should run successfully' do
      pp =<<-EOS
        class { 'internet2_repo': }
      EOS
  
      puppet_apply(pp) do |r|
       r.exit_code.should_not == 1
       r.refresh
       r.exit_code.should be_zero
      end
    end

    describe yumrepo('Internet2') do
      it { should exist }
      it { should be_enabled }
    end
  end
end
