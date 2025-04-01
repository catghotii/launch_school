# TAROT_MEANINGS = 'tarot_meanings.txt'
MENU_VALID_OPTIONS = ['1', '2', '3', '4', 'x']
MENU_OPTIONS = { '1' => "past", '2' => "present", '3' => "future", 'x' => "exit" }
CATEGORIES = { '1' => :description, '2' => :love, '3' => :career, '4' => :finances }
UP_OR_REV = { '1' => :upright, '2' => :reversed }
VALID_CARDS = ['tower', 'temperance', 'devil']

def print_in_box(message)
  horizontal_rule = "+#{'~' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end

def print_empty_line
  puts "\n"
end

def prompt(message)
  puts "=> #{message}"
end

def feeling_lucky
end

def time_period_selection(menu_option)
  time_period_selection = MENU_OPTIONS[menu_option]
end

def card_selection
  card = ''
  loop do # card loop
    prompt("Enter your card:")
    card_input = gets.chomp.downcase

    if VALID_CARDS.include?(card_input)
      card = card_input
      break
    elsif card_input == 'help'
      prompt("Maybe it was the #{VALID_CARDS.sample.capitalize} card?")
    else
      prompt("Are you sure that's the card you picked? (You can ask for 'help'...)")
    end
  end

  display_card_meaning(card)
  card_reading(card, USER_TIME)

  # # read file
  # file = File.open(TAROT_MEANINGS, 'r')
  # # close file
  # file.close
end

def display_card_meaning(card)
  card_meanings = {
    :tower => { 
                :description => "The Tower card depicts a high spire nestled on top of the mountain. A lightning bolt strikes the tower which sets it ablaze. Flames are bursting in the windows and people are jumping out of the windows as an act of desperation. They perhaps signal the same figures we see chained in the Devil card earlier. They want to escape the turmoil and destruction within. The Tower is a symbol for the ambition that is constructed on faulty premises. The destruction of the tower must happen in order to clear out the old ways and welcome something new. Its revelations can come in a flash of truth or inspiration.",
              },
    :temperance => {
                :description => "On the Temperance card, there is an angel with wings, whose gender is not immediately obvious, which suggests that there is a balance between the sexes. One foot of the angel is in water, to represent the subconscious, while the other foot is on dry land, a representation of the material world. On her robe, there is a square, which has a triangle inscribed inside, another echo of the tangible earth in union with the holy trinity. She holds two cups in a manner where she can mix the waters, which represent the super and subconscious minds. The water flows between them, suggesting union and infinity.\n\nEverything about this card represents balance, the perfect harmony that comes from the union of dualities. Her advice is to test any new waters, before jumping into the deep end.",
              },
    :devil => {
                :description => "This card shows the Devil represented in his most well-known satyr form, otherwise known as Baphomet. Along with being half goat and half man, the devil has bat wings and an inverted pentagram on his forehead. He is standing on a pedestal, to which are chained a nude man and woman, as if to show that he has dominion over them.\n\nBoth the man and the woman have horns, as if to show that the more time they spend with the Devil, the less human they become. The chains make it appear as though the devil has taken them captive. The man has a flame on his tail while a woman has a bowl of grapes on her tail, which symbolizes their addiction to power and finer things in life, respectively.\n\nLooking closely, both the man and the woman don’t look happy.  Their individual power has been taken from them, leaving them exposed and ashamed in their nakedness.",
              }
            }

  selection = card.to_sym

  print_empty_line
  puts card_meanings[selection][:description]
  print_empty_line
end

