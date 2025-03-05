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

def monthly_payment(loan_amount, loan_duration, apr)
  rate = monthly_interest_rate(apr)

  loan_amount.to_f * (rate / (1 - (1 + rate)**(-loan_duration.to_f)))
end

def monthly_interest_rate(apr)
  (apr.to_f / 100) / 12
end

def duration_in_months(time)
  time.to_f * 12
end


prompt("Welcome to the Mortgage / Car Loan Calculator!")

loop do
  loan_amount = ''
  loop do
    prompt("What is the loan amount in dollars?")
    loan_amount = gets.chomp

    if number?(loan_amount)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  apr = ''
  loop do
    prompt("What is the Annual Percentage Rate (APR)?")
    apr = gets.chomp

    if number?(apr)
      break
    elsif apr.include?('%')
      prompt("Please only enter a number without the % sign.")
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  loan_duration = ''
  loop do
    prompt("What is the loan duration?")
    loan_duration = gets.chomp

    if number?(loan_duration)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  months_or_years = ''
  loop do
    prompt <<-MSG
    Is this duration in months or years?
    (Please enter M or Y)
    MSG
    months_or_years = gets.chomp

    if months_or_years.upcase == 'M'
      break
    elsif months_or_years.upcase == 'Y'
      loan_duration = duration_in_months(loan_duration)
      break
    end
  end

  prompt("Calculating...")
  prompt("Your monthly payment is #{monthly_payment(loan_amount, loan_duration, apr)}")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp

  break if answer.upcase != 'Y'
end

prompt("Thank you for using the Mortage / Car Loan Calculator!")