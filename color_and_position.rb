#accepts two arrays, determines how many numbers between the two are an exact match

def color_and_position(guess, secret_code)

	how_many = 0

	secret_code = secret_code.map {|i| i.to_s}

	guess.each_with_index do |item, index|
		how_many += 1 if secret_code[index] == item
	end
	return how_many
	
end

#puts color_and_position(["6","4","3","1"], [6,1,3,9])