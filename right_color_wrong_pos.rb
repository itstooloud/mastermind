
#takes two arrays, guess and secret code, determines how many in guess
#match an item in secret_code but at a different index point

def right_color_wrong_pos (guess, secret_code)

	how_many = 0
	secret_code = secret_code.map {|i| i.to_s}

	guess.each_with_index do |item, index|

		if ((secret_code.include? item) && secret_code[index] != item)
			how_many +=1
		end

	end # guess each
		return how_many
	
end

#puts right_color_wrong_pos(["6","4","3","1"], [2,1,4,6])