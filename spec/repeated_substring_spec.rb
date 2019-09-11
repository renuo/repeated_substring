require 'spec_helper'
require 'repeated_substring'

RSpec.describe 'repeated_substring' do
  it 'is an example' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('banana')).to eq('an')
  end

  #https://www.geeksforgeeks.org/longest-repeating-and-non-overlapping-substring/
  #I used a modified version of this python script to find the correct solution
  it 'find the most repeated substring for every line of a file' do
    expect(RepeatedSubstring.new.find_repeated_substring_file('data/sample.txt')).to eq(["aqca", "NONE", "xf", "nr", "wmfl", "edpl", "pdbyc", "NONE", "exng", "zu", "la", "NONE", "ztjh", "m u", "yhfkc", "du ", "zpvxel", "coailb", "NONE", "lish", "dvro", "a ", "zf", "wyoup", "ekpu", "axn", "lhzpx", "melgn", "NONE", "ttllv", "cj", "NONE", "jhrda", "mp", "NONE", "NONE", "NONE", " o ", "low " , "ny"])
  end
end
