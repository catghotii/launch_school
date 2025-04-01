# TAROT_MEANINGS = 'tarot_meanings.txt'
VALID_CATEGORY_OPTIONS = ['1', '2', '3', '4', '5', 'x']
EXTRA_MENU_OPTIONS = ['x']
MENU_OPTIONS = { '1' => "past", '2' => "present", '3' => "future", 'x' => "exit" }
CATEGORIES = { '1' => :description, '2' => :love, '3' => :career, '4' => :finances }
UP_OR_REV = { '1' => :upright, '2' => :reversed }
VALID_CARDS = ['tower', 'temperance', 'devil', 'the empress', 'ten of cups', 'the emperor']
VALID_ORIENTATION = [ 'upright', 'reversed' ]

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

def print_source
  print_in_box("SOURCE: LABYRINTHOS.CO")
end

def prompt(message)
  puts "=> #{message}"
end

def titleize(string)
  string.split.map(&:capitalize).join(' ')
end

def remove_article(string)
  string.delete_prefix('the').lstrip
end

def time_period_selection(menu_option)
  time_period_selection = MENU_OPTIONS[menu_option]
end

def manual_card_selection(user_time)
  card = ''
  loop do
    prompt("Enter your card:")
    card_input = gets.chomp.downcase

    if VALID_CARDS.include?(card_input)
      card = card_input
      break
    elsif card_input == 'help'
      prompt("Was it the #{titleize(remove_article(VALID_CARDS.sample))} card?")
    else
      prompt("Are you sure that's the card you picked? (You can ask for 'help'...)")
    end
  end

  print_empty_line
  card_orientation_number = ""
  loop do
    prompt("Upright or reversed?")
    print_empty_line
    puts("   1 - Upright")
    puts("   2 - Reversed")
    print_empty_line

    card_orientation_number = gets.chomp

    break if card_orientation_number == '1' || card_orientation_number == '2'

    error_messages = ["There's no turning around...", "There's no turning around...".reverse, "You can't reverse destiny...", "You can't reverse destiny...".reverse]
    prompt(error_messages.sample)
  end

  card_orientation_sym = UP_OR_REV[card_orientation_number]
  print_description(card)
  card_reading(card, card_orientation_sym, user_time)

  # # read file
  # file = File.open(TAROT_MEANINGS, 'r')
  # # close file
  # file.close
end

def card_reading(card, card_orientation, time_period)
  case card_orientation
  when :upright # upright
    print_empty_line
    print_in_box("#{card.upcase}")
    print_empty_line
  when :reversed # reversed
    print_empty_line
    print_in_box("#{card.upcase.reverse}")
    print_empty_line
  end

  loop do
    category_number = ""
    loop do
      puts "Select a category:"
      print_empty_line
      puts "   1 - What's the meaning of the #{card_orientation.to_s.capitalize} #{titleize(remove_article(card))} card?"
      puts "   2 - Love love love~"
      puts "   3 - My career"
      puts "   4 - My finances"
      puts "   X - Go back"

      category_number = gets.chomp
      break if VALID_CATEGORY_OPTIONS.include?(category_number) || EXTRA_MENU_OPTIONS.include?(category_number)
    end

    break if EXTRA_MENU_OPTIONS.include?(category_number)
    print_meanings(card, card_orientation, CATEGORIES[category_number])

    # answer = ""
    #   loop do
    #     prompt("Do you want to know more about your #{time_period}?")
    #     answer = gets.chomp.downcase

    #     break if answer.start_with?('y') || answer.start_with?('n')
    #     prompt("Yes or no?")
    #   end

    #   break if answer.start_with?('n')
  end
end

