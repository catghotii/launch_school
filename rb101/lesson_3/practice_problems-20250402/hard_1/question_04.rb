=begin

Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a numeric string between 0 and 255 as required for IP numbers and asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.

=end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

# Answer:

# Firstly, there needs to be a way to return false if there are more or fewer than 4 components to the IP address. To do this, an if conditional can be used to check if the size of the array referenced by `dot_separated_words` is NOT 4 (`dot_separated_words.size != 4`).

# This could be written as:

return false if dot_separated_words.size !=4
# or using `unless`
return false unless dot_separated_words.size == 4

# Secondly, a false condition also needs to be returned if the value passed to the `is_an_ip_number?` method is evaluated as false by that method. Ben's method breaks out of the while loop instead of returning a false condition (the break keyword would only break out of the loop and then run the last line of code, returning true every time). To fix this, replace `break` with `return` instead.

# The last line can also be simplified from `return true` to `true` as it is the last line of the method body which is the return value unless a `return` keyword is executed prior.


# LS:

# There are several ways to fix this. To determine if there are exactly 4 dot-separated "words" in the string, you can simply add a check for dot_separated_words.size after splitting the string.

# The other error in Ben's code is that instead of returning false upon encountering a non-numeric component, he used break to break out of the while loop. Once he breaks, control falls through to the return true statement. He can fix this by performing return false instead of break.