def card_reading(card, time_period)
  card_orientation = ""
  loop do
    prompt("Upright or reversed?")
    puts("   1 - Upright")
    puts("   2 - Reversed")
    card_orientation = gets.chomp

    break if card_orientation == '1' || card_orientation == '2'
    prompt("Don't be like that...")
  end

  case card_orientation
  when '1'
    print_empty_line
    print_in_box("#{card.upcase}")
    print_empty_line
  when '2'
    print_empty_line
    print_in_box("#{card.upcase.reverse}")
    print_empty_line
  end

  loop do
    category_number = ""
    loop do
      puts "Select a category:"
      puts("   1 - What's the meaning of the #{UP_OR_REV[card_orientation].to_s.downcase} #{card.capitalize} card?")
      puts("   2 - Love love love~")
      puts("   3 - My career")
      puts("   4 - My finances")

      category_number = gets.chomp
      break if MENU_VALID_OPTIONS.include?(category_number)
    end

    display_upright_meanings(card, UP_OR_REV[card_orientation], CATEGORIES[category_number])

    answer = ""
      loop do
        prompt("Do you want to know more about your #{time_period}?")
        answer = gets.chomp.downcase

        break if answer.start_with?('y') || answer.start_with?('n')
        prompt("Yes or no?")
      end

      break if answer.start_with?('n')
  end
end