def feeling_lucky
  shuffle_deck = VALID_CARDS.shuffle
  spread_array = []
  spread_array.push(shuffle_deck[0], shuffle_deck[1], shuffle_deck[2])
  spread_hash = Hash[spread_array.map {|card| [card, VALID_ORIENTATION.sample]}]

  card_1 = spread_array[0]
  card_1_orientation = spread_hash[spread_array[0]]
  card_2 = spread_array[1]
  card_2_orientation = spread_hash[spread_array[1]]
  card_3 = spread_array[2]
  card_3_orientation = spread_hash[spread_array[2]]

  print_empty_line
  print_empty_line
  puts "S h u f f l i n g ..."
  print_empty_line
  print_empty_line
  puts "Your Tarot Spread:"

  loop do
    print_empty_line
    print_card_spread(spread_array, spread_hash)
    print_empty_line
    puts "Select an option to read more about your card spread:"
    print_empty_line
    puts "   1 - The Past: #{spread_hash[spread_array[0]].capitalize} #{titleize(remove_article(card_1))}"
    puts "   2 - The Present: #{spread_hash[spread_array[1]].capitalize} #{titleize(remove_article(card_2))}"
    puts "   3 - The Future: #{spread_hash[spread_array[2]].capitalize} #{titleize(remove_article(card_3))}"
    puts "   4 - What does this 3 card tarot spread mean?"
    puts "   X - I've seen enough..."
    print_empty_line

    choice = gets.chomp.downcase

    case choice
    when "1"
      user_time = time_period_selection(choice)
      print_in_box("A reading for the #{user_time}...")
      print_empty_line
      print_in_box("The #{titleize(remove_article(card_1))} Tarot Card Description")
      print_description(card_1)
      card_reading(card_1, card_1_orientation.to_sym, user_time)
    when "2"
      user_time = time_period_selection(choice)
      print_in_box("A reading for the #{user_time}...")
      print_empty_line
      print_in_box("The #{titleize(remove_article(card_2))} Tarot Card Description")
      print_description(card_2)
      card_reading(card_2, card_2_orientation.to_sym, user_time)
    when "3"
      user_time = time_period_selection(choice)
      print_in_box("A reading for the #{user_time}...")
      print_empty_line
      print_in_box("The #{titleize(remove_article(card_3))} Tarot Card Description")
      print_description(card_3)
      card_reading(card_3, card_3_orientation.to_sym, user_time)
    when "4"
      puts "----under construction----"
    when "x"
      break
    end
  end
end

def print_card_spread(spread_array, spread_hash)
  card_1 = if spread_hash[spread_array[0]] == "upright"
             "#{spread_array[0].upcase}"
           elsif spread_hash[spread_array[0]] == "reversed"
             "#{spread_array[0].upcase.reverse}"
           end

  card_2 = if spread_hash[spread_array[1]] == "upright"
             "#{spread_array[1].upcase}"
           elsif spread_hash[spread_array[1]] == "reversed"
             "#{spread_array[1].upcase.reverse}"
           end

  card_3 = if spread_hash[spread_array[2]] == "upright"
             "#{spread_array[2].upcase}"
           elsif spread_hash[spread_array[2]] == "reversed"
             "#{spread_array[2].upcase.reverse}"
           end

  card_spacing = '  '
  horizontal_rule = "+#{'~' * (card_1.size + 2)}+" + card_spacing + "+#{'~' * (card_2.size + 2)}+" + card_spacing + "+#{'~' * (card_3.size + 2)}+"
  empty_line = "|#{' ' * (card_1.size + 2)}|" + card_spacing + "|#{' ' * (card_2.size + 2)}|" + card_spacing + "|#{' ' * (card_3.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{card_1} |" + card_spacing + "| #{card_2} |" + card_spacing + "| #{card_3} |"
  puts empty_line
  puts horizontal_rule
end

