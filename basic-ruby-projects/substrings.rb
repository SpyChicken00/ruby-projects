def substrings(string, dict)
  hash = Hash.new(0)
  chars = string.downcase.split("")
  dict.each do |word|
    left = 0
    right = word.length - 1
    until (right == chars.length) do
      hash[word] += 1 if word == chars[left..right].join
      left += 1
      right += 1
    end
  end
  hash
end
