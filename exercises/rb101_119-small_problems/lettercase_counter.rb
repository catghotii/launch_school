# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one represents the number of characters that are uppercase letters, and one represents the number of characters that are neither.

def letter_case_count(string)
  count_hash = { lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each do |char|
    if char.match?(/[[:lower:]]/) then count_hash[:lowercase] += 1 end
    if char.match?(/[[:upper:]]/) then count_hash[:uppercase] += 1 end
    if !(char.match?(/[[:alpha:]]/)) then count_hash[:neither] += 1 end
  end
  p count_hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }