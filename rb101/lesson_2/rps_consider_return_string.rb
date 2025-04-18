VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def results(player, computer)
    if (player == 'rock' && computer == 'scissors') || 
       (player == 'paper' && computer == 'rock') || 
       (player == 'scissors' && computer == 'paper')
    return("You won!")
  elsif (player == 'rock' && computer == 'paper') || 
        (player == 'paper' && computer == 'scissors') || 
        (player == 'scissors' && computer == 'rock')
    return("Computer won!")
  else
    return("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample
   
  prompt("You chose #{choice}; Computer chose #{computer_choice}")

  prompt(results(choice, computer_choice))

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")