# a hacky version

# iterate over all characters in the string
# find all occurrences for the current character
# count the prefix | if prefix > than current max, current_max = prefix
#
# add current character to list and don't calculate its prefixes anymore
#
# A bit inefficient, bit a I think still an okay solution for this problem.
# Could be better solved with a suffix tree.

class RepeatedSubstring
  def find_repeated_substring(s)
    # catch the edge cases
    if s == ""
      return "NONE"
    end
    # check if the string consists of only one character => "aaaaaa" => "a"
    if s.split("").uniq.length == 1
      return s.split("").uniq[0]
    end
    searched = []
    longest_prefix = 0
    long_prefix = ""
    for i in 0..s.length - 1
      if searched.include? s[i]
        next
      end
      searched.push(s[i])
      next_occurrences = next_index(s, i + 1, s[i])
      next_occurrences.each do |next_occurrence|
        if next_occurrence == -1
          next
        end
        prefix = get_prefix(s[i..next_occurrence - 1], s[next_occurrence..s.length])
        if prefix.length > longest_prefix
          longest_prefix = prefix.length
          long_prefix = prefix
        end
      end
    end
    # if prefix == "       " it is a invalid sequence
    if long_prefix.strip.empty?
      return "NONE"
    end
    return long_prefix
  end

  def get_prefix(s1, s2)
    prefix = ""
    min_length = [s1.length, s2.length].min
    if s1 == nil || s2 == nil
      return ""
    end
    for i in 0..min_length - 1
      if s1[i] != s2[i]
        return prefix
      end
      prefix += s1[i]
    end
    return prefix
  end

  def next_index(seq, index, value)
    indexes = []
    for i in index..seq.length
      if seq[i] == value
        indexes.push(i)
      end
    end
    return indexes
  end

  def find_repeated_substring_file(file_path)
    File.open(file_path).read.each_line.map { |line| find_repeated_substring(line) }
  end
end
