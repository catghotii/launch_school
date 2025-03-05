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
  loan_amount.to_f * ((monthly_interest_rate(apr)) / (1 - (1 + monthly_interest_rate(apr))**(-duration.to_f)))
end

def monthly_interest_rate(apr)
  apr.to_f / 12
end

def duration_in_months(time)
  time.to_f * 12
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
  elsif user_apr.include?('%')
    prompt("Please only enter numbers without the % sign.")
  else
    prompt("Hmm... that doesn't look like a valid number.")
  end
end

user_loan_duration = ''
loop do
  prompt("What is the loan duration?")
  user_loan_duration = gets.chomp

  if number?(user_loan_duration)
    break
  else
    prompt("Hmm... that doesn't look like a valid number.")
  end
end

m_or_y = ''
loop do
  prompt("Is the duration you entered in months or years? (M/Y)")
  m_or_y = gets.chomp

  if m_or_y.upcase == 'M'
    break
  elsif m_or_y.upcase == 'Y'
    user_loan_duration = duration_in_months(user_loan_duration)
    break
  end
end

prompt("Calculating...")
prompt("Your monthly payment is #{monthly_payment(user_loan_amount, user_loan_duration, user_apr)}")