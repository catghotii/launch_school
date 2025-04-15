# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

# Example:

# What is the bill? 200
# What is the tip percentage? 15

# The tip is $30.0
# The total is $230.0

def tip_calculator(bill_amount, tip_rate)
  bill_amount * (tip_rate / 100)
end

def total_bill(bill_amount, tip_amount)
  bill_amount + tip_amount
end

puts "What is the bill?"
bill_amount = gets.chomp.to_f

puts "What is the tip percentage?"
tip_rate = gets.chomp.to_f

tip = tip_calculator(bill_amount, tip_rate)
total = total_bill(bill_amount, tip_calculator(bill_amount, tip_rate))

puts "The tip is $#{tip.round(2)}"
puts "The total is $#{total.round(2)}"

# sprintf('%.2f', 3.14159)  # => "3.14"
# Kernel#format