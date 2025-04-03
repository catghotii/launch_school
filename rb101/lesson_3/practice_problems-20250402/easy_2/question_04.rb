# See if the name "dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

p advice.include?("dino")

p advice.match?("dino")

# Note that this is not a perfect solution, as it would match any substring with Dino in it.