def display_upright_meanings(card, card_orientation, category)
  tower_meanings = {
    :upright => { 
                :description => "The Tower represents change in the most radical and momentous sense. It is for this reason that the card itself visually looks so unnerving. But it doesn't necessarily have to be truly frightening or ominous. Because at the heart of this card, its message is foundational, groundbreaking change.\n\nThe kind of event that the Tower card marks does not have to be something terrible, like a disaster or a great loss.  Change itself is a normal part of life that one has to embrace. But it can sometimes strike fear, for it means that we must abandon the truths that we have known prior to this event. The old ways are no longer useful, and you must find another set of beliefs, values and processes to take their place.\n\nBe positive, it is time for you to replace the old foundations of the past with something that is more genuine and will serve you better in what is to come.\n\nIn terms of work, there is an inevitable argument bound to happen. You need to be in control and keep your temper in check. Avoid saying something that may hurt other people. When it comes to your love life, your romantic relationship may be nearing its end. Take this as a warning - if you really value your relationship, then it is time for you to take damage control or open a communication to clear misunderstandings. In your finances, the tower meaning refers to the need to be assured on your transactions.", 
                :love => "The Tower tarot love meaning signals great fundamental changes. Relationships that have weak or crumbling foundations won’t last much longer, and may collapse. While initially painful, these clear the way for new experiences. Perhaps your relationship was incredibly important to your identity; you took pride in being a good partner or parent, making you stay even while you may have otherwise been unhappy. While these times may be trying, know that they will pass. Should you be single, it may not be a relationship that is being broken down, but your perspective and understanding of the entire notion of what love means to you. What beliefs about love are not serving your highest self? These need to be transformed so you can develop an individual understanding of what your needs are when it comes to relationships.", 
                :career => "There can be a lot of stress right now when it comes to your career; the Tower can signify a sudden job loss, or the attainment of a new position that creates chaos due to sudden increases in responsibility. Something from the outside environment, like a new boss, or the loss of a colleague could mean disasters happening in the workplace. It is important to remember that at this time, though things are frustrating, that it is possible for these temporary messes to lead to a better long term future, such as a job that suits you better, or a more peaceful workplace in the long term.",
                :finances => "It would be wise for you to make sure you have some funds put away right now. The Tower in its worst case scenario speaks of disaster, and in finances it is no different. There may be unwelcome surprises in store that can create a sudden loss of resources. These scenarios can serve as wake up calls; develop a resilient support system, and tend to the things that truly matter to you."
              },
    :reversed => {
                :description => "When you get the Tower card reversed, you can feel some crisis looming along the horizon, and you are struggling as much as you can to try and avoid its manifestation. What you have not realized is that these breakdowns can be beneficial in breaking down your reliance on something that is false. The tower is built on faulty foundations, and it must fall. Though the destruction will be painful, the humbleness resulting from it can bring us peace.\n\nWhat you relied on will no longer be there for you. Do not take this as a drastic and depressing change, it is time for you to become more self-reliant.",
                :love => "Change is never an easy thing to accept, but regardless of how much we resist it, it will come. If you see any problems in your relationship looming in the distance, this is your chance to deal with them now. Doing so may prevent bigger problems later. Are your resentments building up? What have you been keeping quiet because you think it’s not worth arguing over? Slowly, these things may turn into big issues that can uproot an otherwise happy relationship. Sometimes, this card can also signal that you may be ready to leave a relationship that has not been working.",
                :career => "Despite stressful situations at work, you may have been able to pull through. For example, if your workplace has gone through a series of layoffs or redundancies, you may find yourself amongst one of the lucky few that have managed to keep your job. This may come as a relief, or alternatively, can keep you from finding true fulfillment in your career. Sometimes, the Tower is the card that we all need to kick us out of our own stupor, and be motivated to leave the comfort of a monotonous job. This may be the chance you needed to open your eyes to what else could be awaiting you.",
                :finances => "If you’ve managed to successfully navigate yourself out of financial ruin, take the time to find a bit of relief. However, the Tower suggests that it may be better to accept that this needs to happen for you to move on. For example, if you’ve avoided bankruptcy by a hair by managing to pay off your debt for this month, it may be easier and healthier in the long run to accept your situation and declare bankruptcy. Or if you’ve purchased a home you can’t afford, and the mortgage payments are putting you underwater, it may be wiser for you to sell. Otherwise, one disaster is avoided, only to be restarted again next time; you may continue to have to struggle indefinitely. Consider what will ease your burden right now, and face the situation with a brave face."
              }
            }

  temperance_meanings = {
    :upright => { 
                :description => "In moments where there is anxiety or great stress, you have been able to remain calm throughout. You are a person who has mastered the art of not letting things get to you, and this allows you to achieve much progress in all areas you seek out to explore. The Temperance tarot card suggests moderation and balance, coupled with a lot of patience. Where this card appears, there is the suggestion that extremity in any situation is to be avoided.\n\nThe Temperance card implies that you have a clear vision and know what you want to achieve. This is an indication of higher learning, which is a critical attribute in the journey of life. It reflects that you have found peace with what you are doing and everything is unfolding as it ought to. The Temperance card, in relation to other people, shows that you are able to adapt and work in harmony with your community, your coworkers and your loved ones. Your calmness in all matters gives them comfort and puts them at ease.\n\nTemperance may also indicate a time to evaluate and re-examine the priorities you have chosen. This will help you create a balance between your outer and inner self. At the end of it all, you will find greater purpose and meaning in your actions, for her message is that we cannot live fully in either.", 
                :love => "In romance, the upright Temperance tarot love meaning suggests patience, moderation, understanding and going the middle path. This card indicates that we must avoid going to extremes, and to be cautious and thoughtful of our actions. Consider your actions when it comes to love; and in what aspects your attitudes, beliefs or thoughts can be excessive. Are you too pushy with potential partners? Or instead, are you too reserved? Are you too giving? Or are you not giving enough? How can you bring these traits into balance? In addition, your relationship or potential relationships may require some patience right now, and attempt to work together to find compromise and harmony.", 
                :career => "Patience and moderation may be helpful tools for you to achieve your career goals. You are likely to find what you desire when it comes to your work, but it may come slowly and quietly as you put in the work every day. Your dedication and ability to navigate emotionally charged situations at work with calm can help you be noticed by your peers and superiors. When it comes to making changes in your career path, the Temperance card can be a reminder to remain patient, steady and devoted; all good things take time. Temperance can also signal doing a good job in balancing your career with different aspects of your life; it is neither an all consuming ambition or just a paycheck to you.",
                :finances => "The Temperance card can be a call to make sure that your approach to your finances is one of moderation and balance. This can mean that you’ve been diligent with saving, while also being able to treat yourself with something you can afford every once in a while. Over time, you may be building your resources with steady, diligent saving."
              },
    :reversed => {
                :description => "Temperance in reversed is a reflection of something that is out of balance and may be causing stress and anxiety. The real meaning of the Temperance card can be deciphered using the other cards in the spread to identify areas where this imbalance is being caused. A Temperance in reversal may also be used as a warning;  if you take a certain path, it would lead to turbulence and excess.\n\nLack of a long-term plan or vision may also be the Temperance reversal meaning. This creates a lack of purpose for you, leaving you feeling lopsided as you search here and there for what you should be doing. You must reflect and think carefully about what needs to change. Temperance reminds us that all things are only good in moderation, and that we must examine in which aspects of our lives we are breaking the balance.",
                :love => "In love, do you tend to think in all or nothing terms? Love, like many things in life, are full of grey areas. When reversed Temperance appears in a love tarot reading, your intensity may be surprising right now. Sometimes, no matter our best efforts, we can’t force love to come into being. You may benefit from being a bit more patient, while also making sure that your own emotions or desires do not go into extremes. When your date does something that is displeasing to you, do you tend to immediately reject them? Are you too demanding on your potential partners, so that nobody ever can satisfy you? It’s important to remember that humans can never be perfect; make sure your desires are reasonable.",
                :career => "Something at work may be suffering from a lack of balance right now. Do you tend to go all in when it comes to your work, so much so that other aspects of your life suffer? Are you always pulling all-nighters, hoping that it all pays off in the end? Or alternatively, do you find that you slack off, leading to resentment from your colleagues? While the former can bring you success, this can be damaging to you in the long term. If this applies to you, look to correct this imbalance. Ensure that when completing projects, you aren’t rushing through them or making reckless choices; the quality of your work may be suffering.",
                :finances => "Are you someone who always needs to buy yourself the next nice luxury? Or alternatively are you so frugal that you never reward your hard efforts with any small treat? It’s likely that both of these attitudes will need adjustment, as they are both untenable in the long term. The first always puts instant gratification over your future comfort, and vice versa. Consider your financial goals, and make sure you also put your own well-being in the picture; both your future well-being, and your present well-being needs to find a comfortable middle ground."
              }
            }

  devil_meanings = {
    :upright => { 
                :description => "Getting the devil card in your reading shows that you have feelings of entrapment, emptiness and lack of fulfillment in your life. It might also mean that you are a slave to materialism and opulence and no matter how hard you try, you just can’t seem to shake off the feeling of wanting to indulge in luxurious living.\n\nYou might be aware that this kind of lifestyle is leading you down the rabbit hole, but you have that feeling of not having any form of control over your actions or urges.\n\nAddiction to substances or material pleasures can also be the reason for your feelings of powerlessness and entrapment. In situations such as these, you may feel as though you are a slave, unable to control your impulses or willpower to direct yourself towards something other than the satisfaction of these desires.", 
                :love => "Lust and temptation are symbolized by the Devil in a love tarot reading. There can be a sense of hedonism, and a selfish desire for gratification with this card. In less serious circumstances, it can also just simply mean a pursuit for all of life’s earthly pleasures. There is nothing wrong in having a bit of fun, but make sure that you are not hurting others or giving them wrong impressions when you do. If you’re only looking for hook-ups, it is up to you to communicate that with your dates. Make sure you avoid pressuring others if they decide your lifestyle isn’t something that suits them. Communication will be more important than ever now.\n\nAlternatively, the Devil tarot love meaning can also signal addiction, and in the context of love and relationships, co-dependency. Over time, this can be destructive to the individuality and self of both partners. Be wary, and ensure that the two of you remain strong individuals within your relationship.", 
                :career => "You may feel stuck or trapped when it comes to your career right now, like you don’t have any options but to stay somewhere that you dislike. In this state, it may be easier to blame your circumstances, bad luck, or a host of external factors. You may feel dependent on this job, without the power to make the changes that would bring you happiness. At times, this card can also signal self-sabotage and playing the victim when it comes to work relations with your colleagues. Regardless of what it feels like, the Devil’s appearance can signal that you have more choices than you think you do, you only need to reclaim your power. This can be scary, to take accountability for a situation that you dislike, but it can also be empowering.",
                :finances => "Difficult financial situations may be exaggerated with bad habits with the Devil in the reading. This can signal that there is often more that you can do to bring yourself out of this state, but you may be either failing to see the solutions, or you are unable to change the way that you handle your finances. You may be spending compulsively, gambling, or unable to take control of your material resources. Make sure you are doing all that you can."
              },
    :reversed => {
                :description => "The upside down meaning of the Devil card can be the moment when an individual becomes self-aware and breaks all of the chains that come with addiction and poor habits. It might be because they are tired of running in circles and are in need of change.\n\nBut one thing is usually clear – breaking off these chains, especially those of addiction is never easy. So, one has to be prepared to make the necessary changes that might initially seem painful to make the adjustments that will pay off in the end by being able to find your true self again.\n\nSelf-assessment is called for in this case and the individual needs to take some time and list all of the things that they need to get rid of. And once that has been done, and then it would be time for them to embark on the difficult journey of self-improvement.",
                :love => "The reversed Devil tarot love meaning can signal that you may be breaking free from some negative emotional patterns or addictions that have stood in the way of you developing strong relationships. You may feel more in control of your love life than ever. This card in some circumstances can also signal breaking away from a relationship with a domineering partner, or a co-dependent relationship that was not allowing you to express your true self. You may have recognized that the bonds that tied you to your partner were ones that were not healthy or supportive. Continue to nurture your own independence and be proud of what you have done.",
                :career => "When it comes to work, you are in the process of reclaiming your accountability in your career choices, and are in the process of making some much needed changes to avoid future issues. If you’ve been in a position that you’ve found stifling, you may be taking action; whether that means leaving an unfulfilling job, or an unhealthy environment, or choosing to fix a strained relationship with a colleague. You may no longer feel dependent on your job for a sense of stability, understanding that you can find it within yourself. Take note of the changes that occur when you rediscover your independence.",
                :finances => "If you’ve had a history of bad financial habits, you may be working on making the changes necessary for you to retake control. If you’ve been dependent on others for your material resources, like a partner, or family members, you may be enjoying a new sense of independence."
              }
            }

  case card
  when "tower"
    print_empty_line
    puts tower_meanings[card_orientation][category]
    print_empty_line
  when "temperance"
    print_empty_line
    puts temperance_meanings[card_orientation][category]
    print_empty_line
  when "devil"
    print_empty_line
    puts devil_meanings[card_orientation][category]
    print_empty_line
  end
