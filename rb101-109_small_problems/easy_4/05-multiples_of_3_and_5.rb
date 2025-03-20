# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# for loop

def multisum(integer)
  multiples = []
  for number in (1..integer)
    if number % 3 == 0 || number % 5 == 0
      multiples << number
    end
  end

  multiples.inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

# select method

def multisum_2(integer)
  multiples = (1..integer).select do |number|
    number % 3 == 0 || number % 5 == 0
  end

  multiples.inject(:+)
end

p multisum_2(3) == 3
p multisum_2(5) == 8
p multisum_2(10) == 33
p multisum_2(1000) == 234168


=begin

Solution

def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(max_value)
  sum = 0
  1.upto(max_value) do |number|
    if multiple?(number, 3) || multiple?(number, 5)
      sum += number
    end
  end
  sum
end

Discussion

Our solution begins with a multiple? method that returns true if the given number is an exact multiple of divisor, false if it's not. This method isn't necessary, but it makes the multisum a bit more readable.

multisum does nothing fancy; it rushes headlong into the problem, and comes out the other end with the correct result. It adds each value that is a multiple of 3 or 5 in the range to the sum variable.

Further Exploration

Investigate Enumerable.reduce. How might this method be useful in solving this problem? (Note that Enumerable methods are available when working with Arrays.) Try writing such a solution. Which is clearer? Which is more succinct?

Note that #inject is an alias for #reduce. The two methods work identically. We mostly use #reduce in our curriculum, but it's worth noting that the documentation uses #inject.

=end