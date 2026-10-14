def caesar_cipher(message, shift_num)
  caesar = ""	
  message.each_char do |char|
    shift_num.times do
      case char
      	when "Z" 
        	char = "A"
        when "z"
        	char = "a"
      	else 
        	char = char.next if char.match?(/[[:alpha:]]/)
      end 
    end
    caesar += char
  end
  caesar
end
