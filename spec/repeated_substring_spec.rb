require 'spec_helper'
require 'repeated_substring'

RSpec.describe 'repeated_substring' do
  it 'some small tests just to check if everything works' do
    expect(RepeatedSubstring.new.find_repeated_substring("banana").length).to eq(2)
    expect(RepeatedSubstring.new.find_repeated_substring("am so uniqe")).to eq("NONE")
    expect(RepeatedSubstring.new.find_repeated_substring("aaaaaa").length).to eq(1)
    expect(RepeatedSubstring.new.find_repeated_substring("kbnpks nuaqcalqcaqcam  fi qakbppki").length).to eq(4)
  end
end
