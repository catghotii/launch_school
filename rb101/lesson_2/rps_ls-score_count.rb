# 3/ Keep score of the player's and computer's wins. When either the player or computer reaches three wins, the match is over, and the winning player becomes the grand winner. Don't add your incrementing logic to `display_results`. Keep your methods simple; they should perform one logical task — no more, no less.

VALID_CHOICES = { r: 'rock', p: 'paper', sc: 'scissors', l: 'lizard', sp: 'spock' }
BEST_OF = 3

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

def grand_winner?(player, computer)
  (player == BEST_OF || computer == BEST_OF) ? false : true
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

def display_score(player, computer, tie)
  prompt("The score is player: #{player}, computer: #{computer}. #{tie} draws.")
end

def display_grand_winner
  prompt("And the champion is....")
end

score_card = { :player => 0, :computer => 0, :tie => 0 }
match_status = true

while match_status
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

    break if VALID_CHOICES.include?(choice)
    prompt("That's not a valid choice.")
  end

  computer_choice = VALID_CHOICES.keys.sample

  prompt("You chose #{VALID_CHOICES[choice].to_s}; Computer chose #{VALID_CHOICES[computer_choice].to_s}")

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    score_card[:player] += 1
  elsif win?(computer_choice, choice)
    score_card[:computer] += 1
  else
    score_card[:tie] += 1
  end

  display_score(score_card[:player], score_card[:computer], score_card[:tie])

  match_status = grand_winner?(score_card[:player], score_card[:computer])
end

display_grand_winner
prompt("Thanks for playing! Good bye!")