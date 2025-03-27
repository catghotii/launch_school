# 3/ Keep score of the player's and computer's wins. When either the player or computer reaches three wins, the match is over, and the winning player becomes the grand winner. Don't add your incrementing logic to `display_results`. Keep your methods simple; they should perform one logical task — no more, no less.

VALID_CHOICES = { r: 'rock', p: 'paper', sc: 'scissors', l: 'lizard', sp: 'spock' }
BEST_OF = 3
OUTCOMES = 3

def prompt(message)
  puts "=> #{message}"
end

def print_new_line
  puts "\n"
end

def win?(first, second)
  (first == :r && (second == :sc || second == :l)) ||
  (first == :sc && (second == :p || second == :l)) ||
  (first == :p && (second == :r || second == :sp)) ||
  (first == :l && (second == :sp || second == :p)) ||
  (first == :sp && (second == :sc || second == :r))
end

def round_outcome(first, second)
  if win?(first, second)
    return :player
  elsif win?(second, first)
    return :computer
  else
    return :tie
  end
end

def match_over?(score_card)
  (score_card[:player] == BEST_OF || score_card[:computer] == BEST_OF) ? false : true
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("...You win!")
  elsif win?(computer, player)
    prompt("...Computer wins!")
  else
    prompt("...It's a tie!")
  end
end

def display_score(score_card)
  print_new_line
  score_card.each_pair { |key, value| puts "#{key.capitalize}: #{value}" }
  print_new_line
end

def display_champion(score_card)
  champion = score_card.key(3)
  if champion == :player
    prompt("YOU ARE THE CHAMPION!")
  elsif champion == :computer
    prompt("YOU LOSE!")
  end
end

def display_tournament_results(results)
  results.each do |key, val|
    puts "Round #{key}:"
    puts "#{val}"
  end
end

loop do
  score_card = { :player => 0, :computer => 0, :tie => 0 }
  match_status = true
  round_number = 1
  tournament_results = Hash[]
  running_score_card = { :player => 0, :computer => 0, :tie => 0 }
  end_of_round = [0, 0, 0]
  end_of_round_scores = { :player => 0, :computer => 0, :tie => 0 }

  puts "Welcome to the Rock Paper Scissors Lizard Spock Championships!".upcase.center(80)
  print_new_line
  puts "Scissors cuts Paper covers Rock crushes".center(80)
  puts "Lizard poisons Spock smashes Scissors".center(80)
  puts "decapitates Lizard eats paper disproves".center(80)
  puts "Spock vaporizes Rock crushes Scissors.".center(80)
  print_new_line
  print_new_line
  prompt("The game stops when one player reaches #{BEST_OF} wins.")
  print_new_line

  while match_status
    choice = ''

    loop do
      prompt("Round #{round_number}!")
      print_new_line
      prompt <<-MSG
      Choose one: #{VALID_CHOICES.values.join(', ')}.
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

    display_score(score_card)

    round_result = round_outcome(choice, computer_choice)

    current_round = running_score_card.map do |key, val|
                  if key == round_result
                    val += 1
                  else
                    val = 0
                  end
    end

    count = 0
    while count < OUTCOMES
      end_of_round[count] += current_round[count]
      count += 1
    end

    tournament_results[round_number] = { :player => choice, :computer => computer_choice, :round_result => round_result, :cumulative_scores => {:player => end_of_round[0], :computer => end_of_round[1], :tie => end_of_round[2] } }

    match_status = match_over?(score_card)
    round_number += 1
  end

  print_new_line
  display_champion(score_card)

  answer = ''
  loop do
      prompt <<-MSG
      Enter:
      '1'  - View match results
      '2'  - View rules of the game
      '3'  - I want a rematch!
      'Q'  - Quit
      MSG
    answer = gets.chomp.downcase

    case answer
    when '1'
      display_tournament_results(tournament_results)
    when '2'
      prompt("https://www.samkass.com/theories/RPSSL.html")
      print_new_line
      puts "Scissors cuts Paper covers Rock crushes\nLizard poisons Spock smashes Scissors\ndecapitates Lizard eats paper disproves\nSpock vaporizes Rock crushes Scissors."
      print_new_line
    when '3'
      break
    when 'q'
      break
    end
  end
  break if answer == 'q'
end

prompt("Thanks for playing! Good bye!")