def print_description(card)
  card_meanings = {
    :tower => { 
                :description => "The Tower card depicts a high spire nestled on top of the mountain. A lightning bolt strikes the tower which sets it ablaze. Flames are bursting in the windows and people are jumping out of the windows as an act of desperation. They perhaps signal the same figures we see chained in the Devil card earlier. They want to escape the turmoil and destruction within. The Tower is a symbol for the ambition that is constructed on faulty premises. The destruction of the tower must happen in order to clear out the old ways and welcome something new. Its revelations can come in a flash of truth or inspiration.",
              },
    :temperance => {
                :description => "On the Temperance card, there is an angel with wings, whose gender is not immediately obvious, which suggests that there is a balance between the sexes. One foot of the angel is in water, to represent the subconscious, while the other foot is on dry land, a representation of the material world. On her robe, there is a square, which has a triangle inscribed inside, another echo of the tangible earth in union with the holy trinity. She holds two cups in a manner where she can mix the waters, which represent the super and subconscious minds. The water flows between them, suggesting union and infinity.\n\nEverything about this card represents balance, the perfect harmony that comes from the union of dualities. Her advice is to test any new waters, before jumping into the deep end.",
              },
    :devil => {
                :description => "This card shows the Devil represented in his most well-known satyr form, otherwise known as Baphomet. Along with being half goat and half man, the devil has bat wings and an inverted pentagram on his forehead. He is standing on a pedestal, to which are chained a nude man and woman, as if to show that he has dominion over them.\n\nBoth the man and the woman have horns, as if to show that the more time they spend with the Devil, the less human they become. The chains make it appear as though the devil has taken them captive. The man has a flame on his tail while a woman has a bowl of grapes on her tail, which symbolizes their addiction to power and finer things in life, respectively.\n\nLooking closely, both the man and the woman don’t look happy.  Their individual power has been taken from them, leaving them exposed and ashamed in their nakedness.",
              },
    :"the empress" => {
                :description => "The Empress depicts a woman sitting on a throne. From the abundant nature that surrounds her, we can assume that this woman represents the Earth Mother archetype, a goddess of fertility. Her world is ruled by venus which means that there is complete love, harmony, fertility and luxury by the grace of this goddess. The woman herself has blonde hair crowned with stars, signaling her divine connection with the mystical realm. She is dressed in a pomegranate-patterned robe that represents fertility, and she is seated on cushions embroidered with a venus sign. She is surrounded by an enchanting green forest with a river streaming through it. The Empress brings abundance and blessings in the readings of those she meets.",
              },
    :"the emperor" => {
                :description => "In the Emperor tarot card, a stoic ruler figure can be seen on his throne, which is adorned with the heads of four rams, representing his astrological sign - Aries. In one hand, he carries a scepter, representing his reign and his right to rule, and in the other an orb, a symbol of the kingdom that he watches over. The long beard of the emperor represents his vast experience; over time he has learned much about what it takes to rule, to establish power, authority and complete order for the benefit of his people.\n\nBehind him, the barren mountains shows his determination, his ambition for greater heights and his leadership capability. Contrast this with his complement, the Empress, whose flowing fields are filled with nurturing kindness. The Emperor instead rules with grit, strength and force.",
              },
    :"ten of cups" => {
                :description => "On the Ten of Cups, there is a couple holding each other while facing a beautiful house and a green garden. Beside them, there are two children playing joyously. The couple is seen holding each other in a loving and romantic embrace, while the children are freely playing. The couple seems to be in a stable relationship, while also blessed with the abundance of a comfortable home and beautiful children. The green land signifies fertility, and the river shows how freely the feelings of the couple are flowing, meaning that their relationship is quite peaceful. Above in the sky, there are ten cups, shaped in an arc, which are meant to symbolize blessings from heaven. The rainbow behind them shows the end of hard times and sorrows, and a new happy life where each and every one of the family will enjoy. The Ten of Cups card depicts ‘having it all’.",
              }
            }

  selection = card.to_sym

  print_empty_line
  puts card_meanings[selection][:description]
  print_empty_line
end

