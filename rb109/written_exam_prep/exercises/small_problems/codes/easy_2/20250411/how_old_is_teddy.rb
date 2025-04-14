# Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

# Example Output

# Teddy is 69 years old!

def random_age_generator
  (20..200).to_a.sample
  rand(20..200)
end

puts "Teddy is #{random_age_generator} years old!"