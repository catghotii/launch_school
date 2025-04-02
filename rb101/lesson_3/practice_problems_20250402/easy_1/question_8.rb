# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Create an array containing only two elements: Barney's name and Barney's number.

new_array = flintstones.select { |name, num| name == "Barney" || num == 2 }
p new_array.to_a.flatten! # => ["Barney", 2]

p flintstones.select { |name, num| name == "Barney" || num == 2 }.to_a.flatten


# LS solution

flintstones.assoc("Barney")
# => ["Barney", 2]

# assoc(key) → new_array or nil click to toggle source
# If the given key is found, returns a 2-element Array containing that key and its value: