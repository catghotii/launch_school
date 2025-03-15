VALID_CHOICES = { r: 'rock', p: 'paper', sc: 'scissors', l: 'lizard', sp: 'spock' }
WINNING_MOVES = { 
   :r  => [ :sc, :l  ] ,
   :p  => [ :r,  :sp ] , 
   :sc => [ :p,  :l  ] ,
   :l  => [ :sp, :p  ] ,
   :sp => [ :sc, :r  ]  
}

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == :r  && second == WINNING_MOVES[:r]) ||
  (first == :sc && second == WINNING_MOVES[:sc]) ||
  (first == :p  && second == WINNING_MOVES[:p]) ||
  (first == :l  && second == WINNING_MOVES[:l]) ||
  (first == :sp && second == WINNING_MOVES[:sp])
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