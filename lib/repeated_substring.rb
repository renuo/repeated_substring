class RepeatedSubstring
	def find_repeated_substring(string)
	
		#Create all possibilities
		possibilities = []														#create empty array
		
		(string.length - 1).times{ |index_1|									#loop from 0 to string length
			
			(string.length - index_1 - 1).times { |index_2|						#loop from current index_1 to string length
																				#the two loops create every possibility of a substring	
				possibility = [string[index_1, index_2+2], index_1, index_2+2]	#create array with the substring, the position and the length
				possibilities << possibility									#add the possibility to the array of possibilities
			}
		}
		
		#Compare the possibilities
		word = [""]															#holds the longest repeating possibility
		word_temp =  []														#holds the current possibility

		possibilities.length.times{ |index_1|								#loop through all the possibilities
		
			word_temp = possibilities[index_1]								#store the current possibility
			(possibilities.length - index_1 - 1).times{ |index_2|			#loop from the current possibility to the end of the array
																			#the loops result in every element of the possibilities beeing compared with every other element after itself
				possibility = possibilities[index_1 + index_2 + 1]
				if word_temp[0] == possibility[0]							#check if the current substring matches the current "beeing compared to" substring
				
					if word_temp[0].length <= word[0].length				#check if the current substring is longer then the stored one
						next
						
					elsif word_temp[0].strip.empty?							#check if the substring isn't only spaces
						next
						
					elsif word_temp[1] + word_temp[2] - 1 >= possibility[1]	#check if the substrings don't overlap 
						next
						
					else													#else save the possibility
						word = word_temp									
						
					end
				end
			}
		}
		
		if word[0].length <= 0									#check if there's no repeating substring
			return "NONE"
		else													#else return the found substring
			return word[0]
		end
	end

	def find_repeated_substring_file(file_path)
    File.open(file_path).read.each_line.map { |line| find_repeated_substring(line) }
	end
end