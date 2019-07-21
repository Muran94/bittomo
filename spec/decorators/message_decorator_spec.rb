require 'spec_helper'

RSpec.describe MessageDecorator do
  let(:message) { Message.new.extend MessageDecorator }
  subject { message }
  it { should be_a Message }
end
