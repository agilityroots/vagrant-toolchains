require_relative 'spec_helper'

describe package('jenkins') do
  it { should be_installed }
end

describe service('jenkins') do
  it { should be_enabled }
  it { should be_running }
end

describe port(9095) do
  it { should be_listening }
end