end

# greeting message
print_in_box("Welcome to the Tarot Reader!")
print_empty_line

puts "What's your name?"
USERNAME = gets.chomp.capitalize

print_empty_line

# menu loop
loop do
  print_in_box("Your path to spiritual self-awareness begins here...")

  puts "Select from the following options:"
  puts("   1 - The past...")
  puts("   2 - The present...")
  puts("   3 - The future...")
  puts("   X - I've seen enough...")

  selection_choice = gets.chomp.downcase

  case selection_choice
  when "1"
    USER_TIME = time_period_selection(selection_choice)
    print_in_box("A reading for the #{USER_TIME}...")
    card_selection
  when "2"
    USER_TIME = time_period_selection(selection_choice)
    print_in_box("A reading for the #{USER_TIME}...")
    card_selection
  when "3"
    USER_TIME = time_period_selection(selection_choice)
    print_in_box("A reading for the #{USER_TIME}...")
    card_selection
  when "x"
    puts lyrics = <<-OUTRO
  ♪ ♪ ♪ 
      You wonder
      If you can even be seen
      From so far away
      A slow pull
      A seismic drift
      Leaning over the edge of the continent
      It's so hard to come back
      You hang on
      Until it drags
      You under, you under
      You under, you under...
                          ♪ ♪ ♪
  OUTRO
    break
  else
    print_empty_line
    prompt("You MUST pick one.")
    print_empty_line
  end
end

print_empty_line
puts "SOURCE: LABYRINTHOS.CO"
print_empty_line
puts "See you next time, #{USERNAME}..."