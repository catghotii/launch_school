VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_CHOICES_SHORTCUTS = %w(r p sc l sp)
# OR YOU COULD USE A HASH! WITH SYMBOLS!

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
  (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
  (first == 'paper' && (second == 'rock' || second == 'spock')) ||
  (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
  (first == 'spock' && (second == 'scissors' || second == 'rock'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("Computer wins!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt <<-MSG
    Choose one: #{VALID_CHOICES.join(', ')}."
    Shortcuts:
    'r'  - rock
    'p'  - paper
    'sc' - scissors
    'l'  - lizard
    'sp' - spock
    MSG

    choice = gets.chomp

    if VALID_CHOICES.include?(choice) || VALID_CHOICES_SHORTCUTS.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; Computer chose #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing! Good bye!")