def print_meanings(card, card_orientation, category)
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

  empress_meanings = {
    :upright => { 
                :description => "The Empress shows us how deeply we are embedded to our femininity. Femininity could be associated with fertility, expression, creativity and nurturing among many other aspects. It therefore calls you to connect with beauty and bring happiness to your life. Understand yourself and get in touch with your sensuality so that you can attract life circumstances to bring happiness and joy. She is a signal that be kind to yourself, to take care of yourself.\n\nThe Empress is also a strong indication of pregnancy and motherhood. You can look for other cards to confirm if this is truly pregnancy, or rather just an indication of a motherly, nurturing and caring attitude. The Empress card could also mean the birth of a new idea, business or project on your life. Owing to the good fortune that surrounds this card, you can be sure that such situations and projects would end successfully in your life. Discover and bring forth those ideas that have been clinging to you and make sure that you devote yourself towards accomplishing them. This card is a sign that they are going to be successful, and well taken care of. The Empress, as the archetype of the mother earth, also encourages you to spend time interacting with nature, the mother of all of us.", 
                :love => "The Empress tarot love meaning stems from the element of earth. The person represented by this card can be loving, nurturing and caring, as has financial security or appreciative of beautiful, comforting things. Sometimes, the Empress can point to love and work coming together, either with a coworker, or perhaps a new business venture.\n\nWhen it comes to relationships, this card also heralds a stable, serious and committed relationship. Because the card also represents motherhood, sometimes it can also signal marriage or pregnancy, or at least a new family, in whatever form that means for you.", 
                :career => "Your career right now may be enjoying a boost right now. You may be more creative and passionate than usual, and putting all your ideas to work in your projects. Since the Empress is related to nourishment and nurturing, it may also suggest that you’re feeling particularly nurturing and generous when it comes to your workplace as well. You may be working on making a more harmonious and welcoming office, whether that means being supportive of coworkers, or putting a new coat of paint at your home office. Having the environment to do your best can certainly give you even more momentum. Sometimes, this card can also point to another person in your workplace that has these qualities.",
                :finances => "The Empress is abundant both creatively and materially, so this card can point to a comfortable financial situation. You may also be feeling very generous with your money now, wanting to nourish your friends and family with your abundance and good luck. It is certainly a good time to share what you have."
              },
    :reversed => {
                :description => "The Empress reversed indicates that you have lost too much of your own willpower and strength because you have started placing too much effort and concern to other people’s affairs. While the Empress's nature is of showering her loved ones with attention and care, this can sometimes go overboard. You might be neglecting your own needs, or even smothering the ones you love with your well-intentioned actions.\n\nIn a role reversal, perhaps a reversed Empress is finding her way into your life; it could also mean that you are relying on others to take care of you, and make decisions for you. You need to work towards removing this influence on your life, and build confidence in your own actions. Always try as much as you can to ensure that you solve matters on your own.",
                :love => "The reversed Empress love tarot meaning can represent a partner is too smothering, controlling or alternatively, unable to express their feelings. The card can also signal that one's self-worth may need a boost. Without feeling worthy of being loved, it doesn't matter who you are with, you may have difficulties maintaining that relationship.\n\nIf you're in a relationship, the Empress in a love tarot meaning can be encouragement to spend some quality time together, and care for eachother. Give yourself a treat by having a date at a restaurant, or a walk holding hands. These moments will bring you two closer together.",
                :career => "Your career may be feeling stale, tedious and unfulfilling right now. It may feel that you’re making little progress when it comes to developing your skills and abilities. The work is monotonous, and perhaps you’ve already mastered what you can do in this position. You may feel that others don’t appreciate the work you’re doing, further adding to your frustration. At times, this card also can point to a feeling of being insecure when it comes to your career. This may also be causing the other problems you’re experiencing. It’s important to take the time now and sort out which of these are problems that require an external change, like switching jobs, versus an internal one, like developing better confidence and communication skills.",
                :finances => "Since the Empress is generally a great card to have with finances, even in the reversed position, she still signals a comfortable amount of financial stability. However, in reverse, she may suggest that despite you having enough, you may still feel unstable. Sometimes, this can come from growing up in poverty, or is just the nature of being self-employed. You may have to do some internal work to understand why this is so; and what you can do to change it. Continue to be responsible with your finances, and it’s likely you’ll be fine."
              }
            }

  emperor_meanings = {
    :upright => { 
                :description => "It’s all about control when it comes to the Emperor, for this card means authority, regulation, organization and a fatherliness. The Emperor represents a strategic thinker who sets out plans that he must see through. He is a symbol of the masculine principle - the paternal figure in life that gives structure, creates rules and systems, and imparts knowledge. Where the Empress's desire for their kingdom is to create happiness, the emperor desires to foster honor and discipline. He guides with a firm hand, following the calling of the crown above all else. Though he is a ruler, he understands that to reign is also to serve - thus he acts rationally and according to what is for the greater good of the kingdom.\n\nTo see him in a reading presents a chance to grow in terms of the goals that you have set for yourself. It presents a successful future as long as you pursue your goals similar to the fashion that the Emperor does, methodically, and strategically.\n\nWhen you see him in a reading, a possible interpretation is that you could be put in charge of something important. It could be a position at work or in any kind of organization or institution that desperately needs order and a clear decisive mind. You may be called to act in the place of the Emperor, using his wisdom to bring clarity to the project.", 
                :love => "Although the Emperor is a very serious man, without any real sense of romance, its appearance in a love tarot reading can still be beneficial. The Emperor tarot love meaning asks us to bring common sense, structure, discipline and logic to relationships and romance. Relationships around this tarot card may be rather traditional, and perhaps stifling if not handled too carefully.\n\nAs a person, the Emperor represents someone older and well-established, that may also have a hard time expressing their feelings. Sometimes, this card however, can also symbolize a person driven by ego, who is domineering and bullying, and unable to empathize with others.", 
                :career => "Your career may be flourishing due to your hard work, concentration and organized approach. The Emperor calls on you to be disciplined, efficient and persistent when it comes to getting what you want out of your job, or job search. If your office, or your work process is a bit chaotic or frustrating right now, it may be helpful for you to step up and introduce new methodologies or structures that can help you and your teammates collaborate more efficiently. This card can also point to having a more senior colleague or boss that can provide you with support and advice in your career.",
                :finances => "When it comes to your finances, the Emperor signals the need to be controlled, disciplined and responsible with your money. Make sure that you have a clear understanding of where your money is going; put together a budget, make sure you stick to it, and check in every month or so. So long as you can keep it up, you’ll likely be in a good financial position."
              },
    :reversed => {
                :description => "The Emperor reversed is a sign of abused authoritative power. In your social life, it can manifest in the overreach of power from a father figure or a possessive partner. In career readings, it could be coming from a superior. It presents a man who wants to take control of your actions and makes you feel powerless.  It could also be that you are playing the part of a weak ruler, hatching a plan to avoid the tasks that come with having responsibility. Perhaps you aspire for a career that is more flexible than one that is governed by strict rules.\n\nLack of self-control and inability to handle situations can be represented by the Emperor on a personal level. When he is reversed, the structures, rules and systems that he creates are no longer working. His desire to inspire higher principles in his kingdom have turned to ruthlessness, tyranny and rigidity. He seeks to dominate, forgetting his call from the crown to do what is best for his people, fearing only for his loss of control and thus creating suffering.",
                :love => "The reversed Emperor tarot love meaning can signal some kind of power struggle or a fight for dominance when it comes to love and relationships. Instead of coming together with your different ideas, there may be competitiveness and a desire to just be right.\n\nThis card can also signal an overbearing partner, whether it's you or your other half. Be careful that you don't give up too much of your personal power, or repress who you are in order to be in this relationship. Alternatively, this card can also signal difficulty emotionally connecting in your relationship or potential relationships.",
                :career => "Without focus or discipline, your work may start to falter. If you’ve been lacking these qualities in the workplace, you may notice that it is taking a toll on your projects. Sometimes, this card can also suggest rigidity and bureaucracy in your work environment. This may stifle your sense of creativity and motivation, since the processes needed to do anything have been tedious and frustrating. At worst, the reversed Emperor can point towards a senior employee or boss that rules the workplace like a tyrant. Should this be your situation, it may be better to start looking for employment elsewhere.",
                :finances => "You may feel like your finances are out of your control right now. The reversed Emperor can suggest one’s inability to properly deal with one’s financial situation. Sometimes, it can also suggest lack of discipline when it comes to spending. If the former is your case, you may want to find a professional that can help you. If the latter applies instead, you’ll really need to take a closer look at what you’re earning versus what you’re spending, and learn to cut things out."
              }
            }

  ten_of_cups_meanings = {
    :upright => { 
                :description => "From its joyful depiction, we can assume that the Ten of Cups embody happiness, joy, contentment and emotional satisfaction in your family, relationship or companion. It represents an idyllic state of comfort, harmony, peace and love which makes you feel like you are in paradise. This is where all your dreams, wants, needs and wishes have been fulfilled, and you feel a complete sense of satisfaction. Take a moment and breathe, look around you and be thankful for all your blessings. This card signifies something that so many of us are searching for.\n\nTo see the Ten of cups is to indicate a true emotional fulfillment - one where the lonely self-satisfaction of the Nine of Cups is shared with others to create a true sense of community and family. It is the crystallization of the innocent will of the ace of cups. After learning how to love oneself, the Nine of Cups matured into the Ten of Cups, which at its core about how true happiness stems from forging authentic bonds and connections with others. This card is most associated with a sense of 'happily ever after' - of family, of lasting harmony and peace.\n\nThis is an indication of harmonious family, for the card shows you that you are living in the perfect peace. No more adjustments or shifting is needed, you are in the right, just relax and enjoy your moment. In a love reading, this card shows that it is romantic, real and genuine - and has a strong potential for something long term. It deserves all your effort to make it come true.\n\nThe Ten of Cups could also indicate a family holiday where you can relax and spend time with family members.", 
                :love => "Love is calm and sweet with the 10 of Cups tarot love meaning. Spending time with your family can be particularly rewarding right now. You may be introducing your partner to your family, or taking the next step in your commitment together. The 10 of Cups tarot love meaning also suggests long term stability, tranquility and comfort. If you’re single, and you meet someone at this time, it’s likely that the relationship will be one that lasts.", 
                :career => "Though the ten of cups is often more connected to family than work, this card can also bring some joy to your career. This card can signify a kind of comfort and belonging that you find from your current position. There is enough opportunity for growth and creativity that you do not need to worry about these aspects of your career. There is also likely cohesion and happiness between you and your coworkers, and the office culture can feel welcoming and supportive. You may find that the job gives you a comfortable work-life balance as well, and you have the security of spending a good chunk of time with your family. The card can also signify retirement or leaving a job to take care of a family.",
                :finances => "Since the ten of cups signals family stability and harmony, you may find that you and your loved ones have what you need to feel happy and comfortable. This doesn’t always translate to wealth, but the knowledge that there is enough for a feeling of stability and security. If you’ve previously had fights with family over financial issues, these may now dissipate."
              },
    :reversed => {
                :description => "When the Ten of Cups is reversed, the strong bonds that one forges with family and community are broken, or twisted. The Ten of Cups is truly the most 'happily ever after' card, but somehow this idealized image of domestic peace and comfort is broken, or was unrealistic all along. Instead of connections, you may find distance. Instead of coming together, you may be pulling apart.\n\nYour hopes for happy times and special moments seem to not meet your expectations. You should learn to treat each other well, love each other and care for each other. This is the best way to ensure that you retain your harmonious living.",
                :love => "Clashes between family and love can be suggested by the 10 of Cups tarot love meaning. External matters may be creating chaos in your romantic life, including meddling relatives that believe you are not meant to be together. It is important now more than ever to face criticisms from family as a unit; defend each other and avoid public arguments. Ensure that your partner feels loved even during this turbulent time.",
                :career => "When the ten of cups is reversed in a career reading, you may be dealing with a feeling of tension, loneliness and frustration at work. The atmosphere is more hostile than usual, and your colleagues may not be supportive right now. You may be left with the feeling that you don’t quite belong in this position, and your basic sense of stability and security may feel shaken. Sometimes, this card can also signal an upset to your work-life balance. You may be working more hours than you expected and your family life is suffering as a result.",
                :finances => "When it comes to your finances, the reversed ten of cups can signal domestic disharmony regarding issues of money. You may be faced with disputes at home about how much you should be spending, or how much of what you have is yours versus someone else's. There can be a basic feeling of financial instability at home that can add to this nervous atmosphere. Your finances and your emotions are likely to be deeply connected right now, and resolving issues in one or the other may be helpful in clearing out the whole mess."
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
  when "the empress"
    print_empty_line
    puts empress_meanings[card_orientation][category]
    print_empty_line
  when "the emperor"
    print_empty_line
    puts emperor_meanings[card_orientation][category]
    print_empty_line
  when "ten of cups"
    print_empty_line
    puts ten_of_cups_meanings[card_orientation][category]
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
  print_empty_line
  puts "To manually enter your cards, select from the following options:"
  print_empty_line
  puts "   1 - The past..."
  puts "   2 - The present..."
  puts "   3 - The future..."
  print_empty_line
  puts "Or will you leave it to fate?"
  print_empty_line
  puts "   4 - I'm feeling lucky..."
  print_empty_line
  puts "Extra options:"
  puts "   5 - Source"
  puts "   X - I've seen enough..."
  print_empty_line

  selection_choice = gets.chomp.downcase

  case selection_choice
  when "1"
    user_time = time_period_selection(selection_choice)
    print_in_box("A reading for the #{user_time}...")
    print_empty_line
    manual_card_selection(user_time)
  when "2"
    user_time = time_period_selection(selection_choice)
    print_in_box("A reading for the #{user_time}...")
    print_empty_line
    manual_card_selection(user_time)
  when "3"
    user_time = time_period_selection(selection_choice)
    print_in_box("A reading for the #{user_time}...")
    print_empty_line
    manual_card_selection(user_time)
  when "4"
    feeling_lucky
  when "5"
    print_empty_line
    print_source
    print_empty_line
    puts "[I claim no responsibility for the truths you find...]"
    print_empty_line
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
puts "See you next time, #{USERNAME}..."
print_empty_line
print_empty_line
print_empty_line
print_source