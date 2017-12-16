require_relative 'spec_helper.rb'

describe package("ansible") do
  it { should be_installed }
end
