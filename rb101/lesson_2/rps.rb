<<<<<<< HEAD
VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
  (first == 'scissors' && second == 'paper') ||
  (first == 'paper' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("Computer wins!")
=======
VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_results(player, computer)
    if (player == 'rock' && computer == 'scissors') || 
       (player == 'paper' && computer == 'rock') || 
       (player == 'scissors' && computer == 'paper')
    prompt("You won!")
  elsif (player == 'rock' && computer == 'paper') || 
        (player == 'paper' && computer == 'scissors') || 
        (player == 'scissors' && computer == 'rock')
    prompt("Computer won!")
>>>>>>> 6573402dc69d21bcff8809ff74a861e52a6439a3
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
<<<<<<< HEAD
    prompt("Choose one: rock, paper, scissors")
    choice = gets().chomp()
=======
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()
>>>>>>> 6573402dc69d21bcff8809ff74a861e52a6439a3

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample
<<<<<<< HEAD

=======
   
>>>>>>> 6573402dc69d21bcff8809ff74a861e52a6439a3
  prompt("You chose #{choice}; Computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
<<<<<<< HEAD
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing! Good bye!")
=======
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
>>>>>>> 6573402dc69d21bcff8809ff74a861e52a6439a3
