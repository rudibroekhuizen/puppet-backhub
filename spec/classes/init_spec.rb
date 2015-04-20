require 'spec_helper'
describe 'backhub' do

  context 'with defaults for all parameters' do
    it { should contain_class('backhub') }
  end
end
