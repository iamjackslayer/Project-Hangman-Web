
helpers do
	

	def generate_word
		@word_display_array = []
		contents = File.readlines('./public/dictionary.txt')
		while true
			@word = contents[rand(0..61406)]
			if (5..12).include?@word.length 
				@count = @word.length - 1
				break
			end
		end
		@word = @word.chomp.split("")
		@word.length.times do 
			@word_display_array << " _ "
		end
	end
		#loop for user input now 
	def in_game
		
		session[:count] -= 1
		if @word.include? @input
			@word.each_with_index do |e,i|
				if e == @input
					@word_display_array[i] = " #{e} "
				end
			end
		
		elsif @input == @word.join
			session[:win] = true
		end
		check_game_over
		
	end

	def check_game_over
		if !@word_display_array.include?" _ "
			session[:win] = true
		end
	end
end