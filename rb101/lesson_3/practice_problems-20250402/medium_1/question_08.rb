=begin

Method calls can take expressions as arguments. Suppose we define a method called rps as follows, which follows the classic rules of rock-paper-scissors game: it returns the winning fist or, in the case of a tie, the fist that both players played.

What is the result of the following call?

=end

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# paper

# The outermost call is evaluated by determining the result of rps(rps("rock", "paper"), rps("rock", "scissors")) versus rock. In turn that means we need to evaluate the two separate results of rps("rock", "paper") and rps("rock", "scissors") and later combine them by calling rps on their individual results. Those innermost expressions will return "paper" and "rock", respectively. Calling rps on that input will return "paper". Which finally when evaluated against "rock" will return "paper".