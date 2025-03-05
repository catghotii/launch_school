def prompt(message)
  puts ">> #{message}"
end

def number?(input)
  integer?(input) || float?(input)
end

def float?(input)
  input.to_f.to_s == input
end

def integer?(input)
  input.to_i.to_s == input
end

def monthly_payment(loan_amount, duration, apr)
  loan_amount.to_f * (monthly_interest_rate(apr) / (1 - (1 + monthly_interest_rate(apr))**(-duration.to_f)))
end

def monthly_interest_rate(apr)
  apr.to_f / 12
end


prompt("Welcome to the Mortgage / Car Loan Calculator!")

user_loan_amount = ''
loop do
  prompt("What is the loan amount in dollars?")
  user_loan_amount = gets.chomp

  if number?(user_loan_amount)
    break
  else
    prompt("Hmm... that doesn't look like a valid number.")
  end
end

user_apr = ''
loop do
  prompt("What is the Annual Percentage Rate (APR)?")
  user_apr = gets.chomp

  if number?(user_apr)
    break
  else
    prompt("Hmm... that doesn't look like a valid number.")
  end
end

user_loan_duration = ''
loop do
  prompt("What is the loan duration in months?")
  user_loan_duration = gets.chomp

  if number?(user_loan_duration)
    break
  else
    prompt("Hmm... that doesn't look like a valid number.")
  end
end

prompt("Calculating...")
prompt("Your monthly payment is #{monthly_payment(user_loan_amount, user_loan_duration, user_apr)}")