VALID_CHOICES = { r: 'rock', p: 'paper', sc: 'scissors', l: 'lizard', sp: 'spock' }

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == :r && (second == :sc || second == :l)) ||
  (first == :sc && (second == :p || second == :l)) ||
  (first == :p && (second == :r || second == :sp)) ||
  (first == :l && (second == :sp || second == :p)) ||
  (first == :sp && (second == :sc || second == :r))
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
    Choose one: #{VALID_CHOICES.values}."
    Enter:
    'r'  - rock
    'p'  - paper
    'sc' - scissors
    'l'  - lizard
    'sp' - spock
    MSG

    choice = gets.chomp.to_sym

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.keys.sample

  prompt("You chose #{VALID_CHOICES[choice].to_s}; Computer chose #{VALID_CHOICES[computer_choice].to_s}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing! Good bye!")